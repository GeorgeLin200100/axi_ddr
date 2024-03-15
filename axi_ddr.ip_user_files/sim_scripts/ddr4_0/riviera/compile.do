vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/microblaze_v11_0_10
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lmb_v10_v3_0_12
vlib riviera/lmb_bram_if_cntlr_v4_0_21
vlib riviera/blk_mem_gen_v8_4_5
vlib riviera/iomodule_v3_1_8

vmap xpm riviera/xpm
vmap microblaze_v11_0_10 riviera/microblaze_v11_0_10
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_12 riviera/lmb_v10_v3_0_12
vmap lmb_bram_if_cntlr_v4_0_21 riviera/lmb_bram_if_cntlr_v4_0_21
vmap blk_mem_gen_v8_4_5 riviera/blk_mem_gen_v8_4_5
vmap iomodule_v3_1_8 riviera/iomodule_v3_1_8

vlog -work xpm  -sv2k12 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"D:/Download/VivadoInstall/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"D:/Download/VivadoInstall/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_10 -93  \
"../../../ipstatic/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_0/sim/bd_9054_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_1/sim/bd_9054_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_12 -93  \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_2/sim/bd_9054_ilmb_0.vhd" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_3/sim/bd_9054_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_21 -93  \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_4/sim/bd_9054_dlmb_cntlr_0.vhd" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_5/sim/bd_9054_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_5  -v2k5 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_6/sim/bd_9054_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_7/sim/bd_9054_second_dlmb_cntlr_0.vhd" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_8/sim/bd_9054_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_9/sim/bd_9054_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_8 -93  \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_10/sim/bd_9054_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/bd_0/sim/bd_9054.v" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_0/sim/ddr4_0_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_0_phy_ddr4.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/ip_1/rtl/ip_top/ddr4_0_phy.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4_mem_intfc.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_0_ddr4_cal_riu.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0.sv" \
"../../../../axi_ddr.gen/sources_1/ip/ddr4_0/tb/ddr4_0_microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

