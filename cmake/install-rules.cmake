install(
    TARGETS DicomCandy_exe
    RUNTIME COMPONENT DicomCandy_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
