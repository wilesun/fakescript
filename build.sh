#! /bin/sh

BUILD_FLAG=""

if [ $# == 1 ] && [ $1 == "release" ];then
    BUILD_FLAG=" -DREMOD=ON"
fi

cd src/flexbison
flex -o ../flex.cpp flex.l
bison -v -t -d bison.y
mv bison.tab.c ../bison.cpp
mv bison.tab.h	../bison.h
cd ../../

#lib
rm CMakeCache.txt -rf
rm CMakeFiles -rf
rm cmake_install.cmake -rf
rm Makefile -rf
cmake . $BUILD_FLAG
make clean
make -j5

#fake
cd fake
rm CMakeCache.txt -rf
rm CMakeFiles -rf
rm cmake_install.cmake -rf
rm Makefile -rf
cmake . $BUILD_FLAG
make clean
make -j5
cd ..

#luatest
cd luatest
rm CMakeCache.txt -rf
rm CMakeFiles -rf
rm cmake_install.cmake -rf
rm Makefile -rf
cmake . $BUILD_FLAG
make clean
make -j5

echo "build ok"
