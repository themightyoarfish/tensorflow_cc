cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
include(ExternalProject)

message(STATUS "Downloading Tensorflow from ${TENSORFLOW_REMOTE}")
message(STATUS "Using Tensorflow tag ${TENSORFLOW_TAG}")

ExternalProject_Add(
    tensorflow_base
    GIT_REPOSITORY "${TENSORFLOW_REMOTE}"
    GIT_TAG ${TENSORFLOW_TAG}
    GIT_PROGRESS ON
    TMP_DIR "/tmp"
    STAMP_DIR "tensorflow-stamp"
    DOWNLOAD_DIR "tensorflow"
    SOURCE_DIR "tensorflow"
    BUILD_IN_SOURCE 1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND make -f tensorflow/contrib/makefile/Makefile clean
    COMMAND tensorflow/contrib/makefile/download_dependencies.sh
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    )
