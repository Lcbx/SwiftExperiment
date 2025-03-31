## swiftengine
the idea was to use swift to use cpp libraries and build an engine this way  
swift is more fun than cpp imho (better syntax & features like async/await, type extensions, ranges & slices, ..)

#### NOTES
* to import a c++ lib you need to :
  - add their subdirectory with CMAKE
  - add a 'module.modulemap' file with the header file names in the include dir
* swift struggles with c++ templates (= generics)
* might need to create bridging / interfaces classes
  - it would make using vcpkg easier
  - but it adds friction to dev