/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/BoothWallaceMult16Bit_2017701177/BoothWallaceMult16Bit_tb.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {2379U, 0U};
static unsigned int ng3[] = {363U, 0U};

static void NetReassign_50_1(char *);
static void NetReassign_51_2(char *);


static void Initial_41_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);

LAB4:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1448);
    xsi_set_assignedflag(t2);
    t3 = (t0 + 4888);
    *((int *)t3) = 1;
    NetReassign_50_1(t0);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1608);
    xsi_set_assignedflag(t2);
    t3 = (t0 + 4892);
    *((int *)t3) = 1;
    NetReassign_51_2(t0);
    goto LAB1;

}

static void NetReassign_50_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t3 = 0;
    t2 = ((char*)((ng2)));
    t4 = (t0 + 4888);
    if (*((int *)t4) > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    t5 = (t0 + 1448);
    xsi_vlogvar_assignassignvalue(t5, t2, 0, 0, 0, 16, ((int*)(t4)));
    t3 = 1;
    goto LAB5;

}

static void NetReassign_51_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 3016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t3 = 0;
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4892);
    if (*((int *)t4) > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    t5 = (t0 + 1608);
    xsi_vlogvar_assignassignvalue(t5, t2, 0, 0, 0, 16, ((int*)(t4)));
    t3 = 1;
    goto LAB5;

}


extern void work_m_05557683377112113165_0834794856_init()
{
	static char *pe[] = {(void *)Initial_41_0,(void *)NetReassign_50_1,(void *)NetReassign_51_2};
	xsi_register_didat("work_m_05557683377112113165_0834794856", "isim/BoothWallaceMult16Bit_tb_isim_beh.exe.sim/work/m_05557683377112113165_0834794856.didat");
	xsi_register_executes(pe);
}
