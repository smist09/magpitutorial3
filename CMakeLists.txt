cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)
project(HelloMagPi C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

include_directories(${CMAKE_SOURCE_DIR})

add_executable(HelloMagPi
  HelloMagPi.S
)

pico_enable_stdio_uart(HelloMagPi 1)
pico_enable_stdio_usb(HelloMagPi 0)

pico_add_extra_outputs(HelloMagPi)

target_link_libraries(HelloMagPi pico_stdlib)
