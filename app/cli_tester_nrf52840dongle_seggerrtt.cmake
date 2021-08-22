set_cache(UBINOS__BSP__USE_DTTY TRUE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(SEGGERRTT__DTTY_ENABLE TRUE BOOL)

set_cache(UBINOS__UBICLIB__EXCLUDE_CLI FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dongle.cmake)

include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)

include(${PROJECT_UBINOS_DIR}/app/cli_tester.cmake)


