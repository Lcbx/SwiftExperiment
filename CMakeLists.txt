cmake_minimum_required(VERSION 3.26)


project(SwiftEngine LANGUAGES CXX Swift)

# Verify that we have a new enough compiler
if("${CMAKE_Swift_COMPILER_VERSION}" VERSION_LESS 5.9)
  message(FATAL_ERROR "Bidirectional C++ Interop requires Swift 5.9 or greater. Have ${CMAKE_Swift_COMPILER_VERSION}")
endif()

if(NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" AND
   NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
  message(FATAL_ERROR "Project requires building with Clang.
  Have ${CMAKE_CXX_COMPILER_ID}")
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

# Set up swiftrt.o and runtime library search paths
include(InitializeSwift)
# cmake/modules/AddSwift.cmake provides the function for creating the Swift to
# C++ bridging header
include(AddSwift)


set(CMAKE_OSX_DEPLOYMENT_TARGET 13.0)
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(extern)

add_executable(swiftEngine main.swift)
target_compile_options(swiftEngine PRIVATE -cxx-interoperability-mode=default)
target_link_libraries(swiftEngine PRIVATE ginseng)