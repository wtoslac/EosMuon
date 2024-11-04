--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
--Date        : Mon Nov  4 02:15:29 2024
--Host        : yoga716 running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target Mercury_XU5_wrapper.bd
--Design      : Mercury_XU5_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mercury_XU5_wrapper is
  port (
    C0_DDR4_act_n : out STD_LOGIC;
    C0_DDR4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    C0_DDR4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_dm_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    C0_DDR4_dqs_c : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dqs_t : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_reset_n : out STD_LOGIC;
    C0_SYS_CLK_clk_n : in STD_LOGIC;
    C0_SYS_CLK_clk_p : in STD_LOGIC;
    Clk100 : out STD_LOGIC;
    Clk50 : out STD_LOGIC;
    ETH_CLK10 : out STD_LOGIC;
    ETH_CLK125 : out STD_LOGIC;
    ETH_CLK125_90 : out STD_LOGIC;
    ETH_CLK25 : out STD_LOGIC;
    ETH_resetn : out STD_LOGIC;
    GMII_col : in STD_LOGIC;
    GMII_crs : in STD_LOGIC;
    GMII_rx_clk : in STD_LOGIC;
    GMII_rx_dv : in STD_LOGIC;
    GMII_rx_er : in STD_LOGIC;
    GMII_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    GMII_speed_mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GMII_tx_clk : in STD_LOGIC;
    GMII_tx_en : out STD_LOGIC;
    GMII_tx_er : out STD_LOGIC;
    GMII_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    IIC_scl_io : inout STD_LOGIC;
    IIC_sda_io : inout STD_LOGIC;
    LED_N_PL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MDIO_mdc : out STD_LOGIC;
    MDIO_mdio_io : inout STD_LOGIC;
    Rst_N : out STD_LOGIC;
    reg_ro : in STD_LOGIC_VECTOR ( 2047 downto 0 );
    reg_rw : out STD_LOGIC_VECTOR ( 2047 downto 0 )
  );
end Mercury_XU5_wrapper;

architecture STRUCTURE of Mercury_XU5_wrapper is
  component Mercury_XU5 is
  port (
    IIC_scl_i : in STD_LOGIC;
    IIC_scl_o : out STD_LOGIC;
    IIC_scl_t : out STD_LOGIC;
    IIC_sda_i : in STD_LOGIC;
    IIC_sda_o : out STD_LOGIC;
    IIC_sda_t : out STD_LOGIC;
    C0_SYS_CLK_clk_n : in STD_LOGIC;
    C0_SYS_CLK_clk_p : in STD_LOGIC;
    C0_DDR4_act_n : out STD_LOGIC;
    C0_DDR4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    C0_DDR4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_dm_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    C0_DDR4_dqs_c : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dqs_t : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_reset_n : out STD_LOGIC;
    GMII_rx_clk : in STD_LOGIC;
    GMII_speed_mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GMII_crs : in STD_LOGIC;
    GMII_col : in STD_LOGIC;
    GMII_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    GMII_rx_er : in STD_LOGIC;
    GMII_rx_dv : in STD_LOGIC;
    GMII_tx_clk : in STD_LOGIC;
    GMII_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    GMII_tx_en : out STD_LOGIC;
    GMII_tx_er : out STD_LOGIC;
    MDIO_mdc : out STD_LOGIC;
    MDIO_mdio_i : in STD_LOGIC;
    MDIO_mdio_o : out STD_LOGIC;
    MDIO_mdio_t : out STD_LOGIC;
    ETH_CLK125 : out STD_LOGIC;
    ETH_CLK125_90 : out STD_LOGIC;
    ETH_CLK25 : out STD_LOGIC;
    ETH_CLK10 : out STD_LOGIC;
    ETH_resetn : out STD_LOGIC;
    Clk100 : out STD_LOGIC;
    Clk50 : out STD_LOGIC;
    Rst_N : out STD_LOGIC;
    LED_N_PL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    reg_ro : in STD_LOGIC_VECTOR ( 2047 downto 0 );
    reg_rw : out STD_LOGIC_VECTOR ( 2047 downto 0 )
  );
  end component Mercury_XU5;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal IIC_scl_i : STD_LOGIC;
  signal IIC_scl_o : STD_LOGIC;
  signal IIC_scl_t : STD_LOGIC;
  signal IIC_sda_i : STD_LOGIC;
  signal IIC_sda_o : STD_LOGIC;
  signal IIC_sda_t : STD_LOGIC;
  signal MDIO_mdio_i : STD_LOGIC;
  signal MDIO_mdio_o : STD_LOGIC;
  signal MDIO_mdio_t : STD_LOGIC;
begin
IIC_scl_iobuf: component IOBUF
     port map (
      I => IIC_scl_o,
      IO => IIC_scl_io,
      O => IIC_scl_i,
      T => IIC_scl_t
    );
IIC_sda_iobuf: component IOBUF
     port map (
      I => IIC_sda_o,
      IO => IIC_sda_io,
      O => IIC_sda_i,
      T => IIC_sda_t
    );
MDIO_mdio_iobuf: component IOBUF
     port map (
      I => MDIO_mdio_o,
      IO => MDIO_mdio_io,
      O => MDIO_mdio_i,
      T => MDIO_mdio_t
    );
Mercury_XU5_i: component Mercury_XU5
     port map (
      C0_DDR4_act_n => C0_DDR4_act_n,
      C0_DDR4_adr(16 downto 0) => C0_DDR4_adr(16 downto 0),
      C0_DDR4_ba(1 downto 0) => C0_DDR4_ba(1 downto 0),
      C0_DDR4_bg(0) => C0_DDR4_bg(0),
      C0_DDR4_ck_c(0) => C0_DDR4_ck_c(0),
      C0_DDR4_ck_t(0) => C0_DDR4_ck_t(0),
      C0_DDR4_cke(0) => C0_DDR4_cke(0),
      C0_DDR4_cs_n(0) => C0_DDR4_cs_n(0),
      C0_DDR4_dm_n(1 downto 0) => C0_DDR4_dm_n(1 downto 0),
      C0_DDR4_dq(15 downto 0) => C0_DDR4_dq(15 downto 0),
      C0_DDR4_dqs_c(1 downto 0) => C0_DDR4_dqs_c(1 downto 0),
      C0_DDR4_dqs_t(1 downto 0) => C0_DDR4_dqs_t(1 downto 0),
      C0_DDR4_odt(0) => C0_DDR4_odt(0),
      C0_DDR4_reset_n => C0_DDR4_reset_n,
      C0_SYS_CLK_clk_n => C0_SYS_CLK_clk_n,
      C0_SYS_CLK_clk_p => C0_SYS_CLK_clk_p,
      Clk100 => Clk100,
      Clk50 => Clk50,
      ETH_CLK10 => ETH_CLK10,
      ETH_CLK125 => ETH_CLK125,
      ETH_CLK125_90 => ETH_CLK125_90,
      ETH_CLK25 => ETH_CLK25,
      ETH_resetn => ETH_resetn,
      GMII_col => GMII_col,
      GMII_crs => GMII_crs,
      GMII_rx_clk => GMII_rx_clk,
      GMII_rx_dv => GMII_rx_dv,
      GMII_rx_er => GMII_rx_er,
      GMII_rxd(7 downto 0) => GMII_rxd(7 downto 0),
      GMII_speed_mode(2 downto 0) => GMII_speed_mode(2 downto 0),
      GMII_tx_clk => GMII_tx_clk,
      GMII_tx_en => GMII_tx_en,
      GMII_tx_er => GMII_tx_er,
      GMII_txd(7 downto 0) => GMII_txd(7 downto 0),
      IIC_scl_i => IIC_scl_i,
      IIC_scl_o => IIC_scl_o,
      IIC_scl_t => IIC_scl_t,
      IIC_sda_i => IIC_sda_i,
      IIC_sda_o => IIC_sda_o,
      IIC_sda_t => IIC_sda_t,
      LED_N_PL(1 downto 0) => LED_N_PL(1 downto 0),
      MDIO_mdc => MDIO_mdc,
      MDIO_mdio_i => MDIO_mdio_i,
      MDIO_mdio_o => MDIO_mdio_o,
      MDIO_mdio_t => MDIO_mdio_t,
      Rst_N => Rst_N,
      reg_ro(2047 downto 0) => reg_ro(2047 downto 0),
      reg_rw(2047 downto 0) => reg_rw(2047 downto 0)
    );
end STRUCTURE;
