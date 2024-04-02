# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(OptNative)
# Env
set(CMAKE_CXX_STANDARD 17)
set(LINK_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/../../../libs/arm64-v8a)
set(PYTORCH_INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/headers/pytorch)
set(UTF8PROC_INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/headers/utf8proc)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}/headers
                    ${PYTORCH_INCLUDE_PATH}/include
                    ${PYTORCH_INCLUDE_PATH}/include/torch/csrc/api/include
                    ${OPENCV_INCLUDE_PATH}
                    ${UTF8PROC_INCLUDE_PATH})


set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
file(GLOB SOURCES "${SOURCE_DIR}/*.cpp" "${SOURCE_DIR}/*.c")

if (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    add_library(optnative SHARED ${SOURCES})
    # add_executable(optnative ${SOURCES})
    target_link_libraries(optnative PUBLIC libace_napi.z.so)
    target_link_libraries(optnative PUBLIC hilog_ndk.z)

    # Pytorch Lib
    set(PYTORCH_LIBRARY "${LINK_DIRS}/libtorch_cpu.so")
    set(C10_LIBRARY "${LINK_DIRS}/libc10.so")
    set(PYTORCH_0_LIBRARY "${LINK_DIRS}/libtorch.so")
    set(TORCH_GLOBAL_DEPS_LIBRARY "${LINK_DIRS}/libtorch_global_deps.so")
    # utf8proc lib
    set(UTF8PROC_LIBRARY "${LINK_DIRS}/libutf8proc.so")


    message(PYTORCH_LIBRARY "####PYTORCH_LIBRARY####: ${PYTORCH_LIBRARY}")
    message(C10_LIBRARY "####C10_LIBRARY####: ${C10_LIBRARY}")
    message(PYTORCH_0_LIBRARY "####PYTORCH_0_LIBRARY####: ${PYTORCH_0_LIBRARY}")
    message(TORCH_GLOBAL_DEPS_LIBRARY "####TORCH_GLOBAL_DEPS_LIBRARY####: ${TORCH_GLOBAL_DEPS_LIBRARY}")
    # Pytorch
    target_link_libraries(optnative PUBLIC ${PYTORCH_LIBRARY})
    target_link_libraries(optnative PUBLIC ${C10_LIBRARY})
    target_link_libraries(optnative PUBLIC ${PYTORCH_0_LIBRARY})
    target_link_libraries(optnative PUBLIC ${TORCH_GLOBAL_DEPS_LIBRARY})
    # utf8proc
    target_link_libraries(optnative PUBLIC ${UTF8PROC_LIBRARY})

    #target_link_libraries(optnative PUBLIC rawfile.z)


endif()