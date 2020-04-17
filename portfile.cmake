include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VeriBlock/alt-integration-cpp
    REF 7362db2fb529157d39d4273f45b36e0fa0f1f7f7
    HEAD_REF master
    SHA512 7635afd021b1780b37afaac4843653ffbd3ad0f832b75b01dbecfb2d90ef15950bd6b35e4f37bb196f6393828b1aa3fcdf4bac9a4694f0e848de39c4624ecac0 
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DUBSAN:BOOL=OFF
        -DTSAN:BOOL=OFF
        -DASAN:BOOL=OFF
        -DSHARED:BOOL=OFF
        -DWITH_ROCKS:BOOL=${WITH_ROCKSDB}
        -DTESTING:BOOL=OFF
        -DFIND_ROCKSDB:BOOL=ON
        -DCMAKE_DEBUG_POSTFIX=d
)

vcpkg_install_cmake()

file(COPY ${CURRENT_PACKAGES_DIR}/debug/lib/cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/)
file(COPY ${CURRENT_PACKAGES_DIR}/lib/cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/cmake")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/cmake")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
