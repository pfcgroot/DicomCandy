cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    DicomCandy
    VERSION 0.1.0
    DESCRIPTION "DICOM management and processing tools"
    HOMEPAGE_URL "https://github.com/pfcgroot/DicomCandy"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    DicomCandy_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    DicomCandy_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(DicomCandy_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(DicomCandy_exe source/main.cpp)
add_executable(DicomCandy::exe ALIAS DicomCandy_exe)

set_property(TARGET DicomCandy_exe PROPERTY OUTPUT_NAME DicomCandy)

target_compile_features(DicomCandy_exe PRIVATE cxx_std_17)

target_link_libraries(DicomCandy_exe PRIVATE DicomCandy_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT DicomCandy_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of DicomCandy"
  )
endif()

include(cmake/dev-mode.cmake)
