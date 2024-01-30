include(LibFindMacros)

GetBinaryDep(TARGET winpty
    INSTALL_COMMAND ${CMAKE_COMMAND} -E make_directory ${DEPS_INSTALL_DIR}/bin
      COMMAND ${CMAKE_COMMAND} -DFROM_GLOB=${DEPS_BUILD_DIR}/src/winpty/${TARGET_ARCH}/bin/*
        -DTO=${DEPS_INSTALL_DIR}/bin/
        -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CopyFilesGlob.cmake
      COMMAND ${CMAKE_COMMAND} -DFROM_GLOB=${DEPS_BUILD_DIR}/src/winpty/include/*
        -DTO=${DEPS_INSTALL_DIR}/include/
        -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CopyFilesGlob.cmake
      COMMAND ${CMAKE_COMMAND} -DFROM_GLOB=${DEPS_BUILD_DIR}/src/winpty/${TARGET_ARCH}/lib/*
        -DTO=${DEPS_INSTALL_DIR}/lib/
        -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CopyFilesGlob.cmake)

find_path(WINPTY_INCLUDE_DIR winpty.h)
set(WINPTY_INCLUDE_DIRS ${WINPTY_INCLUDE_DIR})

find_library(WINPTY_LIBRARY winpty)
find_program(WINPTY_AGENT_EXE winpty-agent.exe)
set(WINPTY_LIBRARIES ${WINPTY_LIBRARY})

find_package_handle_standard_args(Winpty DEFAULT_MSG WINPTY_LIBRARY WINPTY_INCLUDE_DIR)

