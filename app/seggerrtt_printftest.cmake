set(INCLUDE__APP TRUE)
set(APP__NAME "seggerrtt_printftest")

get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/seggerrtt/" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/Examples/Main_RTT_PrintfTest.c)

