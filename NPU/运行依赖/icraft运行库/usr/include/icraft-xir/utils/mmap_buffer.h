#pragma once
#include <map>
#include <icraft-xir/base/object.h>
#include <icraft-utils/midware/filestream.hpp>

#ifdef _WIN32
#include <windows.h>
#endif

#ifdef __linux__
#include <sys/mman.h>
#endif

namespace icraft::xir {

#ifdef _BAREME

    class ParamsBufferStorage {
    public:
        static ParamsBufferStorage& GetInstance() {
            static ParamsBufferStorage instance;
            return instance;
        }
        char* _mallocBuffer(uint64_t, int64_t) { return nullptr; }

    private:
        ParamsBufferStorage() {}
        ~ParamsBufferStorage() {}
        ParamsBufferStorage(const ParamsBufferStorage&) = delete;
        ParamsBufferStorage& operator=(const ParamsBufferStorage&) = delete;
    };

#else

    template<typename PathType>
    std::pair<char*, uint64_t> MMapFile(const PathType& file_path, bool writable) {
        static_assert(
            std::is_same_v<PathType, std::filesystem::path> ||
            std::is_same_v<PathType, icraft::midware::path>,
            "MMapFile only supports std::filesystem::path or icraft::midware::path"
        );

    #ifdef _WIN32
        // 获取文件句柄
        HANDLE hFile;
        hFile = CreateFileW(file_path.c_str(), writable ? GENERIC_READ | GENERIC_WRITE : GENERIC_READ, FILE_SHARE_READ, NULL,
            	OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

	    ICRAFT_CHECK(hFile != INVALID_HANDLE_VALUE)
	    	.append("Create hFile failed, file path: {}!", file_path.string());

        // 获取文件大小，检查：是否获取成功
	    LARGE_INTEGER FileSize;
	    if (!GetFileSizeEx(hFile, &FileSize)) {
	        CloseHandle(hFile);
	        ICRAFT_LOG(EXCEPT).append("GetFileSizeEx failed, error code: {}", GetLastError());
	    }
        uint64_t dwFileSize = static_cast<uint64_t>(FileSize.QuadPart);

        // 文件为空，直接返回空指针和大小0
	    if (dwFileSize == 0) {
            CloseHandle(hFile);
	    	return {nullptr, 0};
	    }

        // 创建文件映射句柄
        HANDLE hMap;
        hMap = CreateFileMapping(hFile, NULL, writable ? PAGE_READWRITE : PAGE_READONLY, 0, 0, NULL);
	    if (hMap == NULL) {
	    	CloseHandle(hFile);
	    	ICRAFT_LOG(EXCEPT).append("CreateFileMapping failed, error code: {}", GetLastError());
	    }
	    CloseHandle(hFile);

        // 映射文件到虚拟地址空间
        void* addr;
        addr = MapViewOfFile(hMap, writable ? FILE_MAP_WRITE : FILE_MAP_READ, 0, 0, 0);
	    if (addr == NULL) {
	    	CloseHandle(hMap);
	    	ICRAFT_LOG(EXCEPT).append("MapViewOfFile failed, error code: {}", GetLastError());
	    }
	    CloseHandle(hMap);

	    char* mapped_ptr = (char*)addr;
	    uint64_t byte_size = dwFileSize;
    #else
        int fd;
        fd = open(file_path.c_str(), writable ? O_RDWR : O_RDONLY);
        ICRAFT_CHECK(fd != -1).append("open failed, file path: {}", file_path.string());
        
        struct stat sb;
        if (fstat(fd, &sb) == -1) {
        	close(fd);
        	ICRAFT_LOG(EXCEPT).append("fstat failed!");
        }

        if (sb.st_size == 0) {
            close(fd);
        	return {nullptr, 0};
        }

        void* addr;
        addr = mmap(NULL, sb.st_size, writable ? PROT_READ | PROT_WRITE : PROT_READ, MAP_SHARED, fd, 0);
        if (addr == MAP_FAILED) {
        	close(fd);
        	ICRAFT_LOG(EXCEPT).append("mmap failed!");
        }

        close(fd);

        char* mapped_ptr = (char*)addr;
        uint64_t byte_size = sb.st_size;
    #endif

        return {mapped_ptr, byte_size};
    }


    class ParamsBufferStorage {
    public:
        // 获取单实例对象(引用)
        XIR_DLL static ParamsBufferStorage& GetInstance();

        // 设置缓存文件夹路径
        XIR_DLL static void setBufferDir(const std::filesystem::path&);

        // 获取缓存文件夹路径
        XIR_DLL const std::filesystem::path& getBufferDir();

        // 返回分配的虚拟内存地址
        XIR_DLL char* _mallocBuffer(uint64_t malloc_size, int64_t v_id);

        // 获取内存映射表
        XIR_DLL std::map<char*, uint64_t>& getMappedPtrsMap();

        // 解除所有内存映射
        XIR_DLL void _closeMapping();

    private:
        // 禁止外部构造与析构
        ParamsBufferStorage();
        ~ParamsBufferStorage();

        // 禁止外部拷贝与赋值
        ParamsBufferStorage(const ParamsBufferStorage&) = delete;
        ParamsBufferStorage& operator=(const ParamsBufferStorage&) = delete;

        static bool instance_created_;
        static bool is_preset_;
        static std::filesystem::path buffer_root_dir_;

        std::filesystem::path buffer_dir_;
        std::map<char*, uint64_t> mapped_ptrs_map_;
        std::mutex mmap_mutex_; // 线程锁
    };

#endif
}