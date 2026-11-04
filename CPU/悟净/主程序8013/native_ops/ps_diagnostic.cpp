// CPU FP64 kernels. No device, ADC, motor, filesystem or model-training access.
#include <cmath>
#include <complex>
#include <cstdint>
#include <limits>
#ifdef _WIN32
#define API extern "C" __declspec(dllexport)
#else
#define API extern "C" __attribute__((visibility("default")))
#endif
using Z=std::complex<double>;
static double clip(double x,double lo,double hi){return x<lo?lo:(x>hi?hi:x);}
API int psdiag_abi(){return 1;}

API int ps_wave_predict(int F,int I,int L,const double* x,const double* dc,
                       const double* v,const double* q,double floor_V,double* out){
    if(F<1||F>4096||I<1||I>36||L<1||L>256||!(floor_V>=0)||!std::isfinite(floor_V))return 1;
    for(int f=0;f<F;++f){
        const double* xf=x+static_cast<size_t>(f)*L;
        for(int i=0;i<I;++i){
            double mean[3]={0,0,0},power[3]={0,0,0};Z ph[3]={Z(0,0),Z(0,0),Z(0,0)};
            for(int c=0;c<3;++c){
                size_t base=(static_cast<size_t>(i)*3+c)*L;
                for(int l=0;l<L;++l){
                    if(c==2)mean[c]+=xf[l]*dc[base+l];
                    ph[c]+=xf[l]*Z(v[2*(base+l)],v[2*(base+l)+1]);
                    if(c==2)for(int k=0;k<L;++k)power[c]+=(xf[l]*q[(base+l)*L+k])*xf[k];
                }
                if(!std::isfinite(mean[c])||!std::isfinite(ph[c].real())||!std::isfinite(ph[c].imag())||!std::isfinite(power[c]))return 2;
            }
            double a=std::abs(ph[0]);if(!(a>0.)||!std::isfinite(a))return 3;
            Z ca=ph[2]/ph[0],ba=ph[1]/ph[0];double* y=out+(static_cast<size_t>(f)*I+i)*6;
            y[0]=ca.real();y[1]=ca.imag();y[2]=mean[2]/a;
            y[3]=std::sqrt((power[2]>0?power[2]:0)+floor_V*floor_V)/a;
            y[4]=ba.real();y[5]=ba.imag();
            for(int k=0;k<6;++k)if(!std::isfinite(y[k]))return 2;
        }
    }
    return 0;
}

static int gains(const double* pred,const double* obs,const double* scale,
                 const uint8_t* mask,int N,int is_B,Z* gain,double& offset){
    int measured=0;for(int i=0;i<N;++i)measured+=mask[i]!=0;if(!measured)return 4;
    for(int pair=0;pair<2;++pair){
        int k=pair?4:0;Z numerator(0,0);double denominator=0.;
        for(int i=0;i<N;++i)if(mask[i]){
            const double* p=pred+i*6;const double* o=obs+i*6;const double* s=scale+i*6;
            if(!(s[k]>0)||!(s[k+1]>0)||!std::isfinite(s[k])||!std::isfinite(s[k+1]))return 5;
            double weight=2./(s[k]*s[k]+s[k+1]*s[k+1]);Z a(p[k],p[k+1]),b(o[k],o[k+1]);
            numerator+=(std::conj(a)*b)*weight;denominator+=std::norm(a)*weight;
        }
        Z g=denominator>1e-10?numerator/denominator:Z(1,0);
        double angle=clip(std::arg(g),-.004,.004),magnitude=clip(std::abs(g),.996,1.004);
        gain[pair]=magnitude*Z(std::cos(angle),std::sin(angle));
    }
    offset=0.;if(is_B){for(int i=0;i<N;++i)if(mask[i])offset+=obs[i*6+2]-pred[i*6+2];offset=clip(offset/measured,-.001,.001);}
    return 0;
}
static void adjusted_row(const double* p,const Z* gain,double offset,double* out){
    Z a=Z(p[0],p[1])*gain[0],b=Z(p[4],p[5])*gain[1];
    out[0]=a.real();out[1]=a.imag();out[2]=p[2]+offset;out[3]=p[3];out[4]=b.real();out[5]=b.imag();
}

API int ps_adjust(int F,int N,int is_B,const double* pred,const double* obs,
                  const double* scale,const uint8_t* mask,double* out){
    if(F<1||F>4096||N<1||N>36||(is_B!=0&&is_B!=1))return 1;
    for(int f=0;f<F;++f){const double* p=pred+static_cast<size_t>(f)*N*6;double* y=out+static_cast<size_t>(f)*N*6;Z gain[2];double offset;
        int error=gains(p,obs,scale,mask,N,is_B,gain,offset);if(error)return error;
        for(int i=0;i<N;++i){adjusted_row(p+i*6,gain,offset,y+i*6);for(int k=0;k<6;++k)if(!std::isfinite(y[i*6+k]))return 2;}
    }return 0;
}

API int ps_fit_batch(int C,int R,int N,int is_B,const int32_t* offsets,
    const double* pred,const double* obs,const double* scale,const double* noise,
    const uint8_t* mask,const uint8_t* cm,double* scores,double* deviations,
    int32_t* argmin,double* best){
    if(C<1||C>26||R<C||R>4096||N<1||N>36||(is_B!=0&&is_B!=1)||offsets[0]!=0||offsets[C]!=R)return 1;
    int measured=0,features=0;for(int i=0;i<N;++i)measured+=mask[i]!=0;for(int k=0;k<6;++k)features+=cm[k]!=0;
    if(!measured||!features)return 4;
    for(int c=0;c<C;++c){
        if(offsets[c]>=offsets[c+1]||offsets[c]<0||offsets[c+1]>R)return 1;
        const double* s=scale+static_cast<size_t>(c)*N*6;double lowest=std::numeric_limits<double>::infinity();int winner=offsets[c];
        for(int row=offsets[c];row<offsets[c+1];++row){
            const double* p=pred+static_cast<size_t>(row)*N*6;Z gain[2];double offset;int error=gains(p,obs,s,mask,N,is_B,gain,offset);if(error)return error;
            double mse=0.,deviance=0.;
            for(int i=0;i<N;++i)if(mask[i]){double value[6];adjusted_row(p+i*6,gain,offset,value);
                for(int k=0;k<6;++k)if(cm[k]){size_t j=i*6+k;if(!(s[j]>0)||!(noise[j]>0)||!std::isfinite(s[j])||!std::isfinite(noise[j]))return 5;
                    double d=value[k]-obs[j],a=d/s[j],b=d/noise[j];mse+=a*a;deviance+=b*b;}
            }
            mse/=measured*features;if(!std::isfinite(mse)||!std::isfinite(deviance))return 2;
            scores[row]=mse;deviations[row]=deviance;if(mse<lowest){lowest=mse;winner=row;}
        }
        argmin[c]=winner-offsets[c];const double* p=pred+static_cast<size_t>(winner)*N*6;double* y=best+static_cast<size_t>(c)*N*6;
        Z gain[2];double offset;int error=gains(p,obs,s,mask,N,is_B,gain,offset);if(error)return error;
        for(int i=0;i<N;++i)adjusted_row(p+i*6,gain,offset,y+i*6);
    }
    return 0;
}
