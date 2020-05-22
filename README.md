# tensorflow-lib-cmake

## Goals

- full access to the tensorflow c++ library
- compile your own library / executables using cmake
- use cmake to link against tensorflow
- ???
- profit

## Build

- clone this repo: `git clone --recursive https://github.com/niklasfi/tensorflow-lib-cmake.git`
- if you feel lucky, update the tensorflow submodule with `git submodule update` to the latest master commit
- build tensorflow, either by
  - using `./build-tensorflow.sh` supplied in this repo
  - or downloading and building tensorflow on your own
- that's it!

## Use (your own lib)

If you started googling _tensorflow cmake_ you probably have a cmake project that you want to integrate a tensorflow component into. If that is what you want, these are the steps for you:

- copy & paste the
  ```
  ######################################## LIBS ########################################
  ```
  section to your project's `CMakeLists.txt`. Make sure `$TF_ROOT` points to your tensorflow source folder
- enjoy


## Use (from this repo)

Maybe you just want to try out how this project works, or you are starting a completely new project utilizing tensorflow. If so, use these steps:

- create a cmake build directory: `mkdir build && cd build && cmake ..`
- build the `hello` test executable: `make` from within the `build` directory
- run `hello`: `./hello` from within the `build` directory to see tensorflow working
- add your own source files and targets to `CMakeLists.txt` as you desire
