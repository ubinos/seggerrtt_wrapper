set(INCLUDE__SEGGERRTT TRUE)

set_cache_default(SEGGERRTT__DTTY_ENABLE FALSE BOOL "")

set_cache_default(SEGGERRTT__SEGGER_RTT_MAX_NUM_UP_BUFFERS 3 STRING "")
set_cache_default(SEGGERRTT__SEGGER_RTT_MAX_NUM_DOWN_BUFFERS 3 STRING "")
set_cache_default(SEGGERRTT__BUFFER_SIZE_UP 1024 STRING "")
set_cache_default(SEGGERRTT__BUFFER_SIZE_DOWN 16 STRING "")

####

get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/seggerrtt/" ABSOLUTE)

include_directories(${_tmp_source_dir})

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_init")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_enable")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_disable")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_geterror")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_getc")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_putc")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u dtty_kbhit")


