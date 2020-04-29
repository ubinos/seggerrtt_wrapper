set(INCLUDE__APP TRUE)
set(APP__NAME "seggerrtt_menuapp")

get_filename_component(_tmp_source_dir "${SEGGERRTT__BASE_DIR}/" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/Examples/Main_RTT_MenuApp.c)


