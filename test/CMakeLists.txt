# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(DicomCandyTests LANGUAGES CXX)

# ---- Tests ----

add_executable(DicomCandy_test source/DicomCandy_test.cpp)
target_link_libraries(DicomCandy_test PRIVATE DicomCandy_lib)
target_compile_features(DicomCandy_test PRIVATE cxx_std_17)

add_test(NAME DicomCandy_test COMMAND DicomCandy_test)

# ---- End-of-file commands ----

add_folders(Test)
