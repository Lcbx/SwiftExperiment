
add_subdirectory(ginseng-ecs)


# using virtual file system to inject the modulemap
# based on https://www.swift.org/documentation/articles/wrapping-c-cpp-library-in-swift.html
function(install_modulemap name include_dir)
  set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${include_dir}")
  set(MODULEMAP_FILE "${CMAKE_CURRENT_SOURCE_DIR}/${name}.modulemap")

  set(VFS_FILE "${CMAKE_CURRENT_BINARY_DIR}/${name}.yaml")
  configure_file(module-vfs.yaml ${VFS_FILE})

  target_compile_options(${name} INTERFACE
    "$<$<COMPILE_LANGUAGE:Swift>:SHELL:-vfsoverlay ${VFS_FILE}>"
  )
endfunction()

install_modulemap(ginseng "ginseng-ecs/include/ginseng")

# does not work, missing system links
#target_compile_options(raylib INTERFACE -lgdi32)
#install_modulemap(raylib "raylib/src")
