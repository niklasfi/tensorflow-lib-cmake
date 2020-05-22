cmake_minimum_required(VERSION 3.17)
project(tensorflow-lib-cmake)

set(CMAKE_CXX_STANDARD 20)

######################################## LIBS ########################################

#tensorflow
set(TF_ROOT ${CMAKE_CURRENT_LIST_DIR}/tensorflow)

include_directories(SYSTEM ${TF_ROOT}/bazel-bin/)
include_directories(SYSTEM ${TF_ROOT}/bazel-tensorflow/)
include_directories(SYSTEM ${TF_ROOT}/bazel-tensorflow/external/eigen_archive/)
include_directories(SYSTEM ${TF_ROOT}/bazel-tensorflow/external/com_google_absl/)
include_directories(SYSTEM ${TF_ROOT}/bazel-tensorflow/external/com_google_protobuf/src/)

set(TF_LIBS ${TF_ROOT}/bazel-bin/tensorflow/libtensorflow_cc.so ${TF_ROOT}/bazel-bin/tensorflow/libtensorflow_framework.so.2)

######################################## END OF LIBS ########################################

add_executable(hello hello.cpp)
target_link_libraries(hello ${TF_LIBS})