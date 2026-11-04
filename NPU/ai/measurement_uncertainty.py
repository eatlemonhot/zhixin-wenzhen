"""B profile precision covariance: averaging does not remove capture drift.

The independent simulation contract draws .0007 common and .0002 channel
complex gain/phase per new capture; DC offset .0002 and residual relative
.0005 are systematic. These terms are not divided by sqrt(frame count).
"""
import numpy as np
def noise(reference,frames):
    ref=np.asarray(reference,float);floor,relative=(.0005,.0012) if frames==16 else (.00015,.0003)
    out=floor+relative*abs(ref)
    for k in (0,4):
        amplitude=np.hypot(ref[...,k],ref[...,k+1]);sigma=floor+relative*amplitude
        if frames==256:sigma=np.sqrt(sigma**2+(.0007**2+.0002**2)*amplitude**2)
        out[...,k]=out[...,k+1]=sigma
    if frames==256:
        out[...,2]=np.sqrt(out[...,2]**2+.0002**2)
        out[...,3]=np.sqrt(out[...,3]**2+(.0005*ref[...,3])**2)
    return out
