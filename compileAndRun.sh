#!bash

cmake -B build -G 'Ninja'
cd build
ninja
./swiftEngine.exe