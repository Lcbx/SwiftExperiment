cmake_minimum_required(VERSION 3.26)


# based on https://github.com/apple/swift-cmake-examples
project(SwiftEngine LANGUAGES Swift CXX C)

# Verify that we have a new enough compiler
if("${CMAKE_Swift_COMPILER_VERSION}" VERSION_LESS 5.9)
  message(FATAL_ERROR "Bidirectional C++ Interop requires Swift 5.9 or greater. Have ${CMAKE_Swift_COMPILER_VERSION}")
endif()

if(NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" AND
   NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
  message(FATAL_ERROR "Project requires building with Clang.
  Have ${CMAKE_CXX_COMPILER_ID}")
endif()

#list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
#include(InitializeSwift)
#include(AddSwift)

set(CMAKE_OSX_DEPLOYMENT_TARGET 13.0)
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(extern)

add_executable(swiftEngine main.swift)

target_compile_options(swiftEngine PRIVATE -cxx-interoperability-mode=default)

target_link_libraries(swiftEngine PRIVATE ginseng)


# not elegant, but gentlemen, we have flight
configure_file("extern/raylib_dll/raylib.dll" "raylib.dll" COPYONLY)
target_compile_options(swiftEngine PRIVATE -I ${CMAKE_CURRENT_SOURCE_DIR}/extern/raylib_dll -L ${CMAKE_CURRENT_SOURCE_DIR}/extern/raylib_dll -Xlinker ${CMAKE_CURRENT_SOURCE_DIR}/extern/raylib_dll/raylib.lib )
