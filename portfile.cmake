include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VeriBlock/alt-integration-cpp
    REF f0f9c89cad815cc77b8bd67b489a1d873c3711b9
    HEAD_REF master
    SHA512 06c39c5a15d0e892fc5125d744eeaff9f99b52f4b6adf8dc9cea4624c14e3e054fa0ba0a09ae8c23003dc83e9ee6355c3807397895cade700235c3d42efdbfa9
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
        -DTESTING:BOOL=OFF
        -DWITH_SECP256K1:BOOL=OFF
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
