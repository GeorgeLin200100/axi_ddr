#Pin LOC constraints for the status signals init_calib_complete and data_compare_error

#LOC constraints provided if the pins are selected for status signals

set_property PACKAGE_PIN AU29 [ get_ports "c0_data_compare_error" ]
set_property IOSTANDARD LVCMOS12 [ get_ports "c0_data_compare_error" ]

set_property DRIVE 8 [ get_ports "c0_data_compare_error" ]

set_property PACKAGE_PIN AU30 [ get_ports "c0_init_calib_complete" ]
set_property IOSTANDARD LVCMOS12 [ get_ports "c0_init_calib_complete" ]

set_property DRIVE 8 [ get_ports "c0_init_calib_complete" ]

set_property PACKAGE_PIN AV29 [ get_ports "sys_rst" ]
set_property IOSTANDARD LVCMOS12 [ get_ports "sys_rst" ]

set_property PACKAGE_PIN BA27 [ get_ports "c0_sys_clk_p" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "c0_sys_clk_p" ]

set_property PACKAGE_PIN BA28 [ get_ports "c0_sys_clk_n" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "c0_sys_clk_n" ]

set_property PACKAGE_PIN AL28 [ get_ports "c0_ddr4_dqs_t[0]" ]
set_property PACKAGE_PIN AL29 [ get_ports "c0_ddr4_dqs_c[0]" ]
set_property PACKAGE_PIN AM27 [ get_ports "c0_ddr4_dq[6]" ]
set_property PACKAGE_PIN AM29 [ get_ports "c0_ddr4_dq[0]" ]
set_property PACKAGE_PIN AN27 [ get_ports "c0_ddr4_dq[7]" ]
set_property PACKAGE_PIN AN29 [ get_ports "c0_ddr4_dq[1]" ]
set_property PACKAGE_PIN AP28 [ get_ports "c0_ddr4_dq[4]" ]
set_property PACKAGE_PIN AP29 [ get_ports "c0_ddr4_dq[5]" ]
set_property PACKAGE_PIN AR27 [ get_ports "c0_ddr4_dq[2]" ]
set_property PACKAGE_PIN AR28 [ get_ports "c0_ddr4_dq[3]" ]
set_property PACKAGE_PIN AR30 [ get_ports "c0_ddr4_dm_dbi_n[0]" ]
set_property PACKAGE_PIN AV28 [ get_ports "c0_ddr4_reset_n" ]
set_property PACKAGE_PIN AW28 [ get_ports "c0_ddr4_ba[1]" ]
set_property PACKAGE_PIN AW29 [ get_ports "c0_ddr4_bg[0]" ]
set_property PACKAGE_PIN AW30 [ get_ports "c0_ddr4_odt[0]" ]
set_property PACKAGE_PIN AY27 [ get_ports "c0_ddr4_cs_n[0]" ]
set_property PACKAGE_PIN AY28 [ get_ports "c0_ddr4_cke[0]" ]
set_property PACKAGE_PIN AY30 [ get_ports "c0_ddr4_act_n" ]
set_property PACKAGE_PIN BA29 [ get_ports "c0_ddr4_adr[12]" ]
set_property PACKAGE_PIN BA30 [ get_ports "c0_ddr4_adr[16]" ]
set_property PACKAGE_PIN BB26 [ get_ports "c0_ddr4_adr[10]" ]
set_property PACKAGE_PIN BB27 [ get_ports "c0_ddr4_adr[14]" ]
set_property PACKAGE_PIN BB29 [ get_ports "c0_ddr4_adr[13]" ]
set_property PACKAGE_PIN BB30 [ get_ports "c0_ddr4_ba[0]" ]
set_property PACKAGE_PIN BC26 [ get_ports "c0_ddr4_adr[11]" ]
set_property PACKAGE_PIN BC27 [ get_ports "c0_ddr4_adr[15]" ]
set_property PACKAGE_PIN BC29 [ get_ports "c0_ddr4_bg[1]" ]
set_property PACKAGE_PIN BD26 [ get_ports "c0_ddr4_adr[0]" ]
set_property PACKAGE_PIN BD28 [ get_ports "c0_ddr4_ck_t[0]" ]
set_property PACKAGE_PIN BD29 [ get_ports "c0_ddr4_ck_c[0]" ]
set_property PACKAGE_PIN BD30 [ get_ports "c0_ddr4_adr[8]" ]
set_property PACKAGE_PIN BE26 [ get_ports "c0_ddr4_adr[1]" ]
set_property PACKAGE_PIN BE27 [ get_ports "c0_ddr4_adr[4]" ]
set_property PACKAGE_PIN BE28 [ get_ports "c0_ddr4_adr[6]" ]
set_property PACKAGE_PIN BE30 [ get_ports "c0_ddr4_adr[9]" ]
set_property PACKAGE_PIN BF27 [ get_ports "c0_ddr4_adr[5]" ]
set_property PACKAGE_PIN BF28 [ get_ports "c0_ddr4_adr[7]" ]
set_property PACKAGE_PIN BF29 [ get_ports "c0_ddr4_adr[2]" ]
set_property PACKAGE_PIN BF30 [ get_ports "c0_ddr4_adr[3]" ]


