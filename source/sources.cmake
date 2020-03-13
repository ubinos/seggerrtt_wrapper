if(INCLUDE__SEGGERRTT)

get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/seggerrtt/" ABSOLUTE)

include_directories(${_tmp_source_dir}/RTT)

set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/RTT/SEGGER_RTT.c)
set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/RTT/SEGGER_RTT_printf.c)
set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/RTT/SEGGER_RTT_ASM_ARMv7M.S)

endif(INCLUDE__SEGGERRTT)


