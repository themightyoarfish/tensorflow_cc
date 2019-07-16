cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
include(ExternalProject)

if(SYSTEM_PROTOBUF)
    ExternalProject_Add(
        tensorflow_base
        GIT_REPOSITORY "${TENSORFLOW_REMOTE}"
        GIT_TAG ${TENSOFLOW_TAG}
        TMP_DIR "/tmp"
        STAMP_DIR "tensorflow-stamp"
        DOWNLOAD_DIR "tensorflow"
        SOURCE_DIR "tensorflow"
        BUILD_IN_SOURCE 1
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND make -f tensorflow/contrib/makefile/Makefile clean
        COMMAND sed -i "134d" tensorflow/contrib/makefile/download_dependencies.sh
        COMMAND sed -i "142,143d" tensorflow/contrib/makefile/download_dependencies.sh
        COMMAND sed -i "42d" tensorflow/contrib/makefile/build_all_linux.sh
        COMMAND tensorflow/contrib/makefile/download_dependencies.sh
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        )
else()
    ExternalProject_Add(
        tensorflow_base
        GIT_REPOSITORY "${TENSORFLOW_REMOTE}"
        GIT_TAG ${TENSOFLOW_TAG}
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
endif()
