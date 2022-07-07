//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           hs_dual_da
// Last modified Date:  2020/05/04 9:19:08
// Last Version:        V1.0
// Descriptions:        双路DA实验
//                      
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2019/05/04 9:19:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module hs_dual_da(
    input                 sys_clk     ,  //系统时钟
    input                 sys_rst_n   ,  //系统复位，低电平有效
    //DA接口
    output                da_clk      ,  //DA采样时钟
    output    [9:0]       da_data     ,  //DA采样数据
    output                da_clk1     ,  //DA采样时钟
    output    [9:0]       da_data1       //DA采样数据	 
);

//wire define 
wire      [9:0]    rd_addr;              //ROM地址?
wire      [9:0]    rd_data;              //ROM数据

//*****************************************************
//**                    main code
//*****************************************************

assign  da_clk1 = da_clk;
assign  da_data1 = da_data;

//时钟模块
clk_wiz_0  u_clk_wiz_0(
	.clk_in1 (sys_clk),
	.clk_out1 (clk)
);

//DA发送模块
da_wave_send u_da_wave_send(
    .clk         (clk), 
    .rst_n       (sys_rst_n),
    .rd_data     (rd_data),
    .rd_addr     (rd_addr),
    .da_clk      (da_clk),  
    .da_data     (da_data)
    );

//ROM模块 
rom_1024x10b  u_rom_1024x10b(
    .addra     (rd_addr),
    .clka      (clk),
    .douta     (rd_data)
);

endmodule