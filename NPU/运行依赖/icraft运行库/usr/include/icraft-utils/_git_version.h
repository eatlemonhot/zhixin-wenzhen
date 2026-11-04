#pragma once

#include <string>

namespace icraft::utils {
	constexpr uint64_t MAJOR_VERSION_NUM = 3;
	constexpr uint64_t MINOR_VERSION_NUM = 36;
	constexpr uint64_t PATCH_VERSION_NUM = 1;
	constexpr uint64_t COMMITSINCETAG = 0;

	constexpr std::string_view COMMITID = "27cf6a7";
	constexpr std::string_view MODIFIED = "";
	constexpr std::string_view BUILDTIME = "2604032209";

	constexpr std::string_view MAIN_VERSION = "3.36.1.0";
	constexpr std::string_view FULL_VERSION = "3.36.1.0-27cf6a7(2604032209)";

    static constexpr std::string_view __version_string__ = "full_version: 3.36.1.0-27cf6a7(2604032209)";
}
    