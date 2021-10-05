#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set(INCLUDE__APP TRUE)
set(APP__NAME "seggerrtt_printftest")

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk_baremetal.cmake)
include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)

get_filename_component(_tmp_source_dir "${SEGGERRTT__BASE_DIR}/" ABSOLUTE)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/Examples/Main_RTT_PrintfTest.c)

