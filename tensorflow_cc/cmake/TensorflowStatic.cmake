cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
include(ExternalProject)

if(SYSTEM_PROTOBUF)
ExternalProject_Add(
  tensorflow_static
  DEPENDS tensorflow_base
  TMP_DIR "/tmp"
  STAMP_DIR "tensorflow-stamp"
  SOURCE_DIR "tensorflow"
  BUILD_IN_SOURCE 1
  DOWNLOAD_COMMAND ""
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/cmake/build.sh
            COMMAND cp "${CMAKE_CURRENT_SOURCE_DIR}/cmake/copy_links.sh" .
            COMMAND ./copy_links.sh .
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)
endif()
