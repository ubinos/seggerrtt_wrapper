/*
 Copyright (C) 2009 Sung Ho Park
 Contact: ubinos.org@gmail.com

 This file is part of the bsp_sam... component of the Ubinos.

 GNU General Public License Usage
 This file may be used under the terms of the GNU
 General Public License version 3.0 as published by the Free Software
 Foundation and appearing in the file license_gpl3.txt included in the
 packaging of this file. Please review the following information to
 ensure the GNU General Public License version 3.0 requirements will be
 met: http://www.gnu.org/copyleft/gpl.html.

 GNU Lesser General Public License Usage
 Alternatively, this file may be used under the terms of the GNU Lesser
 General Public License version 2.1 as published by the Free Software
 Foundation and appearing in the file license_lgpl.txt included in the
 packaging of this file. Please review the following information to
 ensure the GNU Lesser General Public License version 2.1 requirements
 will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.

 Commercial Usage
 Alternatively, licensees holding valid commercial licenses may
 use this file in accordance with the commercial license agreement
 provided with the software or, alternatively, in accordance with the
 terms contained in a written agreement between you and rightful owner.
 */

#include "SEGGER_RTT.h"

#if (INCLUDE__UBINOS__BSP == 1)

#if (UBINOS__BSP__USE_DTTY == 1)

#if (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL)

#if (SEGGERRTT__DTTY_ENABLE == 1)

#include <ubinos/bsp_ubik.h>

#define SLEEP_TIMEMS	1

extern int _g_bsp_dtty_init;
extern int _g_bsp_dtty_echo;

int dtty_init(void) {
    _g_bsp_dtty_echo = 0;

    _g_bsp_dtty_init = 1;

    return 0;
}

int dtty_enable(void) {
    return 0;
}

int dtty_disable(void) {
    return 0;
}

int dtty_geterror(void) {
	return 0;
}

int dtty_getc(char * ch_p) {
    unsigned int i;

    if (NULL == ch_p) {
        return -2;
    }

	if (!_g_bsp_dtty_init) {
		dtty_init();
	}

#if (INCLUDE__UBINOS__UBIK == 1)
    if (_bsp_kernel_active) {
        for (i = 0;; i++) {
            if (SEGGER_RTT_HasKey()) {
                break;
            }
            if (255 <= i) {
                bsp_task_sleepms(SLEEP_TIMEMS);
                i = 0;
            }
        }
    }
    else {
        for (i=0;; i++)
        {
            if(SEGGER_RTT_HasKey()) {
                break;
            }
        }
    }
#else
    for (i=0;; i++)
    {
        if(SEGGER_RTT_HasKey()) {
            break;
        }
    }
#endif /* (INCLUDE__UBINOS__UBIK == 1) */

    *ch_p = (char) SEGGER_RTT_GetKey();

    if (0 != _g_bsp_dtty_echo) {
        dtty_putc(*ch_p);
    }

    return 0;
}

int dtty_putc(int ch) {
	unsigned status;

	if (!_g_bsp_dtty_init) {
		dtty_init();
	}

	status = SEGGER_RTT_Write(0, &ch, 1);

	if (status == 1) {
		return 0;
	}
	else {
		return -1;
	}
}

int dtty_putn(const char * str, int len) {
    int i = 0;

    if (NULL == str) {
        return -2;
    }

    if (0 > len) {
        return -3;
    }

    i = (int) SEGGER_RTT_Write(0, str, len);

    return i;
}

int dtty_kbhit(void) {
	if (!_g_bsp_dtty_init) {
		dtty_init();
	}

    if (SEGGER_RTT_HasKey()) {
        return 1;
    } else {
        return 0;
    }
}

#endif /* (SEGGERRTT__DTTY_ENABLE == 1) */

#endif /* (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL) */

#endif /* (UBINOS__BSP__USE_DTTY == 1) */

#endif /* (INCLUDE__UBINOS__BSP == 1) */

