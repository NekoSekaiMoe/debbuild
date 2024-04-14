cmake_minimum_required(VERSION 3.10)

# set the project name
project(moe-container-manager-interface)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
add_compile_options("-Wno-unused-result")
add_compile_options("-O2")
add_compile_options("-std=c++17")

find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

# add the executable
add_executable(history history.cpp)

set(CMAKE_EXE_LINKER_FLAGS "-static -z now ")
install (TARGETS history DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/./out)
