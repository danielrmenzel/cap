# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BINARY_7Z "")
set(CPACK_BINARY_BUNDLE "")
set(CPACK_BINARY_CYGWIN "")
set(CPACK_BINARY_DEB "OFF")
set(CPACK_BINARY_DRAGNDROP "")
set(CPACK_BINARY_FREEBSD "OFF")
set(CPACK_BINARY_IFW "OFF")
set(CPACK_BINARY_NSIS "OFF")
set(CPACK_BINARY_NUGET "")
set(CPACK_BINARY_OSXX11 "")
set(CPACK_BINARY_PACKAGEMAKER "")
set(CPACK_BINARY_PRODUCTBUILD "")
set(CPACK_BINARY_RPM "OFF")
set(CPACK_BINARY_STGZ "ON")
set(CPACK_BINARY_TBZ2 "OFF")
set(CPACK_BINARY_TGZ "ON")
set(CPACK_BINARY_TXZ "OFF")
set(CPACK_BINARY_TZ "ON")
set(CPACK_BINARY_WIX "")
set(CPACK_BINARY_ZIP "")
set(CPACK_BUILD_SOURCE_DIRS "/home/dan/master_thesis/cap/libs/capstone;/home/dan/master_thesis/cap/libs")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "x86")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "/home/dan/master_thesis/cap/libs/capstone/packages/deb/triggers")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>= 2.2.5)")
set(CPACK_DEBIAN_PACKAGE_FILE_NAME "libcapstone-dev_6.0.0_x86")
set(CPACK_DEBIAN_PACKAGE_MULTIARCH "same")
set(CPACK_DEBIAN_PACKAGE_NAME "libcapstone-dev")
set(CPACK_DEBIAN_PACKAGE_ORIGINAL_MAINTAINER "Debian Security Tools <team+pkg-security@tracker.debian.org>")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_SECTION "libdevel")
set(CPACK_DEBIAN_PACKAGE_SOURCE "capstone")
set(CPACK_DEBIAN_PACKAGE_VERSION "6.0.0")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.16/Templates/CPack.GenericDescription.txt")
set(CPACK_DMG_PACKAGE_FILE_NAME "capstone-6.0.0")
set(CPACK_GENERATOR "STGZ;TGZ;TZ")
set(CPACK_INSTALL_CMAKE_PROJECTS "/home/dan/master_thesis/cap/libs;capstone;ALL;/")
set(CPACK_INSTALL_PREFIX "/home/dan/emsdk/upstream/emscripten/cache/sysroot")
set(CPACK_MODULE_PATH "/home/dan/emsdk/upstream/emscripten/cmake/Modules;/home/dan/emsdk/upstream/emscripten/cmake/Modules;/home/dan/emsdk/upstream/emscripten/cmake/Modules;/home/dan/emsdk/upstream/emscripten/cmake/Modules;/home/dan/emsdk/upstream/emscripten/cmake/Modules")
set(CPACK_NSIS_DISPLAY_NAME "capstone 6.0.0")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_FILE_NAME "capstone-6.0.0-")
set(CPACK_NSIS_PACKAGE_NAME "capstone 6.0.0")
set(CPACK_OUTPUT_CONFIG_FILE "/home/dan/master_thesis/cap/libs/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "Rot127 <unisono@quyllur.org>")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION "Capstone is a lightweight multi-platform, multi-architecture disassembly framework. These are the development headers and libraries.
 Features:
 - Support hardware architectures: AArch64, ARM, Alpha, BPF, EVM, HPPA, LongArch, M680X, M68K, MOS65XX, Mips, PowerPC, RISCV, SH, Sparc, SystemZ, TMS320C64x, TriCore, WASM, x86, XCore, Xtensa.
 - Clean/simple/lightweight/intuitive architecture-neutral API.
 - Provide details on disassembled instructions (called \"decomposer\" by some others).
 - Provide some semantics of the disassembled instruction, such as list of implicit registers read & written.
 - Thread-safe by design.
 - Special support for embedding into firmware or OS kernel.
 - Distributed under the open source BSD license.")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.16/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Lightweight multi-architecture disassembly framework - devel files")
set(CPACK_PACKAGE_FILE_NAME "capstone-6.0.0-Emscripten")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://www.capstone-engine.org/")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "capstone 6.0.0")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "capstone 6.0.0")
set(CPACK_PACKAGE_NAME "capstone")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Rot127")
set(CPACK_PACKAGE_VERSION "6.0.0")
set(CPACK_PACKAGE_VERSION_MAJOR "6")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PROJECT_CONFIG_FILE "/home/dan/master_thesis/cap/libs/capstone/CPackConfig.cmake")
set(CPACK_RESOURCE_FILE_LICENSE "/home/dan/master_thesis/cap/libs/capstone/LICENSES/LICENSE.TXT")
set(CPACK_RESOURCE_FILE_README "/usr/share/cmake-3.16/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/share/cmake-3.16/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_CHANGELOG_FILE "/home/dan/master_thesis/cap/libs/capstone/ChangeLog")
set(CPACK_RPM_PACKAGE_ARCHITECTURE "x86")
set(CPACK_RPM_PACKAGE_DESCRIPTION "Capstone is a lightweight multi-platform, multi-architecture disassembly framework. These are the development headers and libraries.
 Features:
 - Support hardware architectures: AArch64, ARM, Alpha, BPF, EVM, HPPA, LongArch, M680X, M68K, MOS65XX, Mips, PowerPC, RISCV, SH, Sparc, SystemZ, TMS320C64x, TriCore, WASM, x86, XCore, Xtensa.
 - Clean/simple/lightweight/intuitive architecture-neutral API.
 - Provide details on disassembled instructions (called \"decomposer\" by some others).
 - Provide some semantics of the disassembled instruction, such as list of implicit registers read & written.
 - Thread-safe by design.
 - Special support for embedding into firmware or OS kernel.
 - Distributed under the open source BSD license.")
set(CPACK_RPM_PACKAGE_FILE_NAME "capstone-devel-6.0.0.x86")
set(CPACK_RPM_PACKAGE_GROUP "Development/Libraries")
set(CPACK_RPM_PACKAGE_LICENSE "BSD3, LLVM")
set(CPACK_RPM_PACKAGE_NAME "capstone-devel")
set(CPACK_RPM_PACKAGE_REQUIRES "glibc >= 2.2.5")
set(CPACK_RPM_PACKAGE_VERSION "6.0.0")
set(CPACK_RPM_POST_INSTALL_SCRIPT_FILE "/home/dan/master_thesis/cap/libs/capstone/packages/rpm/postinstall.sh")
set(CPACK_RPM_POST_UNINSTALL_SCRIPT_FILE "/home/dan/master_thesis/cap/libs/capstone/packages/rpm/postinstall.sh")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_7Z "")
set(CPACK_SOURCE_CYGWIN "")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/home/dan/master_thesis/cap/libs/CPackSourceConfig.cmake")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_STRIP_FILES "false")
set(CPACK_SYSTEM_NAME "Emscripten")
set(CPACK_TOPLEVEL_TAG "Emscripten")
set(CPACK_WIX_SIZEOF_VOID_P "4")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/home/dan/master_thesis/cap/libs/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
