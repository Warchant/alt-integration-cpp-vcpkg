include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO VeriBlock/alt-integration-cpp
    REF 3df1e1ba37e2ad43f40ceaf3d2178ea55dd3dbd4
    HEAD_REF master
    SHA512 a93efe8fecdee7a4f0f198562732239b44cf8775006cdc058411dd184d56fefb64686683525b598b33d03b887a2328b419a43908549a2e3d256164a0bd4b2716 
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
