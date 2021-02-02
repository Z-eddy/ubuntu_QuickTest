cmake_minimum_required(VERSION 3.5)

project(ubuntuLocalQuickTest LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()


MESSAGE(STATUS "*********operation system is ${CMAKE_SYSTEM}")
set(CMAKE_SYSTEM_NAME Linux)
if (CMAKE_SYSTEM_NAME MATCHES "ARM")
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_SYSROOT /home/zr/raspi/sysroot)
set(CMAKE_STAGING_PREFIX /home/zr/raspi/MyProject)

set(tools /home/zr/raspi/cross-compile-tool)
set(CMAKE_C_COMPILER ${tools}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/arm-linux-gnueabihf-g++)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_SKIP_BUILD_RPATH FALSE)                 # 编译时加上RPATH  
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)         # 编译时RPATH不使用安装的RPATH  
set(CMAKE_INSTALL_RPATH "")                       # 安装RPATH为空  
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)      # 安装的执行文件不加上RPATH  
SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE) 
SET(CMAKE_INSTALL_RPATH "/home/zr/raspi/sysroot/usr/lib/arm-linux-gnueabihf/")
endif()

find_package(Qt5 COMPONENTS Core Quick REQUIRED)


if(ANDROID)
    add_library(ubuntuLocalQuickTest SHARED
      main.cpp
      qml.qrc
    )
else()
    add_executable(ubuntuLocalQuickTest
      main.cpp
      qml.qrc
    )
endif()

target_compile_definitions(ubuntuLocalQuickTest
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(ubuntuLocalQuickTest
  PRIVATE Qt5::Core Qt5::Quick)
