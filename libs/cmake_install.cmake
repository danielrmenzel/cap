# Install script for directory: /home/dan/master_thesis/cap/libs/capstone

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/dan/emsdk/upstream/emscripten/cache/sysroot")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capstone" TYPE FILE FILES
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/aarch64.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/arm64.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/arm.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/capstone.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/cs_operand.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/evm.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/wasm.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/mips.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/ppc.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/x86.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/sparc.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/systemz.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/systemz_compatibility.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/xcore.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/m68k.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/tms320c64x.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/m680x.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/mos65xx.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/bpf.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/riscv.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/sh.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/tricore.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/platform.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/sh.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/alpha.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/hppa.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/loongarch.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/xtensa.h"
    "/home/dan/master_thesis/cap/libs/capstone/include/capstone/arc.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/dan/master_thesis/cap/libs/capstone.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone" TYPE FILE FILES
    "/home/dan/master_thesis/cap/libs/capstone-config.cmake"
    "/home/dan/master_thesis/cap/libs/capstone-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/dan/master_thesis/cap/libs/libcapstone.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone/capstone-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone/capstone-targets.cmake"
         "/home/dan/master_thesis/cap/libs/CMakeFiles/Export/lib/cmake/capstone/capstone-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone/capstone-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone/capstone-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone" TYPE FILE FILES "/home/dan/master_thesis/cap/libs/CMakeFiles/Export/lib/cmake/capstone/capstone-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/capstone" TYPE FILE FILES "/home/dan/master_thesis/cap/libs/CMakeFiles/Export/lib/cmake/capstone/capstone-targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/dan/master_thesis/cap/libs/cstool.js")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cstool.js" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cstool.js")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/cstool.js")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/dan/master_thesis/cap/libs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
