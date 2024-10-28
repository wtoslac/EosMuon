--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
--Date        : Sun Oct 27 19:45:39 2024
--Host        : yoga716 running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target Mercury_XU5.bd
--Design      : Mercury_XU5
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_VQEI83 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_VQEI83;

architecture STRUCTURE of m00_couplers_imp_VQEI83 is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m00_couplers_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_m00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m00_couplers_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(39 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(39 downto 0);
  M_AXI_arburst(1 downto 0) <= m00_couplers_to_m00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m00_couplers_to_m00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(15 downto 0) <= m00_couplers_to_m00_couplers_ARID(15 downto 0);
  M_AXI_arlen(7 downto 0) <= m00_couplers_to_m00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= m00_couplers_to_m00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= m00_couplers_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= m00_couplers_to_m00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= m00_couplers_to_m00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid(0) <= m00_couplers_to_m00_couplers_ARVALID(0);
  M_AXI_awaddr(39 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(39 downto 0);
  M_AXI_awburst(1 downto 0) <= m00_couplers_to_m00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m00_couplers_to_m00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(15 downto 0) <= m00_couplers_to_m00_couplers_AWID(15 downto 0);
  M_AXI_awlen(7 downto 0) <= m00_couplers_to_m00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= m00_couplers_to_m00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= m00_couplers_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= m00_couplers_to_m00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= m00_couplers_to_m00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid(0) <= m00_couplers_to_m00_couplers_AWVALID(0);
  M_AXI_bready(0) <= m00_couplers_to_m00_couplers_BREADY(0);
  M_AXI_rready(0) <= m00_couplers_to_m00_couplers_RREADY(0);
  M_AXI_wdata(127 downto 0) <= m00_couplers_to_m00_couplers_WDATA(127 downto 0);
  M_AXI_wlast(0) <= m00_couplers_to_m00_couplers_WLAST(0);
  M_AXI_wstrb(15 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(15 downto 0);
  M_AXI_wvalid(0) <= m00_couplers_to_m00_couplers_WVALID(0);
  S_AXI_arready(0) <= m00_couplers_to_m00_couplers_ARREADY(0);
  S_AXI_awready(0) <= m00_couplers_to_m00_couplers_AWREADY(0);
  S_AXI_bid(15 downto 0) <= m00_couplers_to_m00_couplers_BID(15 downto 0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m00_couplers_to_m00_couplers_BVALID(0);
  S_AXI_rdata(127 downto 0) <= m00_couplers_to_m00_couplers_RDATA(127 downto 0);
  S_AXI_rid(15 downto 0) <= m00_couplers_to_m00_couplers_RID(15 downto 0);
  S_AXI_rlast(0) <= m00_couplers_to_m00_couplers_RLAST(0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m00_couplers_to_m00_couplers_RVALID(0);
  S_AXI_wready(0) <= m00_couplers_to_m00_couplers_WREADY(0);
  m00_couplers_to_m00_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m00_couplers_to_m00_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_m00_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_m00_couplers_ARID(15 downto 0) <= S_AXI_arid(15 downto 0);
  m00_couplers_to_m00_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_m00_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_m00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_m00_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_m00_couplers_ARREADY(0) <= M_AXI_arready(0);
  m00_couplers_to_m00_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_m00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m00_couplers_to_m00_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m00_couplers_to_m00_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_m00_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_m00_couplers_AWID(15 downto 0) <= S_AXI_awid(15 downto 0);
  m00_couplers_to_m00_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_m00_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_m00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_m00_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_m00_couplers_AWREADY(0) <= M_AXI_awready(0);
  m00_couplers_to_m00_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_m00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m00_couplers_to_m00_couplers_BID(15 downto 0) <= M_AXI_bid(15 downto 0);
  m00_couplers_to_m00_couplers_BREADY(0) <= S_AXI_bready(0);
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m00_couplers_to_m00_couplers_RDATA(127 downto 0) <= M_AXI_rdata(127 downto 0);
  m00_couplers_to_m00_couplers_RID(15 downto 0) <= M_AXI_rid(15 downto 0);
  m00_couplers_to_m00_couplers_RLAST(0) <= M_AXI_rlast(0);
  m00_couplers_to_m00_couplers_RREADY(0) <= S_AXI_rready(0);
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m00_couplers_to_m00_couplers_WDATA(127 downto 0) <= S_AXI_wdata(127 downto 0);
  m00_couplers_to_m00_couplers_WLAST(0) <= S_AXI_wlast(0);
  m00_couplers_to_m00_couplers_WREADY(0) <= M_AXI_wready(0);
  m00_couplers_to_m00_couplers_WSTRB(15 downto 0) <= S_AXI_wstrb(15 downto 0);
  m00_couplers_to_m00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1TWH8PP is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1TWH8PP;

architecture STRUCTURE of m01_couplers_imp_1TWH8PP is
  component Mercury_XU5_auto_ds_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component Mercury_XU5_auto_ds_0;
  component Mercury_XU5_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component Mercury_XU5_auto_pc_0;
  component Mercury_XU5_auto_rs_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component Mercury_XU5_auto_rs_0;
  component Mercury_XU5_auto_rs_w_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component Mercury_XU5_auto_rs_w_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_ds_to_auto_rs_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_ds_to_auto_rs_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_auto_rs_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_ds_to_auto_rs_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_ds_to_auto_rs_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_auto_rs_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_ARREADY : STD_LOGIC;
  signal auto_ds_to_auto_rs_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_auto_rs_ARVALID : STD_LOGIC;
  signal auto_ds_to_auto_rs_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_ds_to_auto_rs_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_auto_rs_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_ds_to_auto_rs_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_ds_to_auto_rs_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_auto_rs_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_AWREADY : STD_LOGIC;
  signal auto_ds_to_auto_rs_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_auto_rs_AWVALID : STD_LOGIC;
  signal auto_ds_to_auto_rs_BREADY : STD_LOGIC;
  signal auto_ds_to_auto_rs_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_auto_rs_BVALID : STD_LOGIC;
  signal auto_ds_to_auto_rs_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_auto_rs_RLAST : STD_LOGIC;
  signal auto_ds_to_auto_rs_RREADY : STD_LOGIC;
  signal auto_ds_to_auto_rs_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_auto_rs_RVALID : STD_LOGIC;
  signal auto_ds_to_auto_rs_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_auto_rs_WLAST : STD_LOGIC;
  signal auto_ds_to_auto_rs_WREADY : STD_LOGIC;
  signal auto_ds_to_auto_rs_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_auto_rs_WVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m01_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m01_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m01_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m01_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m01_couplers_WVALID : STD_LOGIC;
  signal auto_rs_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_rs_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_rs_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_rs_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_ARREADY : STD_LOGIC;
  signal auto_rs_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_to_auto_pc_ARVALID : STD_LOGIC;
  signal auto_rs_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_rs_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_rs_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_rs_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_AWREADY : STD_LOGIC;
  signal auto_rs_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_to_auto_pc_AWVALID : STD_LOGIC;
  signal auto_rs_to_auto_pc_BREADY : STD_LOGIC;
  signal auto_rs_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_to_auto_pc_BVALID : STD_LOGIC;
  signal auto_rs_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_rs_to_auto_pc_RLAST : STD_LOGIC;
  signal auto_rs_to_auto_pc_RREADY : STD_LOGIC;
  signal auto_rs_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_to_auto_pc_RVALID : STD_LOGIC;
  signal auto_rs_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_rs_to_auto_pc_WLAST : STD_LOGIC;
  signal auto_rs_to_auto_pc_WREADY : STD_LOGIC;
  signal auto_rs_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_to_auto_pc_WVALID : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_rs_w_to_auto_ds_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_w_to_auto_ds_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal auto_rs_w_to_auto_ds_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_rs_w_to_auto_ds_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_rs_w_to_auto_ds_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_w_to_auto_ds_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_ARREADY : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_w_to_auto_ds_ARVALID : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_rs_w_to_auto_ds_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_w_to_auto_ds_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal auto_rs_w_to_auto_ds_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_rs_w_to_auto_ds_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_rs_w_to_auto_ds_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_w_to_auto_ds_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_AWREADY : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_rs_w_to_auto_ds_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_rs_w_to_auto_ds_AWVALID : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal auto_rs_w_to_auto_ds_BREADY : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_w_to_auto_ds_BVALID : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal auto_rs_w_to_auto_ds_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal auto_rs_w_to_auto_ds_RLAST : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_RREADY : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_rs_w_to_auto_ds_RVALID : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal auto_rs_w_to_auto_ds_WLAST : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_WREADY : STD_LOGIC;
  signal auto_rs_w_to_auto_ds_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal auto_rs_w_to_auto_ds_WVALID : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_auto_rs_w_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARREADY : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_ARVALID : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_auto_rs_w_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWREADY : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_AWVALID : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_BREADY : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_rs_w_BVALID : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m01_couplers_to_auto_rs_w_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_RLAST : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_RREADY : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_rs_w_RVALID : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m01_couplers_to_auto_rs_w_WLAST : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_WREADY : STD_LOGIC;
  signal m01_couplers_to_auto_rs_w_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m01_couplers_to_auto_rs_w_WVALID : STD_LOGIC;
  signal NLW_auto_rs_w_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_auto_rs_w_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  M_AXI_araddr(39 downto 0) <= auto_pc_to_m01_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m01_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= auto_pc_to_m01_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m01_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m01_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m01_couplers_to_auto_rs_w_ARREADY;
  S_AXI_awready <= m01_couplers_to_auto_rs_w_AWREADY;
  S_AXI_bid(15 downto 0) <= m01_couplers_to_auto_rs_w_BID(15 downto 0);
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_auto_rs_w_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_auto_rs_w_BVALID;
  S_AXI_rdata(127 downto 0) <= m01_couplers_to_auto_rs_w_RDATA(127 downto 0);
  S_AXI_rid(15 downto 0) <= m01_couplers_to_auto_rs_w_RID(15 downto 0);
  S_AXI_rlast <= m01_couplers_to_auto_rs_w_RLAST;
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_auto_rs_w_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_auto_rs_w_RVALID;
  S_AXI_wready <= m01_couplers_to_auto_rs_w_WREADY;
  auto_pc_to_m01_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m01_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m01_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m01_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_auto_rs_w_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m01_couplers_to_auto_rs_w_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m01_couplers_to_auto_rs_w_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m01_couplers_to_auto_rs_w_ARID(15 downto 0) <= S_AXI_arid(15 downto 0);
  m01_couplers_to_auto_rs_w_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m01_couplers_to_auto_rs_w_ARLOCK(0) <= S_AXI_arlock(0);
  m01_couplers_to_auto_rs_w_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_auto_rs_w_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m01_couplers_to_auto_rs_w_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m01_couplers_to_auto_rs_w_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m01_couplers_to_auto_rs_w_ARUSER(15 downto 0) <= S_AXI_aruser(15 downto 0);
  m01_couplers_to_auto_rs_w_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_auto_rs_w_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m01_couplers_to_auto_rs_w_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m01_couplers_to_auto_rs_w_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m01_couplers_to_auto_rs_w_AWID(15 downto 0) <= S_AXI_awid(15 downto 0);
  m01_couplers_to_auto_rs_w_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m01_couplers_to_auto_rs_w_AWLOCK(0) <= S_AXI_awlock(0);
  m01_couplers_to_auto_rs_w_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_auto_rs_w_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m01_couplers_to_auto_rs_w_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m01_couplers_to_auto_rs_w_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m01_couplers_to_auto_rs_w_AWUSER(15 downto 0) <= S_AXI_awuser(15 downto 0);
  m01_couplers_to_auto_rs_w_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_auto_rs_w_BREADY <= S_AXI_bready;
  m01_couplers_to_auto_rs_w_RREADY <= S_AXI_rready;
  m01_couplers_to_auto_rs_w_WDATA(127 downto 0) <= S_AXI_wdata(127 downto 0);
  m01_couplers_to_auto_rs_w_WLAST <= S_AXI_wlast;
  m01_couplers_to_auto_rs_w_WSTRB(15 downto 0) <= S_AXI_wstrb(15 downto 0);
  m01_couplers_to_auto_rs_w_WVALID <= S_AXI_wvalid;
auto_ds: component Mercury_XU5_auto_ds_0
     port map (
      m_axi_araddr(39 downto 0) => auto_ds_to_auto_rs_ARADDR(39 downto 0),
      m_axi_arburst(1 downto 0) => auto_ds_to_auto_rs_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_ds_to_auto_rs_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_ds_to_auto_rs_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_ds_to_auto_rs_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_ds_to_auto_rs_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_ds_to_auto_rs_ARQOS(3 downto 0),
      m_axi_arready => auto_ds_to_auto_rs_ARREADY,
      m_axi_arregion(3 downto 0) => auto_ds_to_auto_rs_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_ds_to_auto_rs_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_ds_to_auto_rs_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_ds_to_auto_rs_AWADDR(39 downto 0),
      m_axi_awburst(1 downto 0) => auto_ds_to_auto_rs_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_ds_to_auto_rs_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_ds_to_auto_rs_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_ds_to_auto_rs_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_ds_to_auto_rs_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_ds_to_auto_rs_AWQOS(3 downto 0),
      m_axi_awready => auto_ds_to_auto_rs_AWREADY,
      m_axi_awregion(3 downto 0) => auto_ds_to_auto_rs_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_ds_to_auto_rs_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_ds_to_auto_rs_AWVALID,
      m_axi_bready => auto_ds_to_auto_rs_BREADY,
      m_axi_bresp(1 downto 0) => auto_ds_to_auto_rs_BRESP(1 downto 0),
      m_axi_bvalid => auto_ds_to_auto_rs_BVALID,
      m_axi_rdata(31 downto 0) => auto_ds_to_auto_rs_RDATA(31 downto 0),
      m_axi_rlast => auto_ds_to_auto_rs_RLAST,
      m_axi_rready => auto_ds_to_auto_rs_RREADY,
      m_axi_rresp(1 downto 0) => auto_ds_to_auto_rs_RRESP(1 downto 0),
      m_axi_rvalid => auto_ds_to_auto_rs_RVALID,
      m_axi_wdata(31 downto 0) => auto_ds_to_auto_rs_WDATA(31 downto 0),
      m_axi_wlast => auto_ds_to_auto_rs_WLAST,
      m_axi_wready => auto_ds_to_auto_rs_WREADY,
      m_axi_wstrb(3 downto 0) => auto_ds_to_auto_rs_WSTRB(3 downto 0),
      m_axi_wvalid => auto_ds_to_auto_rs_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(39 downto 0) => auto_rs_w_to_auto_ds_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => auto_rs_w_to_auto_ds_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => auto_rs_w_to_auto_ds_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arid(15 downto 0) => auto_rs_w_to_auto_ds_ARID(15 downto 0),
      s_axi_arlen(7 downto 0) => auto_rs_w_to_auto_ds_ARLEN(7 downto 0),
      s_axi_arlock(0) => auto_rs_w_to_auto_ds_ARLOCK(0),
      s_axi_arprot(2 downto 0) => auto_rs_w_to_auto_ds_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => auto_rs_w_to_auto_ds_ARQOS(3 downto 0),
      s_axi_arready => auto_rs_w_to_auto_ds_ARREADY,
      s_axi_arregion(3 downto 0) => auto_rs_w_to_auto_ds_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => auto_rs_w_to_auto_ds_ARSIZE(2 downto 0),
      s_axi_arvalid => auto_rs_w_to_auto_ds_ARVALID,
      s_axi_awaddr(39 downto 0) => auto_rs_w_to_auto_ds_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => auto_rs_w_to_auto_ds_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => auto_rs_w_to_auto_ds_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 0) => auto_rs_w_to_auto_ds_AWID(15 downto 0),
      s_axi_awlen(7 downto 0) => auto_rs_w_to_auto_ds_AWLEN(7 downto 0),
      s_axi_awlock(0) => auto_rs_w_to_auto_ds_AWLOCK(0),
      s_axi_awprot(2 downto 0) => auto_rs_w_to_auto_ds_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => auto_rs_w_to_auto_ds_AWQOS(3 downto 0),
      s_axi_awready => auto_rs_w_to_auto_ds_AWREADY,
      s_axi_awregion(3 downto 0) => auto_rs_w_to_auto_ds_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => auto_rs_w_to_auto_ds_AWSIZE(2 downto 0),
      s_axi_awvalid => auto_rs_w_to_auto_ds_AWVALID,
      s_axi_bid(15 downto 0) => auto_rs_w_to_auto_ds_BID(15 downto 0),
      s_axi_bready => auto_rs_w_to_auto_ds_BREADY,
      s_axi_bresp(1 downto 0) => auto_rs_w_to_auto_ds_BRESP(1 downto 0),
      s_axi_bvalid => auto_rs_w_to_auto_ds_BVALID,
      s_axi_rdata(127 downto 0) => auto_rs_w_to_auto_ds_RDATA(127 downto 0),
      s_axi_rid(15 downto 0) => auto_rs_w_to_auto_ds_RID(15 downto 0),
      s_axi_rlast => auto_rs_w_to_auto_ds_RLAST,
      s_axi_rready => auto_rs_w_to_auto_ds_RREADY,
      s_axi_rresp(1 downto 0) => auto_rs_w_to_auto_ds_RRESP(1 downto 0),
      s_axi_rvalid => auto_rs_w_to_auto_ds_RVALID,
      s_axi_wdata(127 downto 0) => auto_rs_w_to_auto_ds_WDATA(127 downto 0),
      s_axi_wlast => auto_rs_w_to_auto_ds_WLAST,
      s_axi_wready => auto_rs_w_to_auto_ds_WREADY,
      s_axi_wstrb(15 downto 0) => auto_rs_w_to_auto_ds_WSTRB(15 downto 0),
      s_axi_wvalid => auto_rs_w_to_auto_ds_WVALID
    );
auto_pc: component Mercury_XU5_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(39 downto 0) => auto_pc_to_m01_couplers_ARADDR(39 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m01_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_m01_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m01_couplers_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_pc_to_m01_couplers_AWADDR(39 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m01_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_m01_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m01_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m01_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m01_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m01_couplers_WVALID,
      s_axi_araddr(39 downto 0) => auto_rs_to_auto_pc_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => auto_rs_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => auto_rs_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => auto_rs_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => auto_rs_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => auto_rs_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => auto_rs_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => auto_rs_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => auto_rs_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => auto_rs_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => auto_rs_to_auto_pc_ARVALID,
      s_axi_awaddr(39 downto 0) => auto_rs_to_auto_pc_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => auto_rs_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => auto_rs_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => auto_rs_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => auto_rs_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => auto_rs_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => auto_rs_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => auto_rs_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => auto_rs_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => auto_rs_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => auto_rs_to_auto_pc_AWVALID,
      s_axi_bready => auto_rs_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => auto_rs_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => auto_rs_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => auto_rs_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => auto_rs_to_auto_pc_RLAST,
      s_axi_rready => auto_rs_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => auto_rs_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => auto_rs_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => auto_rs_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => auto_rs_to_auto_pc_WLAST,
      s_axi_wready => auto_rs_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => auto_rs_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => auto_rs_to_auto_pc_WVALID
    );
auto_rs: component Mercury_XU5_auto_rs_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(39 downto 0) => auto_rs_to_auto_pc_ARADDR(39 downto 0),
      m_axi_arburst(1 downto 0) => auto_rs_to_auto_pc_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_rs_to_auto_pc_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_rs_to_auto_pc_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_rs_to_auto_pc_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_rs_to_auto_pc_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_rs_to_auto_pc_ARQOS(3 downto 0),
      m_axi_arready => auto_rs_to_auto_pc_ARREADY,
      m_axi_arregion(3 downto 0) => auto_rs_to_auto_pc_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_rs_to_auto_pc_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_rs_to_auto_pc_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_rs_to_auto_pc_AWADDR(39 downto 0),
      m_axi_awburst(1 downto 0) => auto_rs_to_auto_pc_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_rs_to_auto_pc_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_rs_to_auto_pc_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_rs_to_auto_pc_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_rs_to_auto_pc_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_rs_to_auto_pc_AWQOS(3 downto 0),
      m_axi_awready => auto_rs_to_auto_pc_AWREADY,
      m_axi_awregion(3 downto 0) => auto_rs_to_auto_pc_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_rs_to_auto_pc_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_rs_to_auto_pc_AWVALID,
      m_axi_bready => auto_rs_to_auto_pc_BREADY,
      m_axi_bresp(1 downto 0) => auto_rs_to_auto_pc_BRESP(1 downto 0),
      m_axi_bvalid => auto_rs_to_auto_pc_BVALID,
      m_axi_rdata(31 downto 0) => auto_rs_to_auto_pc_RDATA(31 downto 0),
      m_axi_rlast => auto_rs_to_auto_pc_RLAST,
      m_axi_rready => auto_rs_to_auto_pc_RREADY,
      m_axi_rresp(1 downto 0) => auto_rs_to_auto_pc_RRESP(1 downto 0),
      m_axi_rvalid => auto_rs_to_auto_pc_RVALID,
      m_axi_wdata(31 downto 0) => auto_rs_to_auto_pc_WDATA(31 downto 0),
      m_axi_wlast => auto_rs_to_auto_pc_WLAST,
      m_axi_wready => auto_rs_to_auto_pc_WREADY,
      m_axi_wstrb(3 downto 0) => auto_rs_to_auto_pc_WSTRB(3 downto 0),
      m_axi_wvalid => auto_rs_to_auto_pc_WVALID,
      s_axi_araddr(39 downto 0) => auto_ds_to_auto_rs_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => auto_ds_to_auto_rs_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => auto_ds_to_auto_rs_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => auto_ds_to_auto_rs_ARLEN(7 downto 0),
      s_axi_arlock(0) => auto_ds_to_auto_rs_ARLOCK(0),
      s_axi_arprot(2 downto 0) => auto_ds_to_auto_rs_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => auto_ds_to_auto_rs_ARQOS(3 downto 0),
      s_axi_arready => auto_ds_to_auto_rs_ARREADY,
      s_axi_arregion(3 downto 0) => auto_ds_to_auto_rs_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => auto_ds_to_auto_rs_ARSIZE(2 downto 0),
      s_axi_arvalid => auto_ds_to_auto_rs_ARVALID,
      s_axi_awaddr(39 downto 0) => auto_ds_to_auto_rs_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => auto_ds_to_auto_rs_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => auto_ds_to_auto_rs_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => auto_ds_to_auto_rs_AWLEN(7 downto 0),
      s_axi_awlock(0) => auto_ds_to_auto_rs_AWLOCK(0),
      s_axi_awprot(2 downto 0) => auto_ds_to_auto_rs_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => auto_ds_to_auto_rs_AWQOS(3 downto 0),
      s_axi_awready => auto_ds_to_auto_rs_AWREADY,
      s_axi_awregion(3 downto 0) => auto_ds_to_auto_rs_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => auto_ds_to_auto_rs_AWSIZE(2 downto 0),
      s_axi_awvalid => auto_ds_to_auto_rs_AWVALID,
      s_axi_bready => auto_ds_to_auto_rs_BREADY,
      s_axi_bresp(1 downto 0) => auto_ds_to_auto_rs_BRESP(1 downto 0),
      s_axi_bvalid => auto_ds_to_auto_rs_BVALID,
      s_axi_rdata(31 downto 0) => auto_ds_to_auto_rs_RDATA(31 downto 0),
      s_axi_rlast => auto_ds_to_auto_rs_RLAST,
      s_axi_rready => auto_ds_to_auto_rs_RREADY,
      s_axi_rresp(1 downto 0) => auto_ds_to_auto_rs_RRESP(1 downto 0),
      s_axi_rvalid => auto_ds_to_auto_rs_RVALID,
      s_axi_wdata(31 downto 0) => auto_ds_to_auto_rs_WDATA(31 downto 0),
      s_axi_wlast => auto_ds_to_auto_rs_WLAST,
      s_axi_wready => auto_ds_to_auto_rs_WREADY,
      s_axi_wstrb(3 downto 0) => auto_ds_to_auto_rs_WSTRB(3 downto 0),
      s_axi_wvalid => auto_ds_to_auto_rs_WVALID
    );
auto_rs_w: component Mercury_XU5_auto_rs_w_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(39 downto 0) => auto_rs_w_to_auto_ds_ARADDR(39 downto 0),
      m_axi_arburst(1 downto 0) => auto_rs_w_to_auto_ds_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_rs_w_to_auto_ds_ARCACHE(3 downto 0),
      m_axi_arid(15 downto 0) => auto_rs_w_to_auto_ds_ARID(15 downto 0),
      m_axi_arlen(7 downto 0) => auto_rs_w_to_auto_ds_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_rs_w_to_auto_ds_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_rs_w_to_auto_ds_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_rs_w_to_auto_ds_ARQOS(3 downto 0),
      m_axi_arready => auto_rs_w_to_auto_ds_ARREADY,
      m_axi_arregion(3 downto 0) => auto_rs_w_to_auto_ds_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_rs_w_to_auto_ds_ARSIZE(2 downto 0),
      m_axi_aruser(15 downto 0) => NLW_auto_rs_w_m_axi_aruser_UNCONNECTED(15 downto 0),
      m_axi_arvalid => auto_rs_w_to_auto_ds_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_rs_w_to_auto_ds_AWADDR(39 downto 0),
      m_axi_awburst(1 downto 0) => auto_rs_w_to_auto_ds_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_rs_w_to_auto_ds_AWCACHE(3 downto 0),
      m_axi_awid(15 downto 0) => auto_rs_w_to_auto_ds_AWID(15 downto 0),
      m_axi_awlen(7 downto 0) => auto_rs_w_to_auto_ds_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_rs_w_to_auto_ds_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_rs_w_to_auto_ds_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_rs_w_to_auto_ds_AWQOS(3 downto 0),
      m_axi_awready => auto_rs_w_to_auto_ds_AWREADY,
      m_axi_awregion(3 downto 0) => auto_rs_w_to_auto_ds_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_rs_w_to_auto_ds_AWSIZE(2 downto 0),
      m_axi_awuser(15 downto 0) => NLW_auto_rs_w_m_axi_awuser_UNCONNECTED(15 downto 0),
      m_axi_awvalid => auto_rs_w_to_auto_ds_AWVALID,
      m_axi_bid(15 downto 0) => auto_rs_w_to_auto_ds_BID(15 downto 0),
      m_axi_bready => auto_rs_w_to_auto_ds_BREADY,
      m_axi_bresp(1 downto 0) => auto_rs_w_to_auto_ds_BRESP(1 downto 0),
      m_axi_bvalid => auto_rs_w_to_auto_ds_BVALID,
      m_axi_rdata(127 downto 0) => auto_rs_w_to_auto_ds_RDATA(127 downto 0),
      m_axi_rid(15 downto 0) => auto_rs_w_to_auto_ds_RID(15 downto 0),
      m_axi_rlast => auto_rs_w_to_auto_ds_RLAST,
      m_axi_rready => auto_rs_w_to_auto_ds_RREADY,
      m_axi_rresp(1 downto 0) => auto_rs_w_to_auto_ds_RRESP(1 downto 0),
      m_axi_rvalid => auto_rs_w_to_auto_ds_RVALID,
      m_axi_wdata(127 downto 0) => auto_rs_w_to_auto_ds_WDATA(127 downto 0),
      m_axi_wlast => auto_rs_w_to_auto_ds_WLAST,
      m_axi_wready => auto_rs_w_to_auto_ds_WREADY,
      m_axi_wstrb(15 downto 0) => auto_rs_w_to_auto_ds_WSTRB(15 downto 0),
      m_axi_wvalid => auto_rs_w_to_auto_ds_WVALID,
      s_axi_araddr(39 downto 0) => m01_couplers_to_auto_rs_w_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => m01_couplers_to_auto_rs_w_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m01_couplers_to_auto_rs_w_ARCACHE(3 downto 0),
      s_axi_arid(15 downto 0) => m01_couplers_to_auto_rs_w_ARID(15 downto 0),
      s_axi_arlen(7 downto 0) => m01_couplers_to_auto_rs_w_ARLEN(7 downto 0),
      s_axi_arlock(0) => m01_couplers_to_auto_rs_w_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m01_couplers_to_auto_rs_w_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m01_couplers_to_auto_rs_w_ARQOS(3 downto 0),
      s_axi_arready => m01_couplers_to_auto_rs_w_ARREADY,
      s_axi_arregion(3 downto 0) => m01_couplers_to_auto_rs_w_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m01_couplers_to_auto_rs_w_ARSIZE(2 downto 0),
      s_axi_aruser(15 downto 0) => m01_couplers_to_auto_rs_w_ARUSER(15 downto 0),
      s_axi_arvalid => m01_couplers_to_auto_rs_w_ARVALID,
      s_axi_awaddr(39 downto 0) => m01_couplers_to_auto_rs_w_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => m01_couplers_to_auto_rs_w_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m01_couplers_to_auto_rs_w_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 0) => m01_couplers_to_auto_rs_w_AWID(15 downto 0),
      s_axi_awlen(7 downto 0) => m01_couplers_to_auto_rs_w_AWLEN(7 downto 0),
      s_axi_awlock(0) => m01_couplers_to_auto_rs_w_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m01_couplers_to_auto_rs_w_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m01_couplers_to_auto_rs_w_AWQOS(3 downto 0),
      s_axi_awready => m01_couplers_to_auto_rs_w_AWREADY,
      s_axi_awregion(3 downto 0) => m01_couplers_to_auto_rs_w_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m01_couplers_to_auto_rs_w_AWSIZE(2 downto 0),
      s_axi_awuser(15 downto 0) => m01_couplers_to_auto_rs_w_AWUSER(15 downto 0),
      s_axi_awvalid => m01_couplers_to_auto_rs_w_AWVALID,
      s_axi_bid(15 downto 0) => m01_couplers_to_auto_rs_w_BID(15 downto 0),
      s_axi_bready => m01_couplers_to_auto_rs_w_BREADY,
      s_axi_bresp(1 downto 0) => m01_couplers_to_auto_rs_w_BRESP(1 downto 0),
      s_axi_bvalid => m01_couplers_to_auto_rs_w_BVALID,
      s_axi_rdata(127 downto 0) => m01_couplers_to_auto_rs_w_RDATA(127 downto 0),
      s_axi_rid(15 downto 0) => m01_couplers_to_auto_rs_w_RID(15 downto 0),
      s_axi_rlast => m01_couplers_to_auto_rs_w_RLAST,
      s_axi_rready => m01_couplers_to_auto_rs_w_RREADY,
      s_axi_rresp(1 downto 0) => m01_couplers_to_auto_rs_w_RRESP(1 downto 0),
      s_axi_rvalid => m01_couplers_to_auto_rs_w_RVALID,
      s_axi_wdata(127 downto 0) => m01_couplers_to_auto_rs_w_WDATA(127 downto 0),
      s_axi_wlast => m01_couplers_to_auto_rs_w_WLAST,
      s_axi_wready => m01_couplers_to_auto_rs_w_WREADY,
      s_axi_wstrb(15 downto 0) => m01_couplers_to_auto_rs_w_WSTRB(15 downto 0),
      s_axi_wvalid => m01_couplers_to_auto_rs_w_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_17XXMTV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end s00_couplers_imp_17XXMTV;

architecture STRUCTURE of s00_couplers_imp_17XXMTV is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s00_couplers_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s00_couplers_to_s00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(39 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(39 downto 0);
  M_AXI_arburst(1 downto 0) <= s00_couplers_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= s00_couplers_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(15 downto 0) <= s00_couplers_to_s00_couplers_ARID(15 downto 0);
  M_AXI_arlen(7 downto 0) <= s00_couplers_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= s00_couplers_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= s00_couplers_to_s00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= s00_couplers_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_aruser(15 downto 0) <= s00_couplers_to_s00_couplers_ARUSER(15 downto 0);
  M_AXI_arvalid(0) <= s00_couplers_to_s00_couplers_ARVALID(0);
  M_AXI_awaddr(39 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(39 downto 0);
  M_AXI_awburst(1 downto 0) <= s00_couplers_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= s00_couplers_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(15 downto 0) <= s00_couplers_to_s00_couplers_AWID(15 downto 0);
  M_AXI_awlen(7 downto 0) <= s00_couplers_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= s00_couplers_to_s00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= s00_couplers_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= s00_couplers_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awuser(15 downto 0) <= s00_couplers_to_s00_couplers_AWUSER(15 downto 0);
  M_AXI_awvalid(0) <= s00_couplers_to_s00_couplers_AWVALID(0);
  M_AXI_bready(0) <= s00_couplers_to_s00_couplers_BREADY(0);
  M_AXI_rready(0) <= s00_couplers_to_s00_couplers_RREADY(0);
  M_AXI_wdata(127 downto 0) <= s00_couplers_to_s00_couplers_WDATA(127 downto 0);
  M_AXI_wlast(0) <= s00_couplers_to_s00_couplers_WLAST(0);
  M_AXI_wstrb(15 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(15 downto 0);
  M_AXI_wvalid(0) <= s00_couplers_to_s00_couplers_WVALID(0);
  S_AXI_arready(0) <= s00_couplers_to_s00_couplers_ARREADY(0);
  S_AXI_awready(0) <= s00_couplers_to_s00_couplers_AWREADY(0);
  S_AXI_bid(15 downto 0) <= s00_couplers_to_s00_couplers_BID(15 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= s00_couplers_to_s00_couplers_BVALID(0);
  S_AXI_rdata(127 downto 0) <= s00_couplers_to_s00_couplers_RDATA(127 downto 0);
  S_AXI_rid(15 downto 0) <= s00_couplers_to_s00_couplers_RID(15 downto 0);
  S_AXI_rlast(0) <= s00_couplers_to_s00_couplers_RLAST(0);
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= s00_couplers_to_s00_couplers_RVALID(0);
  S_AXI_wready(0) <= s00_couplers_to_s00_couplers_WREADY(0);
  s00_couplers_to_s00_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  s00_couplers_to_s00_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_s00_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_s00_couplers_ARID(15 downto 0) <= S_AXI_arid(15 downto 0);
  s00_couplers_to_s00_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_s00_couplers_ARLOCK(0) <= S_AXI_arlock(0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_s00_couplers_ARREADY(0) <= M_AXI_arready(0);
  s00_couplers_to_s00_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_s00_couplers_ARUSER(15 downto 0) <= S_AXI_aruser(15 downto 0);
  s00_couplers_to_s00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  s00_couplers_to_s00_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  s00_couplers_to_s00_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_s00_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_s00_couplers_AWID(15 downto 0) <= S_AXI_awid(15 downto 0);
  s00_couplers_to_s00_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_s00_couplers_AWLOCK(0) <= S_AXI_awlock(0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_s00_couplers_AWREADY(0) <= M_AXI_awready(0);
  s00_couplers_to_s00_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_s00_couplers_AWUSER(15 downto 0) <= S_AXI_awuser(15 downto 0);
  s00_couplers_to_s00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  s00_couplers_to_s00_couplers_BID(15 downto 0) <= M_AXI_bid(15 downto 0);
  s00_couplers_to_s00_couplers_BREADY(0) <= S_AXI_bready(0);
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  s00_couplers_to_s00_couplers_RDATA(127 downto 0) <= M_AXI_rdata(127 downto 0);
  s00_couplers_to_s00_couplers_RID(15 downto 0) <= M_AXI_rid(15 downto 0);
  s00_couplers_to_s00_couplers_RLAST(0) <= M_AXI_rlast(0);
  s00_couplers_to_s00_couplers_RREADY(0) <= S_AXI_rready(0);
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  s00_couplers_to_s00_couplers_WDATA(127 downto 0) <= S_AXI_wdata(127 downto 0);
  s00_couplers_to_s00_couplers_WLAST(0) <= S_AXI_wlast(0);
  s00_couplers_to_s00_couplers_WREADY(0) <= M_AXI_wready(0);
  s00_couplers_to_s00_couplers_WSTRB(15 downto 0) <= S_AXI_wstrb(15 downto 0);
  s00_couplers_to_s00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mercury_XU5_axi_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_AXI_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end Mercury_XU5_axi_interconnect_0_0;

architecture STRUCTURE of Mercury_XU5_axi_interconnect_0_0 is
  component Mercury_XU5_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 79 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 79 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Mercury_XU5_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal axi_interconnect_0_ACLK_net : STD_LOGIC;
  signal axi_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_0_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal m00_couplers_to_axi_interconnect_0_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_axi_interconnect_0_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_ARREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_ARVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_AWREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_AWVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_BREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_BVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_RREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_RVALID : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_WREADY : STD_LOGIC;
  signal m01_couplers_to_axi_interconnect_0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_axi_interconnect_0_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s00_couplers_to_xbar_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal xbar_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARID : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal xbar_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARUSER : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWID : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal xbar_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWUSER : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal xbar_to_m01_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xbar_to_m01_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 128 );
  signal xbar_to_m01_couplers_WLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_xbar_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_xbar_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_xbar_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_xbar_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(39 downto 0) <= m00_couplers_to_axi_interconnect_0_ARADDR(39 downto 0);
  M00_AXI_arburst(1 downto 0) <= m00_couplers_to_axi_interconnect_0_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= m00_couplers_to_axi_interconnect_0_ARCACHE(3 downto 0);
  M00_AXI_arid(15 downto 0) <= m00_couplers_to_axi_interconnect_0_ARID(15 downto 0);
  M00_AXI_arlen(7 downto 0) <= m00_couplers_to_axi_interconnect_0_ARLEN(7 downto 0);
  M00_AXI_arlock(0) <= m00_couplers_to_axi_interconnect_0_ARLOCK(0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_axi_interconnect_0_ARPROT(2 downto 0);
  M00_AXI_arqos(3 downto 0) <= m00_couplers_to_axi_interconnect_0_ARQOS(3 downto 0);
  M00_AXI_arsize(2 downto 0) <= m00_couplers_to_axi_interconnect_0_ARSIZE(2 downto 0);
  M00_AXI_arvalid(0) <= m00_couplers_to_axi_interconnect_0_ARVALID(0);
  M00_AXI_awaddr(39 downto 0) <= m00_couplers_to_axi_interconnect_0_AWADDR(39 downto 0);
  M00_AXI_awburst(1 downto 0) <= m00_couplers_to_axi_interconnect_0_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= m00_couplers_to_axi_interconnect_0_AWCACHE(3 downto 0);
  M00_AXI_awid(15 downto 0) <= m00_couplers_to_axi_interconnect_0_AWID(15 downto 0);
  M00_AXI_awlen(7 downto 0) <= m00_couplers_to_axi_interconnect_0_AWLEN(7 downto 0);
  M00_AXI_awlock(0) <= m00_couplers_to_axi_interconnect_0_AWLOCK(0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_axi_interconnect_0_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= m00_couplers_to_axi_interconnect_0_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= m00_couplers_to_axi_interconnect_0_AWSIZE(2 downto 0);
  M00_AXI_awvalid(0) <= m00_couplers_to_axi_interconnect_0_AWVALID(0);
  M00_AXI_bready(0) <= m00_couplers_to_axi_interconnect_0_BREADY(0);
  M00_AXI_rready(0) <= m00_couplers_to_axi_interconnect_0_RREADY(0);
  M00_AXI_wdata(127 downto 0) <= m00_couplers_to_axi_interconnect_0_WDATA(127 downto 0);
  M00_AXI_wlast(0) <= m00_couplers_to_axi_interconnect_0_WLAST(0);
  M00_AXI_wstrb(15 downto 0) <= m00_couplers_to_axi_interconnect_0_WSTRB(15 downto 0);
  M00_AXI_wvalid(0) <= m00_couplers_to_axi_interconnect_0_WVALID(0);
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(39 downto 0) <= m01_couplers_to_axi_interconnect_0_ARADDR(39 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_axi_interconnect_0_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_axi_interconnect_0_ARVALID;
  M01_AXI_awaddr(39 downto 0) <= m01_couplers_to_axi_interconnect_0_AWADDR(39 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_axi_interconnect_0_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_axi_interconnect_0_AWVALID;
  M01_AXI_bready <= m01_couplers_to_axi_interconnect_0_BREADY;
  M01_AXI_rready <= m01_couplers_to_axi_interconnect_0_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_axi_interconnect_0_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_axi_interconnect_0_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_axi_interconnect_0_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready(0) <= axi_interconnect_0_to_s00_couplers_ARREADY(0);
  S00_AXI_awready(0) <= axi_interconnect_0_to_s00_couplers_AWREADY(0);
  S00_AXI_bid(15 downto 0) <= axi_interconnect_0_to_s00_couplers_BID(15 downto 0);
  S00_AXI_bresp(1 downto 0) <= axi_interconnect_0_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid(0) <= axi_interconnect_0_to_s00_couplers_BVALID(0);
  S00_AXI_rdata(127 downto 0) <= axi_interconnect_0_to_s00_couplers_RDATA(127 downto 0);
  S00_AXI_rid(15 downto 0) <= axi_interconnect_0_to_s00_couplers_RID(15 downto 0);
  S00_AXI_rlast(0) <= axi_interconnect_0_to_s00_couplers_RLAST(0);
  S00_AXI_rresp(1 downto 0) <= axi_interconnect_0_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid(0) <= axi_interconnect_0_to_s00_couplers_RVALID(0);
  S00_AXI_wready(0) <= axi_interconnect_0_to_s00_couplers_WREADY(0);
  axi_interconnect_0_ACLK_net <= ACLK;
  axi_interconnect_0_ARESETN_net <= ARESETN;
  axi_interconnect_0_to_s00_couplers_ARADDR(39 downto 0) <= S00_AXI_araddr(39 downto 0);
  axi_interconnect_0_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  axi_interconnect_0_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  axi_interconnect_0_to_s00_couplers_ARID(15 downto 0) <= S00_AXI_arid(15 downto 0);
  axi_interconnect_0_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  axi_interconnect_0_to_s00_couplers_ARLOCK(0) <= S00_AXI_arlock(0);
  axi_interconnect_0_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  axi_interconnect_0_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  axi_interconnect_0_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  axi_interconnect_0_to_s00_couplers_ARUSER(15 downto 0) <= S00_AXI_aruser(15 downto 0);
  axi_interconnect_0_to_s00_couplers_ARVALID(0) <= S00_AXI_arvalid(0);
  axi_interconnect_0_to_s00_couplers_AWADDR(39 downto 0) <= S00_AXI_awaddr(39 downto 0);
  axi_interconnect_0_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_interconnect_0_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_interconnect_0_to_s00_couplers_AWID(15 downto 0) <= S00_AXI_awid(15 downto 0);
  axi_interconnect_0_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_interconnect_0_to_s00_couplers_AWLOCK(0) <= S00_AXI_awlock(0);
  axi_interconnect_0_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_interconnect_0_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  axi_interconnect_0_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_interconnect_0_to_s00_couplers_AWUSER(15 downto 0) <= S00_AXI_awuser(15 downto 0);
  axi_interconnect_0_to_s00_couplers_AWVALID(0) <= S00_AXI_awvalid(0);
  axi_interconnect_0_to_s00_couplers_BREADY(0) <= S00_AXI_bready(0);
  axi_interconnect_0_to_s00_couplers_RREADY(0) <= S00_AXI_rready(0);
  axi_interconnect_0_to_s00_couplers_WDATA(127 downto 0) <= S00_AXI_wdata(127 downto 0);
  axi_interconnect_0_to_s00_couplers_WLAST(0) <= S00_AXI_wlast(0);
  axi_interconnect_0_to_s00_couplers_WSTRB(15 downto 0) <= S00_AXI_wstrb(15 downto 0);
  axi_interconnect_0_to_s00_couplers_WVALID(0) <= S00_AXI_wvalid(0);
  m00_couplers_to_axi_interconnect_0_ARREADY(0) <= M00_AXI_arready(0);
  m00_couplers_to_axi_interconnect_0_AWREADY(0) <= M00_AXI_awready(0);
  m00_couplers_to_axi_interconnect_0_BID(15 downto 0) <= M00_AXI_bid(15 downto 0);
  m00_couplers_to_axi_interconnect_0_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_axi_interconnect_0_BVALID(0) <= M00_AXI_bvalid(0);
  m00_couplers_to_axi_interconnect_0_RDATA(127 downto 0) <= M00_AXI_rdata(127 downto 0);
  m00_couplers_to_axi_interconnect_0_RID(15 downto 0) <= M00_AXI_rid(15 downto 0);
  m00_couplers_to_axi_interconnect_0_RLAST(0) <= M00_AXI_rlast(0);
  m00_couplers_to_axi_interconnect_0_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_axi_interconnect_0_RVALID(0) <= M00_AXI_rvalid(0);
  m00_couplers_to_axi_interconnect_0_WREADY(0) <= M00_AXI_wready(0);
  m01_couplers_to_axi_interconnect_0_ARREADY <= M01_AXI_arready;
  m01_couplers_to_axi_interconnect_0_AWREADY <= M01_AXI_awready;
  m01_couplers_to_axi_interconnect_0_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_axi_interconnect_0_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_axi_interconnect_0_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_axi_interconnect_0_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_axi_interconnect_0_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_axi_interconnect_0_WREADY <= M01_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_VQEI83
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m00_couplers_to_axi_interconnect_0_ARADDR(39 downto 0),
      M_AXI_arburst(1 downto 0) => m00_couplers_to_axi_interconnect_0_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m00_couplers_to_axi_interconnect_0_ARCACHE(3 downto 0),
      M_AXI_arid(15 downto 0) => m00_couplers_to_axi_interconnect_0_ARID(15 downto 0),
      M_AXI_arlen(7 downto 0) => m00_couplers_to_axi_interconnect_0_ARLEN(7 downto 0),
      M_AXI_arlock(0) => m00_couplers_to_axi_interconnect_0_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_axi_interconnect_0_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m00_couplers_to_axi_interconnect_0_ARQOS(3 downto 0),
      M_AXI_arready(0) => m00_couplers_to_axi_interconnect_0_ARREADY(0),
      M_AXI_arsize(2 downto 0) => m00_couplers_to_axi_interconnect_0_ARSIZE(2 downto 0),
      M_AXI_arvalid(0) => m00_couplers_to_axi_interconnect_0_ARVALID(0),
      M_AXI_awaddr(39 downto 0) => m00_couplers_to_axi_interconnect_0_AWADDR(39 downto 0),
      M_AXI_awburst(1 downto 0) => m00_couplers_to_axi_interconnect_0_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m00_couplers_to_axi_interconnect_0_AWCACHE(3 downto 0),
      M_AXI_awid(15 downto 0) => m00_couplers_to_axi_interconnect_0_AWID(15 downto 0),
      M_AXI_awlen(7 downto 0) => m00_couplers_to_axi_interconnect_0_AWLEN(7 downto 0),
      M_AXI_awlock(0) => m00_couplers_to_axi_interconnect_0_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_axi_interconnect_0_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m00_couplers_to_axi_interconnect_0_AWQOS(3 downto 0),
      M_AXI_awready(0) => m00_couplers_to_axi_interconnect_0_AWREADY(0),
      M_AXI_awsize(2 downto 0) => m00_couplers_to_axi_interconnect_0_AWSIZE(2 downto 0),
      M_AXI_awvalid(0) => m00_couplers_to_axi_interconnect_0_AWVALID(0),
      M_AXI_bid(15 downto 0) => m00_couplers_to_axi_interconnect_0_BID(15 downto 0),
      M_AXI_bready(0) => m00_couplers_to_axi_interconnect_0_BREADY(0),
      M_AXI_bresp(1 downto 0) => m00_couplers_to_axi_interconnect_0_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m00_couplers_to_axi_interconnect_0_BVALID(0),
      M_AXI_rdata(127 downto 0) => m00_couplers_to_axi_interconnect_0_RDATA(127 downto 0),
      M_AXI_rid(15 downto 0) => m00_couplers_to_axi_interconnect_0_RID(15 downto 0),
      M_AXI_rlast(0) => m00_couplers_to_axi_interconnect_0_RLAST(0),
      M_AXI_rready(0) => m00_couplers_to_axi_interconnect_0_RREADY(0),
      M_AXI_rresp(1 downto 0) => m00_couplers_to_axi_interconnect_0_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m00_couplers_to_axi_interconnect_0_RVALID(0),
      M_AXI_wdata(127 downto 0) => m00_couplers_to_axi_interconnect_0_WDATA(127 downto 0),
      M_AXI_wlast(0) => m00_couplers_to_axi_interconnect_0_WLAST(0),
      M_AXI_wready(0) => m00_couplers_to_axi_interconnect_0_WREADY(0),
      M_AXI_wstrb(15 downto 0) => m00_couplers_to_axi_interconnect_0_WSTRB(15 downto 0),
      M_AXI_wvalid(0) => m00_couplers_to_axi_interconnect_0_WVALID(0),
      S_ACLK => axi_interconnect_0_ACLK_net,
      S_ARESETN => axi_interconnect_0_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(15 downto 0) => xbar_to_m00_couplers_ARID(15 downto 0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(15 downto 0) => xbar_to_m00_couplers_AWID(15 downto 0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bid(15 downto 0) => xbar_to_m00_couplers_BID(15 downto 0),
      S_AXI_bready(0) => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      S_AXI_rdata(127 downto 0) => xbar_to_m00_couplers_RDATA(127 downto 0),
      S_AXI_rid(15 downto 0) => xbar_to_m00_couplers_RID(15 downto 0),
      S_AXI_rlast(0) => xbar_to_m00_couplers_RLAST(0),
      S_AXI_rready(0) => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      S_AXI_wdata(127 downto 0) => xbar_to_m00_couplers_WDATA(127 downto 0),
      S_AXI_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready(0) => xbar_to_m00_couplers_WREADY(0),
      S_AXI_wstrb(15 downto 0) => xbar_to_m00_couplers_WSTRB(15 downto 0),
      S_AXI_wvalid(0) => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1TWH8PP
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(39 downto 0) => m01_couplers_to_axi_interconnect_0_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_axi_interconnect_0_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_axi_interconnect_0_ARREADY,
      M_AXI_arvalid => m01_couplers_to_axi_interconnect_0_ARVALID,
      M_AXI_awaddr(39 downto 0) => m01_couplers_to_axi_interconnect_0_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_axi_interconnect_0_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_axi_interconnect_0_AWREADY,
      M_AXI_awvalid => m01_couplers_to_axi_interconnect_0_AWVALID,
      M_AXI_bready => m01_couplers_to_axi_interconnect_0_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_axi_interconnect_0_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_axi_interconnect_0_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_axi_interconnect_0_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_axi_interconnect_0_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_axi_interconnect_0_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_axi_interconnect_0_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_axi_interconnect_0_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_axi_interconnect_0_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_axi_interconnect_0_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_axi_interconnect_0_WVALID,
      S_ACLK => axi_interconnect_0_ACLK_net,
      S_ARESETN => axi_interconnect_0_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      S_AXI_arburst(1 downto 0) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      S_AXI_arcache(3 downto 0) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      S_AXI_arid(15 downto 0) => xbar_to_m01_couplers_ARID(31 downto 16),
      S_AXI_arlen(7 downto 0) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      S_AXI_arlock(0) => xbar_to_m01_couplers_ARLOCK(1),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arqos(3 downto 0) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      S_AXI_arsize(2 downto 0) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      S_AXI_aruser(15 downto 0) => xbar_to_m01_couplers_ARUSER(31 downto 16),
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(39 downto 0) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      S_AXI_awburst(1 downto 0) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      S_AXI_awcache(3 downto 0) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      S_AXI_awid(15 downto 0) => xbar_to_m01_couplers_AWID(31 downto 16),
      S_AXI_awlen(7 downto 0) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      S_AXI_awlock(0) => xbar_to_m01_couplers_AWLOCK(1),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awqos(3 downto 0) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      S_AXI_awsize(2 downto 0) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      S_AXI_awuser(15 downto 0) => xbar_to_m01_couplers_AWUSER(31 downto 16),
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bid(15 downto 0) => xbar_to_m01_couplers_BID(15 downto 0),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(127 downto 0) => xbar_to_m01_couplers_RDATA(127 downto 0),
      S_AXI_rid(15 downto 0) => xbar_to_m01_couplers_RID(15 downto 0),
      S_AXI_rlast => xbar_to_m01_couplers_RLAST,
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(127 downto 0) => xbar_to_m01_couplers_WDATA(255 downto 128),
      S_AXI_wlast => xbar_to_m01_couplers_WLAST(1),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(15 downto 0) => xbar_to_m01_couplers_WSTRB(31 downto 16),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_17XXMTV
     port map (
      M_ACLK => axi_interconnect_0_ACLK_net,
      M_ARESETN => axi_interconnect_0_ARESETN_net,
      M_AXI_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arid(15 downto 0) => s00_couplers_to_xbar_ARID(15 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_aruser(15 downto 0) => s00_couplers_to_xbar_ARUSER(15 downto 0),
      M_AXI_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      M_AXI_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awid(15 downto 0) => s00_couplers_to_xbar_AWID(15 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awuser(15 downto 0) => s00_couplers_to_xbar_AWUSER(15 downto 0),
      M_AXI_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      M_AXI_bid(15 downto 0) => s00_couplers_to_xbar_BID(15 downto 0),
      M_AXI_bready(0) => s00_couplers_to_xbar_BREADY(0),
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(127 downto 0) => s00_couplers_to_xbar_RDATA(127 downto 0),
      M_AXI_rid(15 downto 0) => s00_couplers_to_xbar_RID(15 downto 0),
      M_AXI_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready(0) => s00_couplers_to_xbar_RREADY(0),
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(127 downto 0) => s00_couplers_to_xbar_WDATA(127 downto 0),
      M_AXI_wlast(0) => s00_couplers_to_xbar_WLAST(0),
      M_AXI_wready(0) => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(15 downto 0) => s00_couplers_to_xbar_WSTRB(15 downto 0),
      M_AXI_wvalid(0) => s00_couplers_to_xbar_WVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(39 downto 0) => axi_interconnect_0_to_s00_couplers_ARADDR(39 downto 0),
      S_AXI_arburst(1 downto 0) => axi_interconnect_0_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_interconnect_0_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(15 downto 0) => axi_interconnect_0_to_s00_couplers_ARID(15 downto 0),
      S_AXI_arlen(7 downto 0) => axi_interconnect_0_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => axi_interconnect_0_to_s00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => axi_interconnect_0_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => axi_interconnect_0_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready(0) => axi_interconnect_0_to_s00_couplers_ARREADY(0),
      S_AXI_arsize(2 downto 0) => axi_interconnect_0_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_aruser(15 downto 0) => axi_interconnect_0_to_s00_couplers_ARUSER(15 downto 0),
      S_AXI_arvalid(0) => axi_interconnect_0_to_s00_couplers_ARVALID(0),
      S_AXI_awaddr(39 downto 0) => axi_interconnect_0_to_s00_couplers_AWADDR(39 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_0_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_0_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(15 downto 0) => axi_interconnect_0_to_s00_couplers_AWID(15 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_0_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => axi_interconnect_0_to_s00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_0_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => axi_interconnect_0_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready(0) => axi_interconnect_0_to_s00_couplers_AWREADY(0),
      S_AXI_awsize(2 downto 0) => axi_interconnect_0_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awuser(15 downto 0) => axi_interconnect_0_to_s00_couplers_AWUSER(15 downto 0),
      S_AXI_awvalid(0) => axi_interconnect_0_to_s00_couplers_AWVALID(0),
      S_AXI_bid(15 downto 0) => axi_interconnect_0_to_s00_couplers_BID(15 downto 0),
      S_AXI_bready(0) => axi_interconnect_0_to_s00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => axi_interconnect_0_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => axi_interconnect_0_to_s00_couplers_BVALID(0),
      S_AXI_rdata(127 downto 0) => axi_interconnect_0_to_s00_couplers_RDATA(127 downto 0),
      S_AXI_rid(15 downto 0) => axi_interconnect_0_to_s00_couplers_RID(15 downto 0),
      S_AXI_rlast(0) => axi_interconnect_0_to_s00_couplers_RLAST(0),
      S_AXI_rready(0) => axi_interconnect_0_to_s00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => axi_interconnect_0_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => axi_interconnect_0_to_s00_couplers_RVALID(0),
      S_AXI_wdata(127 downto 0) => axi_interconnect_0_to_s00_couplers_WDATA(127 downto 0),
      S_AXI_wlast(0) => axi_interconnect_0_to_s00_couplers_WLAST(0),
      S_AXI_wready(0) => axi_interconnect_0_to_s00_couplers_WREADY(0),
      S_AXI_wstrb(15 downto 0) => axi_interconnect_0_to_s00_couplers_WSTRB(15 downto 0),
      S_AXI_wvalid(0) => axi_interconnect_0_to_s00_couplers_WVALID(0)
    );
xbar: component Mercury_XU5_xbar_0
     port map (
      aclk => axi_interconnect_0_ACLK_net,
      aresetn => axi_interconnect_0_ARESETN_net,
      m_axi_araddr(79 downto 40) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      m_axi_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      m_axi_arburst(3 downto 2) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(7 downto 4) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(31 downto 16) => xbar_to_m01_couplers_ARID(31 downto 16),
      m_axi_arid(15 downto 0) => xbar_to_m00_couplers_ARID(15 downto 0),
      m_axi_arlen(15 downto 8) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(1) => xbar_to_m01_couplers_ARLOCK(1),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(7 downto 4) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      m_axi_arregion(7 downto 4) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      m_axi_arregion(3 downto 0) => NLW_xbar_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(5 downto 3) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_aruser(31 downto 16) => xbar_to_m01_couplers_ARUSER(31 downto 16),
      m_axi_aruser(15 downto 0) => NLW_xbar_m_axi_aruser_UNCONNECTED(15 downto 0),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(79 downto 40) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      m_axi_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      m_axi_awburst(3 downto 2) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(7 downto 4) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(31 downto 16) => xbar_to_m01_couplers_AWID(31 downto 16),
      m_axi_awid(15 downto 0) => xbar_to_m00_couplers_AWID(15 downto 0),
      m_axi_awlen(15 downto 8) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(1) => xbar_to_m01_couplers_AWLOCK(1),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(7 downto 4) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      m_axi_awregion(7 downto 4) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      m_axi_awregion(3 downto 0) => NLW_xbar_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(5 downto 3) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awuser(31 downto 16) => xbar_to_m01_couplers_AWUSER(31 downto 16),
      m_axi_awuser(15 downto 0) => NLW_xbar_m_axi_awuser_UNCONNECTED(15 downto 0),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bid(31 downto 16) => xbar_to_m01_couplers_BID(15 downto 0),
      m_axi_bid(15 downto 0) => xbar_to_m00_couplers_BID(15 downto 0),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      m_axi_rdata(255 downto 128) => xbar_to_m01_couplers_RDATA(127 downto 0),
      m_axi_rdata(127 downto 0) => xbar_to_m00_couplers_RDATA(127 downto 0),
      m_axi_rid(31 downto 16) => xbar_to_m01_couplers_RID(15 downto 0),
      m_axi_rid(15 downto 0) => xbar_to_m00_couplers_RID(15 downto 0),
      m_axi_rlast(1) => xbar_to_m01_couplers_RLAST,
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST(0),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      m_axi_wdata(255 downto 128) => xbar_to_m01_couplers_WDATA(255 downto 128),
      m_axi_wdata(127 downto 0) => xbar_to_m00_couplers_WDATA(127 downto 0),
      m_axi_wlast(1) => xbar_to_m01_couplers_WLAST(1),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY(0),
      m_axi_wstrb(31 downto 16) => xbar_to_m01_couplers_WSTRB(31 downto 16),
      m_axi_wstrb(15 downto 0) => xbar_to_m00_couplers_WSTRB(15 downto 0),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arid(15 downto 0) => s00_couplers_to_xbar_ARID(15 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_aruser(15 downto 0) => s00_couplers_to_xbar_ARUSER(15 downto 0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID(0),
      s_axi_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 0) => s00_couplers_to_xbar_AWID(15 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awuser(15 downto 0) => s00_couplers_to_xbar_AWUSER(15 downto 0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID(0),
      s_axi_bid(15 downto 0) => s00_couplers_to_xbar_BID(15 downto 0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY(0),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(127 downto 0) => s00_couplers_to_xbar_RDATA(127 downto 0),
      s_axi_rid(15 downto 0) => s00_couplers_to_xbar_RID(15 downto 0),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY(0),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(127 downto 0) => s00_couplers_to_xbar_WDATA(127 downto 0),
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST(0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(15 downto 0) => s00_couplers_to_xbar_WSTRB(15 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mercury_XU5 is
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
    IIC_scl_i : in STD_LOGIC;
    IIC_scl_o : out STD_LOGIC;
    IIC_scl_t : out STD_LOGIC;
    IIC_sda_i : in STD_LOGIC;
    IIC_sda_o : out STD_LOGIC;
    IIC_sda_t : out STD_LOGIC;
    LED_N_PL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MDIO_mdc : out STD_LOGIC;
    MDIO_mdio_i : in STD_LOGIC;
    MDIO_mdio_o : out STD_LOGIC;
    MDIO_mdio_t : out STD_LOGIC;
    Rst_N : out STD_LOGIC;
    reg_ro : in STD_LOGIC_VECTOR ( 2047 downto 0 );
    reg_rw : out STD_LOGIC_VECTOR ( 2047 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Mercury_XU5 : entity is "Mercury_XU5,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Mercury_XU5,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=18,numReposBlks=14,numNonXlnxBlks=1,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Mercury_XU5 : entity is "Mercury_XU5.hwdef";
end Mercury_XU5;

architecture STRUCTURE of Mercury_XU5 is
  component Mercury_XU5_zynq_ultra_ps_e_0 is
  port (
    maxihpm0_fpd_aclk : in STD_LOGIC;
    maxigp0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_awlock : out STD_LOGIC;
    maxigp0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awvalid : out STD_LOGIC;
    maxigp0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awready : in STD_LOGIC;
    maxigp0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    maxigp0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_wlast : out STD_LOGIC;
    maxigp0_wvalid : out STD_LOGIC;
    maxigp0_wready : in STD_LOGIC;
    maxigp0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_bvalid : in STD_LOGIC;
    maxigp0_bready : out STD_LOGIC;
    maxigp0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_arlock : out STD_LOGIC;
    maxigp0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arvalid : out STD_LOGIC;
    maxigp0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_arready : in STD_LOGIC;
    maxigp0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    maxigp0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_rlast : in STD_LOGIC;
    maxigp0_rvalid : in STD_LOGIC;
    maxigp0_rready : out STD_LOGIC;
    maxigp0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxihpm0_lpd_aclk : in STD_LOGIC;
    maxigp2_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_awlock : out STD_LOGIC;
    maxigp2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awvalid : out STD_LOGIC;
    maxigp2_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awready : in STD_LOGIC;
    maxigp2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_wlast : out STD_LOGIC;
    maxigp2_wvalid : out STD_LOGIC;
    maxigp2_wready : in STD_LOGIC;
    maxigp2_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_bvalid : in STD_LOGIC;
    maxigp2_bready : out STD_LOGIC;
    maxigp2_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_arlock : out STD_LOGIC;
    maxigp2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arvalid : out STD_LOGIC;
    maxigp2_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_arready : in STD_LOGIC;
    maxigp2_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_rlast : in STD_LOGIC;
    maxigp2_rvalid : in STD_LOGIC;
    maxigp2_rready : out STD_LOGIC;
    maxigp2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_enet1_gmii_rx_clk : in STD_LOGIC;
    emio_enet1_speed_mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    emio_enet1_gmii_crs : in STD_LOGIC;
    emio_enet1_gmii_col : in STD_LOGIC;
    emio_enet1_gmii_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    emio_enet1_gmii_rx_er : in STD_LOGIC;
    emio_enet1_gmii_rx_dv : in STD_LOGIC;
    emio_enet1_gmii_tx_clk : in STD_LOGIC;
    emio_enet1_gmii_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    emio_enet1_gmii_tx_en : out STD_LOGIC;
    emio_enet1_gmii_tx_er : out STD_LOGIC;
    emio_enet1_mdio_mdc : out STD_LOGIC;
    emio_enet1_mdio_i : in STD_LOGIC;
    emio_enet1_mdio_o : out STD_LOGIC;
    emio_enet1_mdio_t : out STD_LOGIC;
    emio_enet1_tsu_inc_ctrl : in STD_LOGIC_VECTOR ( 1 downto 0 );
    emio_enet1_tsu_timer_cmp_val : out STD_LOGIC;
    emio_enet0_enet_tsu_timer_cnt : out STD_LOGIC_VECTOR ( 93 downto 0 );
    emio_enet1_ext_int_in : in STD_LOGIC;
    emio_enet1_dma_bus_width : out STD_LOGIC_VECTOR ( 1 downto 0 );
    emio_i2c1_scl_i : in STD_LOGIC;
    emio_i2c1_scl_o : out STD_LOGIC;
    emio_i2c1_scl_t : out STD_LOGIC;
    emio_i2c1_sda_i : in STD_LOGIC;
    emio_i2c1_sda_o : out STD_LOGIC;
    emio_i2c1_sda_t : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC
  );
  end component Mercury_XU5_zynq_ultra_ps_e_0;
  component Mercury_XU5_system_management_wiz_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    user_temp_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccpsintlp_alarm_out : out STD_LOGIC;
    vccpsintfp_alarm_out : out STD_LOGIC;
    vccpsaux_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    eoc_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC
  );
  end component Mercury_XU5_system_management_wiz_0;
  component Mercury_XU5_led_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Mercury_XU5_led_0;
  component Mercury_XU5_ddr4_0 is
  port (
    c0_init_calib_complete : out STD_LOGIC;
    dbg_clk : out STD_LOGIC;
    c0_sys_clk_p : in STD_LOGIC;
    c0_sys_clk_n : in STD_LOGIC;
    dbg_bus : out STD_LOGIC_VECTOR ( 511 downto 0 );
    c0_ddr4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    c0_ddr4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_dm_dbi_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_dqs_c : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_dqs_t : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_reset_n : out STD_LOGIC;
    c0_ddr4_act_n : out STD_LOGIC;
    c0_ddr4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ui_clk : out STD_LOGIC;
    c0_ddr4_ui_clk_sync_rst : out STD_LOGIC;
    c0_ddr4_aresetn : in STD_LOGIC;
    c0_ddr4_s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_awaddr : in STD_LOGIC_VECTOR ( 28 downto 0 );
    c0_ddr4_s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awvalid : in STD_LOGIC;
    c0_ddr4_s_axi_awready : out STD_LOGIC;
    c0_ddr4_s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    c0_ddr4_s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_wlast : in STD_LOGIC;
    c0_ddr4_s_axi_wvalid : in STD_LOGIC;
    c0_ddr4_s_axi_wready : out STD_LOGIC;
    c0_ddr4_s_axi_bready : in STD_LOGIC;
    c0_ddr4_s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_bvalid : out STD_LOGIC;
    c0_ddr4_s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_araddr : in STD_LOGIC_VECTOR ( 28 downto 0 );
    c0_ddr4_s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arvalid : in STD_LOGIC;
    c0_ddr4_s_axi_arready : out STD_LOGIC;
    c0_ddr4_s_axi_rready : in STD_LOGIC;
    c0_ddr4_s_axi_rlast : out STD_LOGIC;
    c0_ddr4_s_axi_rvalid : out STD_LOGIC;
    c0_ddr4_s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    sys_rst : in STD_LOGIC
  );
  end component Mercury_XU5_ddr4_0;
  component Mercury_XU5_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component Mercury_XU5_clk_wiz_0_0;
  component Mercury_XU5_ps_sys_rst_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Mercury_XU5_ps_sys_rst_0;
  component Mercury_XU5_ddr4_sys_rst_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Mercury_XU5_ddr4_sys_rst_0;
  component Mercury_XU5_smartconnect_00_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC
  );
  end component Mercury_XU5_smartconnect_00_0;
  component Mercury_XU5_reg_bank_0_0 is
  port (
    reg_rw : out STD_LOGIC_VECTOR ( 2047 downto 0 );
    reg_ro : in STD_LOGIC_VECTOR ( 2047 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component Mercury_XU5_reg_bank_0_0;
  signal ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal C0_SYS_CLK_1_CLK_N : STD_LOGIC;
  signal C0_SYS_CLK_1_CLK_P : STD_LOGIC;
  signal CLK_ETH10 : STD_LOGIC;
  signal CLK_ETH125_90 : STD_LOGIC;
  signal CLK_ETH25 : STD_LOGIC;
  signal S00_AXI_1_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal S00_AXI_1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_1_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S00_AXI_1_ARLOCK : STD_LOGIC;
  signal S00_AXI_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_1_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_1_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_ARVALID : STD_LOGIC;
  signal S00_AXI_1_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal S00_AXI_1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_1_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S00_AXI_1_AWLOCK : STD_LOGIC;
  signal S00_AXI_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_1_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_1_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_AWVALID : STD_LOGIC;
  signal S00_AXI_1_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_BREADY : STD_LOGIC;
  signal S00_AXI_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_1_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S00_AXI_1_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_RREADY : STD_LOGIC;
  signal S00_AXI_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_1_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S00_AXI_1_WLAST : STD_LOGIC;
  signal S00_AXI_1_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_AXI_1_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_1_WVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_M00_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_interconnect_0_M00_AXI_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_M00_AXI_RLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_interconnect_0_M00_AXI_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_interconnect_0_M00_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M01_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M01_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M01_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M01_AXI_WVALID : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal ddr4_C0_DDR4_ACT_N : STD_LOGIC;
  signal ddr4_C0_DDR4_ADR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ddr4_C0_DDR4_BA : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_BG : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CKE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CK_C : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CK_T : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_DM_N : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_DQ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ddr4_C0_DDR4_DQS_C : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_DQS_T : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_ODT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_RESET_N : STD_LOGIC;
  signal ddr4_c0_ddr4_ui_clk : STD_LOGIC;
  signal ddr4_sys_rst_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_sys_rst_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal led_gpio_io_o : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps_sys_rst_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps_sys_rst_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal reg_bank_0_reg_rw : STD_LOGIC_VECTOR ( 2047 downto 0 );
  signal reg_ro_1 : STD_LOGIC_VECTOR ( 2047 downto 0 );
  signal smartconnect_00_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_00_M00_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_00_M00_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_00_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_00_M00_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_00_M00_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_00_M00_AXI_BREADY : STD_LOGIC;
  signal smartconnect_00_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_00_M00_AXI_BVALID : STD_LOGIC;
  signal smartconnect_00_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_00_M00_AXI_RREADY : STD_LOGIC;
  signal smartconnect_00_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_00_M00_AXI_RVALID : STD_LOGIC;
  signal smartconnect_00_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_00_M00_AXI_WREADY : STD_LOGIC;
  signal smartconnect_00_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_00_M00_AXI_WVALID : STD_LOGIC;
  signal smartconnect_00_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_00_M01_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_00_M01_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_00_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_00_M01_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_00_M01_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_00_M01_AXI_BREADY : STD_LOGIC;
  signal smartconnect_00_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_00_M01_AXI_BVALID : STD_LOGIC;
  signal smartconnect_00_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_00_M01_AXI_RREADY : STD_LOGIC;
  signal smartconnect_00_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_00_M01_AXI_RVALID : STD_LOGIC;
  signal smartconnect_00_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_00_M01_AXI_WREADY : STD_LOGIC;
  signal smartconnect_00_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_00_M01_AXI_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_COL : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_CRS : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_RX_CLK : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RX_DV : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RX_ER : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_TXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_TX_CLK : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_TX_EN : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_TX_ER : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SCL_I : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SCL_O : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SCL_T : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SDA_I : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SDA_O : STD_LOGIC;
  signal zynq_ultra_ps_e_IIC_1_SDA_T : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDC : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_I : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_O : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_T : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_clk0 : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_clk1 : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_resetn0 : STD_LOGIC;
  signal NLW_ddr4_c0_ddr4_ui_clk_sync_rst_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_c0_init_calib_complete_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_dbg_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_dbg_bus_UNCONNECTED : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal NLW_ddr4_sys_rst_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_sys_rst_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ps_sys_rst_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_ps_sys_rst_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ps_sys_rst_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_smartconnect_00_M00_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_00_M00_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_00_M01_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_00_M01_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_system_management_wiz_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_busy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_eoc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_eos_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_ot_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_user_temp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccint_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsintfp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsintlp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_channel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_emio_enet1_tsu_timer_cmp_val_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED : STD_LOGIC_VECTOR ( 93 downto 0 );
  signal NLW_zynq_ultra_ps_e_emio_enet1_dma_bus_width_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of C0_DDR4_act_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ACT_N";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of C0_DDR4_act_n : signal is "XIL_INTERFACENAME C0_DDR4, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 16, CAS_WRITE_LATENCY 11, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 16, MEMORY_PART MT40A256M16GE-083E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 938";
  attribute X_INTERFACE_INFO of C0_DDR4_reset_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 RESET_N";
  attribute X_INTERFACE_INFO of C0_SYS_CLK_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 C0_SYS_CLK CLK_N";
  attribute X_INTERFACE_PARAMETER of C0_SYS_CLK_clk_n : signal is "XIL_INTERFACENAME C0_SYS_CLK, CAN_DEBUG false, FREQ_HZ 100000000";
  attribute X_INTERFACE_INFO of C0_SYS_CLK_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 C0_SYS_CLK CLK_P";
  attribute X_INTERFACE_INFO of Clk100 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK100 CLK";
  attribute X_INTERFACE_PARAMETER of Clk100 : signal is "XIL_INTERFACENAME CLK.CLK100, CLK_DOMAIN Mercury_XU5_zynq_ultra_ps_e_0_pl_clk0, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of Clk50 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK50 CLK";
  attribute X_INTERFACE_PARAMETER of Clk50 : signal is "XIL_INTERFACENAME CLK.CLK50, CLK_DOMAIN Mercury_XU5_zynq_ultra_ps_e_0_pl_clk1, FREQ_HZ 49999500, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ETH_CLK10 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK10 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK10 : signal is "XIL_INTERFACENAME CLK.ETH_CLK10, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 9999900, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ETH_CLK125 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK125 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK125 : signal is "XIL_INTERFACENAME CLK.ETH_CLK125, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 124998750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ETH_CLK125_90 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK125_90 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK125_90 : signal is "XIL_INTERFACENAME CLK.ETH_CLK125_90, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 124998750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 90.0";
  attribute X_INTERFACE_INFO of ETH_CLK25 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK25 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK25 : signal is "XIL_INTERFACENAME CLK.ETH_CLK25, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 24999750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of GMII_col : signal is "xilinx.com:interface:gmii:1.0 GMII COL";
  attribute X_INTERFACE_INFO of GMII_crs : signal is "xilinx.com:interface:gmii:1.0 GMII CRS";
  attribute X_INTERFACE_INFO of GMII_rx_clk : signal is "xilinx.com:interface:gmii:1.0 GMII RX_CLK";
  attribute X_INTERFACE_INFO of GMII_rx_dv : signal is "xilinx.com:interface:gmii:1.0 GMII RX_DV";
  attribute X_INTERFACE_INFO of GMII_rx_er : signal is "xilinx.com:interface:gmii:1.0 GMII RX_ER";
  attribute X_INTERFACE_INFO of GMII_tx_clk : signal is "xilinx.com:interface:gmii:1.0 GMII TX_CLK";
  attribute X_INTERFACE_INFO of GMII_tx_en : signal is "xilinx.com:interface:gmii:1.0 GMII TX_EN";
  attribute X_INTERFACE_INFO of GMII_tx_er : signal is "xilinx.com:interface:gmii:1.0 GMII TX_ER";
  attribute X_INTERFACE_INFO of IIC_scl_i : signal is "xilinx.com:interface:iic:1.0 IIC SCL_I";
  attribute X_INTERFACE_INFO of IIC_scl_o : signal is "xilinx.com:interface:iic:1.0 IIC SCL_O";
  attribute X_INTERFACE_INFO of IIC_scl_t : signal is "xilinx.com:interface:iic:1.0 IIC SCL_T";
  attribute X_INTERFACE_INFO of IIC_sda_i : signal is "xilinx.com:interface:iic:1.0 IIC SDA_I";
  attribute X_INTERFACE_INFO of IIC_sda_o : signal is "xilinx.com:interface:iic:1.0 IIC SDA_O";
  attribute X_INTERFACE_INFO of IIC_sda_t : signal is "xilinx.com:interface:iic:1.0 IIC SDA_T";
  attribute X_INTERFACE_INFO of MDIO_mdc : signal is "xilinx.com:interface:mdio:1.0 MDIO MDC";
  attribute X_INTERFACE_PARAMETER of MDIO_mdc : signal is "XIL_INTERFACENAME MDIO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of MDIO_mdio_i : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  attribute X_INTERFACE_INFO of MDIO_mdio_o : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
  attribute X_INTERFACE_INFO of MDIO_mdio_t : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
  attribute X_INTERFACE_INFO of Rst_N : signal is "xilinx.com:signal:reset:1.0 RST.RST_N RST";
  attribute X_INTERFACE_PARAMETER of Rst_N : signal is "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of C0_DDR4_adr : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ADR";
  attribute X_INTERFACE_INFO of C0_DDR4_ba : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 BA";
  attribute X_INTERFACE_INFO of C0_DDR4_bg : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 BG";
  attribute X_INTERFACE_INFO of C0_DDR4_ck_c : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CK_C";
  attribute X_INTERFACE_INFO of C0_DDR4_ck_t : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CK_T";
  attribute X_INTERFACE_INFO of C0_DDR4_cke : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CKE";
  attribute X_INTERFACE_INFO of C0_DDR4_cs_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CS_N";
  attribute X_INTERFACE_INFO of C0_DDR4_dm_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DM_N";
  attribute X_INTERFACE_INFO of C0_DDR4_dq : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQ";
  attribute X_INTERFACE_INFO of C0_DDR4_dqs_c : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQS_C";
  attribute X_INTERFACE_INFO of C0_DDR4_dqs_t : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQS_T";
  attribute X_INTERFACE_INFO of C0_DDR4_odt : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ODT";
  attribute X_INTERFACE_INFO of GMII_rxd : signal is "xilinx.com:interface:gmii:1.0 GMII RXD";
  attribute X_INTERFACE_INFO of GMII_speed_mode : signal is "xilinx.com:interface:gmii:1.0 GMII SPEED_MODE";
  attribute X_INTERFACE_INFO of GMII_txd : signal is "xilinx.com:interface:gmii:1.0 GMII TXD";
  attribute X_INTERFACE_INFO of reg_ro : signal is "xilinx.com:signal:data:1.0 DATA.REG_RO DATA";
  attribute X_INTERFACE_PARAMETER of reg_ro : signal is "XIL_INTERFACENAME DATA.REG_RO, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of reg_rw : signal is "xilinx.com:signal:data:1.0 DATA.REG_RW DATA";
  attribute X_INTERFACE_PARAMETER of reg_rw : signal is "XIL_INTERFACENAME DATA.REG_RW, LAYERED_METADATA undef";
begin
  C0_DDR4_act_n <= ddr4_C0_DDR4_ACT_N;
  C0_DDR4_adr(16 downto 0) <= ddr4_C0_DDR4_ADR(16 downto 0);
  C0_DDR4_ba(1 downto 0) <= ddr4_C0_DDR4_BA(1 downto 0);
  C0_DDR4_bg(0) <= ddr4_C0_DDR4_BG(0);
  C0_DDR4_ck_c(0) <= ddr4_C0_DDR4_CK_C(0);
  C0_DDR4_ck_t(0) <= ddr4_C0_DDR4_CK_T(0);
  C0_DDR4_cke(0) <= ddr4_C0_DDR4_CKE(0);
  C0_DDR4_cs_n(0) <= ddr4_C0_DDR4_CS_N(0);
  C0_DDR4_odt(0) <= ddr4_C0_DDR4_ODT(0);
  C0_DDR4_reset_n <= ddr4_C0_DDR4_RESET_N;
  C0_SYS_CLK_1_CLK_N <= C0_SYS_CLK_clk_n;
  C0_SYS_CLK_1_CLK_P <= C0_SYS_CLK_clk_p;
  Clk100 <= zynq_ultra_ps_e_pl_clk0;
  Clk50 <= zynq_ultra_ps_e_pl_clk1;
  ETH_CLK10 <= CLK_ETH10;
  ETH_CLK125_90 <= CLK_ETH125_90;
  ETH_CLK25 <= CLK_ETH25;
  ETH_resetn <= clk_wiz_0_locked;
  GMII_speed_mode(2 downto 0) <= zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE(2 downto 0);
  GMII_tx_en <= zynq_ultra_ps_e_GMII_ENET1_TX_EN;
  GMII_tx_er <= zynq_ultra_ps_e_GMII_ENET1_TX_ER;
  GMII_txd(7 downto 0) <= zynq_ultra_ps_e_GMII_ENET1_TXD(7 downto 0);
  IIC_scl_o <= zynq_ultra_ps_e_IIC_1_SCL_O;
  IIC_scl_t <= zynq_ultra_ps_e_IIC_1_SCL_T;
  IIC_sda_o <= zynq_ultra_ps_e_IIC_1_SDA_O;
  IIC_sda_t <= zynq_ultra_ps_e_IIC_1_SDA_T;
  LED_N_PL(1 downto 0) <= led_gpio_io_o(1 downto 0);
  MDIO_mdc <= zynq_ultra_ps_e_MDIO_ENET1_MDC;
  MDIO_mdio_o <= zynq_ultra_ps_e_MDIO_ENET1_MDIO_O;
  MDIO_mdio_t <= zynq_ultra_ps_e_MDIO_ENET1_MDIO_T;
  Rst_N <= zynq_ultra_ps_e_pl_resetn0;
  reg_ro_1(2047 downto 0) <= reg_ro(2047 downto 0);
  reg_rw(2047 downto 0) <= reg_bank_0_reg_rw(2047 downto 0);
  zynq_ultra_ps_e_GMII_ENET1_COL <= GMII_col;
  zynq_ultra_ps_e_GMII_ENET1_CRS <= GMII_crs;
  zynq_ultra_ps_e_GMII_ENET1_RXD(7 downto 0) <= GMII_rxd(7 downto 0);
  zynq_ultra_ps_e_GMII_ENET1_RX_CLK <= GMII_rx_clk;
  zynq_ultra_ps_e_GMII_ENET1_RX_DV <= GMII_rx_dv;
  zynq_ultra_ps_e_GMII_ENET1_RX_ER <= GMII_rx_er;
  zynq_ultra_ps_e_GMII_ENET1_TX_CLK <= GMII_tx_clk;
  zynq_ultra_ps_e_IIC_1_SCL_I <= IIC_scl_i;
  zynq_ultra_ps_e_IIC_1_SDA_I <= IIC_sda_i;
  zynq_ultra_ps_e_MDIO_ENET1_MDIO_I <= MDIO_mdio_i;
axi_interconnect_0: entity work.Mercury_XU5_axi_interconnect_0_0
     port map (
      ACLK => ddr4_c0_ddr4_ui_clk,
      ARESETN => ARESETN_1(0),
      M00_ACLK => ddr4_c0_ddr4_ui_clk,
      M00_ARESETN => ARESETN_1(0),
      M00_AXI_araddr(39 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(39 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arid(15 downto 0) => axi_interconnect_0_M00_AXI_ARID(15 downto 0),
      M00_AXI_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => axi_interconnect_0_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_interconnect_0_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready(0) => axi_interconnect_0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid(0) => axi_interconnect_0_M00_AXI_ARVALID(0),
      M00_AXI_awaddr(39 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(39 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awid(15 downto 0) => axi_interconnect_0_M00_AXI_AWID(15 downto 0),
      M00_AXI_awlen(7 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => axi_interconnect_0_M00_AXI_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready(0) => axi_interconnect_0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid(0) => axi_interconnect_0_M00_AXI_AWVALID(0),
      M00_AXI_bid(15 downto 0) => axi_interconnect_0_M00_AXI_BID(15 downto 0),
      M00_AXI_bready(0) => axi_interconnect_0_M00_AXI_BREADY(0),
      M00_AXI_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid(0) => axi_interconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(127 downto 0) => axi_interconnect_0_M00_AXI_RDATA(127 downto 0),
      M00_AXI_rid(15 downto 0) => axi_interconnect_0_M00_AXI_RID(15 downto 0),
      M00_AXI_rlast(0) => axi_interconnect_0_M00_AXI_RLAST,
      M00_AXI_rready(0) => axi_interconnect_0_M00_AXI_RREADY(0),
      M00_AXI_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid(0) => axi_interconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(127 downto 0) => axi_interconnect_0_M00_AXI_WDATA(127 downto 0),
      M00_AXI_wlast(0) => axi_interconnect_0_M00_AXI_WLAST(0),
      M00_AXI_wready(0) => axi_interconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(15 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(15 downto 0),
      M00_AXI_wvalid(0) => axi_interconnect_0_M00_AXI_WVALID(0),
      M01_ACLK => ddr4_c0_ddr4_ui_clk,
      M01_ARESETN => ddr4_sys_rst_peripheral_aresetn(0),
      M01_AXI_araddr(39 downto 0) => axi_interconnect_0_M01_AXI_ARADDR(39 downto 0),
      M01_AXI_arprot(2 downto 0) => axi_interconnect_0_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => axi_interconnect_0_M01_AXI_ARREADY,
      M01_AXI_arvalid => axi_interconnect_0_M01_AXI_ARVALID,
      M01_AXI_awaddr(39 downto 0) => axi_interconnect_0_M01_AXI_AWADDR(39 downto 0),
      M01_AXI_awprot(2 downto 0) => axi_interconnect_0_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => axi_interconnect_0_M01_AXI_AWREADY,
      M01_AXI_awvalid => axi_interconnect_0_M01_AXI_AWVALID,
      M01_AXI_bready => axi_interconnect_0_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => axi_interconnect_0_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => axi_interconnect_0_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => axi_interconnect_0_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => axi_interconnect_0_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => axi_interconnect_0_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => axi_interconnect_0_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => axi_interconnect_0_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => axi_interconnect_0_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => axi_interconnect_0_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => axi_interconnect_0_M01_AXI_WVALID,
      S00_ACLK => ddr4_c0_ddr4_ui_clk,
      S00_ARESETN => ARESETN_1(0),
      S00_AXI_araddr(39 downto 0) => S00_AXI_1_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => S00_AXI_1_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => S00_AXI_1_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => S00_AXI_1_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => S00_AXI_1_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => S00_AXI_1_ARLOCK,
      S00_AXI_arprot(2 downto 0) => S00_AXI_1_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => S00_AXI_1_ARQOS(3 downto 0),
      S00_AXI_arready(0) => S00_AXI_1_ARREADY(0),
      S00_AXI_arsize(2 downto 0) => S00_AXI_1_ARSIZE(2 downto 0),
      S00_AXI_aruser(15 downto 0) => S00_AXI_1_ARUSER(15 downto 0),
      S00_AXI_arvalid(0) => S00_AXI_1_ARVALID,
      S00_AXI_awaddr(39 downto 0) => S00_AXI_1_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => S00_AXI_1_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => S00_AXI_1_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => S00_AXI_1_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => S00_AXI_1_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => S00_AXI_1_AWLOCK,
      S00_AXI_awprot(2 downto 0) => S00_AXI_1_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => S00_AXI_1_AWQOS(3 downto 0),
      S00_AXI_awready(0) => S00_AXI_1_AWREADY(0),
      S00_AXI_awsize(2 downto 0) => S00_AXI_1_AWSIZE(2 downto 0),
      S00_AXI_awuser(15 downto 0) => S00_AXI_1_AWUSER(15 downto 0),
      S00_AXI_awvalid(0) => S00_AXI_1_AWVALID,
      S00_AXI_bid(15 downto 0) => S00_AXI_1_BID(15 downto 0),
      S00_AXI_bready(0) => S00_AXI_1_BREADY,
      S00_AXI_bresp(1 downto 0) => S00_AXI_1_BRESP(1 downto 0),
      S00_AXI_bvalid(0) => S00_AXI_1_BVALID(0),
      S00_AXI_rdata(127 downto 0) => S00_AXI_1_RDATA(127 downto 0),
      S00_AXI_rid(15 downto 0) => S00_AXI_1_RID(15 downto 0),
      S00_AXI_rlast(0) => S00_AXI_1_RLAST(0),
      S00_AXI_rready(0) => S00_AXI_1_RREADY,
      S00_AXI_rresp(1 downto 0) => S00_AXI_1_RRESP(1 downto 0),
      S00_AXI_rvalid(0) => S00_AXI_1_RVALID(0),
      S00_AXI_wdata(127 downto 0) => S00_AXI_1_WDATA(127 downto 0),
      S00_AXI_wlast(0) => S00_AXI_1_WLAST,
      S00_AXI_wready(0) => S00_AXI_1_WREADY(0),
      S00_AXI_wstrb(15 downto 0) => S00_AXI_1_WSTRB(15 downto 0),
      S00_AXI_wvalid(0) => S00_AXI_1_WVALID
    );
clk_wiz_0: component Mercury_XU5_clk_wiz_0_0
     port map (
      clk_in1 => zynq_ultra_ps_e_pl_clk1,
      clk_out1 => ETH_CLK125,
      clk_out2 => CLK_ETH125_90,
      clk_out3 => CLK_ETH25,
      clk_out4 => CLK_ETH10,
      locked => clk_wiz_0_locked,
      resetn => zynq_ultra_ps_e_pl_resetn0
    );
ddr4: component Mercury_XU5_ddr4_0
     port map (
      c0_ddr4_act_n => ddr4_C0_DDR4_ACT_N,
      c0_ddr4_adr(16 downto 0) => ddr4_C0_DDR4_ADR(16 downto 0),
      c0_ddr4_aresetn => ddr4_sys_rst_peripheral_aresetn(0),
      c0_ddr4_ba(1 downto 0) => ddr4_C0_DDR4_BA(1 downto 0),
      c0_ddr4_bg(0) => ddr4_C0_DDR4_BG(0),
      c0_ddr4_ck_c(0) => ddr4_C0_DDR4_CK_C(0),
      c0_ddr4_ck_t(0) => ddr4_C0_DDR4_CK_T(0),
      c0_ddr4_cke(0) => ddr4_C0_DDR4_CKE(0),
      c0_ddr4_cs_n(0) => ddr4_C0_DDR4_CS_N(0),
      c0_ddr4_dm_dbi_n(1 downto 0) => C0_DDR4_dm_n(1 downto 0),
      c0_ddr4_dq(15 downto 0) => C0_DDR4_dq(15 downto 0),
      c0_ddr4_dqs_c(1 downto 0) => C0_DDR4_dqs_c(1 downto 0),
      c0_ddr4_dqs_t(1 downto 0) => C0_DDR4_dqs_t(1 downto 0),
      c0_ddr4_odt(0) => ddr4_C0_DDR4_ODT(0),
      c0_ddr4_reset_n => ddr4_C0_DDR4_RESET_N,
      c0_ddr4_s_axi_araddr(28 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(28 downto 0),
      c0_ddr4_s_axi_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      c0_ddr4_s_axi_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      c0_ddr4_s_axi_arid(15 downto 0) => axi_interconnect_0_M00_AXI_ARID(15 downto 0),
      c0_ddr4_s_axi_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      c0_ddr4_s_axi_arlock(0) => axi_interconnect_0_M00_AXI_ARLOCK(0),
      c0_ddr4_s_axi_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      c0_ddr4_s_axi_arqos(3 downto 0) => axi_interconnect_0_M00_AXI_ARQOS(3 downto 0),
      c0_ddr4_s_axi_arready => axi_interconnect_0_M00_AXI_ARREADY,
      c0_ddr4_s_axi_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      c0_ddr4_s_axi_arvalid => axi_interconnect_0_M00_AXI_ARVALID(0),
      c0_ddr4_s_axi_awaddr(28 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(28 downto 0),
      c0_ddr4_s_axi_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      c0_ddr4_s_axi_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      c0_ddr4_s_axi_awid(15 downto 0) => axi_interconnect_0_M00_AXI_AWID(15 downto 0),
      c0_ddr4_s_axi_awlen(7 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(7 downto 0),
      c0_ddr4_s_axi_awlock(0) => axi_interconnect_0_M00_AXI_AWLOCK(0),
      c0_ddr4_s_axi_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      c0_ddr4_s_axi_awqos(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      c0_ddr4_s_axi_awready => axi_interconnect_0_M00_AXI_AWREADY,
      c0_ddr4_s_axi_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      c0_ddr4_s_axi_awvalid => axi_interconnect_0_M00_AXI_AWVALID(0),
      c0_ddr4_s_axi_bid(15 downto 0) => axi_interconnect_0_M00_AXI_BID(15 downto 0),
      c0_ddr4_s_axi_bready => axi_interconnect_0_M00_AXI_BREADY(0),
      c0_ddr4_s_axi_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      c0_ddr4_s_axi_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      c0_ddr4_s_axi_rdata(127 downto 0) => axi_interconnect_0_M00_AXI_RDATA(127 downto 0),
      c0_ddr4_s_axi_rid(15 downto 0) => axi_interconnect_0_M00_AXI_RID(15 downto 0),
      c0_ddr4_s_axi_rlast => axi_interconnect_0_M00_AXI_RLAST,
      c0_ddr4_s_axi_rready => axi_interconnect_0_M00_AXI_RREADY(0),
      c0_ddr4_s_axi_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      c0_ddr4_s_axi_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      c0_ddr4_s_axi_wdata(127 downto 0) => axi_interconnect_0_M00_AXI_WDATA(127 downto 0),
      c0_ddr4_s_axi_wlast => axi_interconnect_0_M00_AXI_WLAST(0),
      c0_ddr4_s_axi_wready => axi_interconnect_0_M00_AXI_WREADY,
      c0_ddr4_s_axi_wstrb(15 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(15 downto 0),
      c0_ddr4_s_axi_wvalid => axi_interconnect_0_M00_AXI_WVALID(0),
      c0_ddr4_ui_clk => ddr4_c0_ddr4_ui_clk,
      c0_ddr4_ui_clk_sync_rst => NLW_ddr4_c0_ddr4_ui_clk_sync_rst_UNCONNECTED,
      c0_init_calib_complete => NLW_ddr4_c0_init_calib_complete_UNCONNECTED,
      c0_sys_clk_n => C0_SYS_CLK_1_CLK_N,
      c0_sys_clk_p => C0_SYS_CLK_1_CLK_P,
      dbg_bus(511 downto 0) => NLW_ddr4_dbg_bus_UNCONNECTED(511 downto 0),
      dbg_clk => NLW_ddr4_dbg_clk_UNCONNECTED,
      sys_rst => ddr4_sys_rst_peripheral_reset(0)
    );
ddr4_sys_rst: component Mercury_XU5_ddr4_sys_rst_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_ddr4_sys_rst_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_pl_resetn0,
      interconnect_aresetn(0) => ARESETN_1(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_ddr4_sys_rst_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => ddr4_sys_rst_peripheral_aresetn(0),
      peripheral_reset(0) => ddr4_sys_rst_peripheral_reset(0),
      slowest_sync_clk => ddr4_c0_ddr4_ui_clk
    );
led: component Mercury_XU5_led_0
     port map (
      gpio_io_o(1 downto 0) => led_gpio_io_o(1 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_pl_clk0,
      s_axi_araddr(8 downto 0) => smartconnect_00_M01_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => ps_sys_rst_peripheral_aresetn(0),
      s_axi_arready => smartconnect_00_M01_AXI_ARREADY,
      s_axi_arvalid => smartconnect_00_M01_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => smartconnect_00_M01_AXI_AWADDR(8 downto 0),
      s_axi_awready => smartconnect_00_M01_AXI_AWREADY,
      s_axi_awvalid => smartconnect_00_M01_AXI_AWVALID,
      s_axi_bready => smartconnect_00_M01_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_00_M01_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_00_M01_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_00_M01_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_00_M01_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_00_M01_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_00_M01_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_00_M01_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_00_M01_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_00_M01_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_00_M01_AXI_WVALID
    );
ps_sys_rst: component Mercury_XU5_ps_sys_rst_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_ps_sys_rst_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_pl_resetn0,
      interconnect_aresetn(0) => ps_sys_rst_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_ps_sys_rst_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => ps_sys_rst_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_ps_sys_rst_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => zynq_ultra_ps_e_pl_clk0
    );
reg_bank_0: component Mercury_XU5_reg_bank_0_0
     port map (
      reg_ro(2047 downto 0) => reg_ro_1(2047 downto 0),
      reg_rw(2047 downto 0) => reg_bank_0_reg_rw(2047 downto 0),
      s00_axi_aclk => ddr4_c0_ddr4_ui_clk,
      s00_axi_araddr(8 downto 0) => axi_interconnect_0_M01_AXI_ARADDR(8 downto 0),
      s00_axi_aresetn => ddr4_sys_rst_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => axi_interconnect_0_M01_AXI_ARPROT(2 downto 0),
      s00_axi_arready => axi_interconnect_0_M01_AXI_ARREADY,
      s00_axi_arvalid => axi_interconnect_0_M01_AXI_ARVALID,
      s00_axi_awaddr(8 downto 0) => axi_interconnect_0_M01_AXI_AWADDR(8 downto 0),
      s00_axi_awprot(2 downto 0) => axi_interconnect_0_M01_AXI_AWPROT(2 downto 0),
      s00_axi_awready => axi_interconnect_0_M01_AXI_AWREADY,
      s00_axi_awvalid => axi_interconnect_0_M01_AXI_AWVALID,
      s00_axi_bready => axi_interconnect_0_M01_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => axi_interconnect_0_M01_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => axi_interconnect_0_M01_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => axi_interconnect_0_M01_AXI_RDATA(31 downto 0),
      s00_axi_rready => axi_interconnect_0_M01_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => axi_interconnect_0_M01_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => axi_interconnect_0_M01_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => axi_interconnect_0_M01_AXI_WDATA(31 downto 0),
      s00_axi_wready => axi_interconnect_0_M01_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => axi_interconnect_0_M01_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => axi_interconnect_0_M01_AXI_WVALID
    );
smartconnect_00: component Mercury_XU5_smartconnect_00_0
     port map (
      M00_AXI_araddr(12 downto 0) => smartconnect_00_M00_AXI_ARADDR(12 downto 0),
      M00_AXI_arprot(2 downto 0) => NLW_smartconnect_00_M00_AXI_arprot_UNCONNECTED(2 downto 0),
      M00_AXI_arready => smartconnect_00_M00_AXI_ARREADY,
      M00_AXI_arvalid => smartconnect_00_M00_AXI_ARVALID,
      M00_AXI_awaddr(12 downto 0) => smartconnect_00_M00_AXI_AWADDR(12 downto 0),
      M00_AXI_awprot(2 downto 0) => NLW_smartconnect_00_M00_AXI_awprot_UNCONNECTED(2 downto 0),
      M00_AXI_awready => smartconnect_00_M00_AXI_AWREADY,
      M00_AXI_awvalid => smartconnect_00_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_00_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_00_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_00_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => smartconnect_00_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => smartconnect_00_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_00_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_00_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => smartconnect_00_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => smartconnect_00_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => smartconnect_00_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => smartconnect_00_M00_AXI_WVALID,
      M01_AXI_araddr(8 downto 0) => smartconnect_00_M01_AXI_ARADDR(8 downto 0),
      M01_AXI_arprot(2 downto 0) => NLW_smartconnect_00_M01_AXI_arprot_UNCONNECTED(2 downto 0),
      M01_AXI_arready => smartconnect_00_M01_AXI_ARREADY,
      M01_AXI_arvalid => smartconnect_00_M01_AXI_ARVALID,
      M01_AXI_awaddr(8 downto 0) => smartconnect_00_M01_AXI_AWADDR(8 downto 0),
      M01_AXI_awprot(2 downto 0) => NLW_smartconnect_00_M01_AXI_awprot_UNCONNECTED(2 downto 0),
      M01_AXI_awready => smartconnect_00_M01_AXI_AWREADY,
      M01_AXI_awvalid => smartconnect_00_M01_AXI_AWVALID,
      M01_AXI_bready => smartconnect_00_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => smartconnect_00_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => smartconnect_00_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => smartconnect_00_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => smartconnect_00_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => smartconnect_00_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => smartconnect_00_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => smartconnect_00_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => smartconnect_00_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => smartconnect_00_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => smartconnect_00_M01_AXI_WVALID,
      S00_AXI_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK,
      S00_AXI_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      S00_AXI_arready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY,
      S00_AXI_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      S00_AXI_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER(15 downto 0),
      S00_AXI_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID,
      S00_AXI_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK,
      S00_AXI_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      S00_AXI_awready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY,
      S00_AXI_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      S00_AXI_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER(15 downto 0),
      S00_AXI_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID,
      S00_AXI_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID(15 downto 0),
      S00_AXI_bready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY,
      S00_AXI_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      S00_AXI_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID,
      S00_AXI_rdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      S00_AXI_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID(15 downto 0),
      S00_AXI_rlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST,
      S00_AXI_rready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY,
      S00_AXI_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      S00_AXI_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID,
      S00_AXI_wdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      S00_AXI_wlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST,
      S00_AXI_wready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY,
      S00_AXI_wstrb(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      S00_AXI_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID,
      aclk => zynq_ultra_ps_e_pl_clk0,
      aresetn => ps_sys_rst_interconnect_aresetn(0)
    );
system_management_wiz: component Mercury_XU5_system_management_wiz_0
     port map (
      alarm_out => NLW_system_management_wiz_alarm_out_UNCONNECTED,
      busy_out => NLW_system_management_wiz_busy_out_UNCONNECTED,
      channel_out(5 downto 0) => NLW_system_management_wiz_channel_out_UNCONNECTED(5 downto 0),
      eoc_out => NLW_system_management_wiz_eoc_out_UNCONNECTED,
      eos_out => NLW_system_management_wiz_eos_out_UNCONNECTED,
      ip2intc_irpt => NLW_system_management_wiz_ip2intc_irpt_UNCONNECTED,
      ot_out => NLW_system_management_wiz_ot_out_UNCONNECTED,
      s_axi_aclk => zynq_ultra_ps_e_pl_clk0,
      s_axi_araddr(12 downto 0) => smartconnect_00_M00_AXI_ARADDR(12 downto 0),
      s_axi_aresetn => ps_sys_rst_peripheral_aresetn(0),
      s_axi_arready => smartconnect_00_M00_AXI_ARREADY,
      s_axi_arvalid => smartconnect_00_M00_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => smartconnect_00_M00_AXI_AWADDR(12 downto 0),
      s_axi_awready => smartconnect_00_M00_AXI_AWREADY,
      s_axi_awvalid => smartconnect_00_M00_AXI_AWVALID,
      s_axi_bready => smartconnect_00_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_00_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_00_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_00_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_00_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_00_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_00_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_00_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_00_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_00_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_00_M00_AXI_WVALID,
      user_temp_alarm_out => NLW_system_management_wiz_user_temp_alarm_out_UNCONNECTED,
      vccaux_alarm_out => NLW_system_management_wiz_vccaux_alarm_out_UNCONNECTED,
      vccint_alarm_out => NLW_system_management_wiz_vccint_alarm_out_UNCONNECTED,
      vccpsaux_alarm_out => NLW_system_management_wiz_vccpsaux_alarm_out_UNCONNECTED,
      vccpsintfp_alarm_out => NLW_system_management_wiz_vccpsintfp_alarm_out_UNCONNECTED,
      vccpsintlp_alarm_out => NLW_system_management_wiz_vccpsintlp_alarm_out_UNCONNECTED
    );
zynq_ultra_ps_e: component Mercury_XU5_zynq_ultra_ps_e_0
     port map (
      emio_enet0_enet_tsu_timer_cnt(93 downto 0) => NLW_zynq_ultra_ps_e_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED(93 downto 0),
      emio_enet1_dma_bus_width(1 downto 0) => NLW_zynq_ultra_ps_e_emio_enet1_dma_bus_width_UNCONNECTED(1 downto 0),
      emio_enet1_ext_int_in => '0',
      emio_enet1_gmii_col => zynq_ultra_ps_e_GMII_ENET1_COL,
      emio_enet1_gmii_crs => zynq_ultra_ps_e_GMII_ENET1_CRS,
      emio_enet1_gmii_rx_clk => zynq_ultra_ps_e_GMII_ENET1_RX_CLK,
      emio_enet1_gmii_rx_dv => zynq_ultra_ps_e_GMII_ENET1_RX_DV,
      emio_enet1_gmii_rx_er => zynq_ultra_ps_e_GMII_ENET1_RX_ER,
      emio_enet1_gmii_rxd(7 downto 0) => zynq_ultra_ps_e_GMII_ENET1_RXD(7 downto 0),
      emio_enet1_gmii_tx_clk => zynq_ultra_ps_e_GMII_ENET1_TX_CLK,
      emio_enet1_gmii_tx_en => zynq_ultra_ps_e_GMII_ENET1_TX_EN,
      emio_enet1_gmii_tx_er => zynq_ultra_ps_e_GMII_ENET1_TX_ER,
      emio_enet1_gmii_txd(7 downto 0) => zynq_ultra_ps_e_GMII_ENET1_TXD(7 downto 0),
      emio_enet1_mdio_i => zynq_ultra_ps_e_MDIO_ENET1_MDIO_I,
      emio_enet1_mdio_mdc => zynq_ultra_ps_e_MDIO_ENET1_MDC,
      emio_enet1_mdio_o => zynq_ultra_ps_e_MDIO_ENET1_MDIO_O,
      emio_enet1_mdio_t => zynq_ultra_ps_e_MDIO_ENET1_MDIO_T,
      emio_enet1_speed_mode(2 downto 0) => zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE(2 downto 0),
      emio_enet1_tsu_inc_ctrl(1 downto 0) => B"00",
      emio_enet1_tsu_timer_cmp_val => NLW_zynq_ultra_ps_e_emio_enet1_tsu_timer_cmp_val_UNCONNECTED,
      emio_i2c1_scl_i => zynq_ultra_ps_e_IIC_1_SCL_I,
      emio_i2c1_scl_o => zynq_ultra_ps_e_IIC_1_SCL_O,
      emio_i2c1_scl_t => zynq_ultra_ps_e_IIC_1_SCL_T,
      emio_i2c1_sda_i => zynq_ultra_ps_e_IIC_1_SDA_I,
      emio_i2c1_sda_o => zynq_ultra_ps_e_IIC_1_SDA_O,
      emio_i2c1_sda_t => zynq_ultra_ps_e_IIC_1_SDA_T,
      maxigp0_araddr(39 downto 0) => S00_AXI_1_ARADDR(39 downto 0),
      maxigp0_arburst(1 downto 0) => S00_AXI_1_ARBURST(1 downto 0),
      maxigp0_arcache(3 downto 0) => S00_AXI_1_ARCACHE(3 downto 0),
      maxigp0_arid(15 downto 0) => S00_AXI_1_ARID(15 downto 0),
      maxigp0_arlen(7 downto 0) => S00_AXI_1_ARLEN(7 downto 0),
      maxigp0_arlock => S00_AXI_1_ARLOCK,
      maxigp0_arprot(2 downto 0) => S00_AXI_1_ARPROT(2 downto 0),
      maxigp0_arqos(3 downto 0) => S00_AXI_1_ARQOS(3 downto 0),
      maxigp0_arready => S00_AXI_1_ARREADY(0),
      maxigp0_arsize(2 downto 0) => S00_AXI_1_ARSIZE(2 downto 0),
      maxigp0_aruser(15 downto 0) => S00_AXI_1_ARUSER(15 downto 0),
      maxigp0_arvalid => S00_AXI_1_ARVALID,
      maxigp0_awaddr(39 downto 0) => S00_AXI_1_AWADDR(39 downto 0),
      maxigp0_awburst(1 downto 0) => S00_AXI_1_AWBURST(1 downto 0),
      maxigp0_awcache(3 downto 0) => S00_AXI_1_AWCACHE(3 downto 0),
      maxigp0_awid(15 downto 0) => S00_AXI_1_AWID(15 downto 0),
      maxigp0_awlen(7 downto 0) => S00_AXI_1_AWLEN(7 downto 0),
      maxigp0_awlock => S00_AXI_1_AWLOCK,
      maxigp0_awprot(2 downto 0) => S00_AXI_1_AWPROT(2 downto 0),
      maxigp0_awqos(3 downto 0) => S00_AXI_1_AWQOS(3 downto 0),
      maxigp0_awready => S00_AXI_1_AWREADY(0),
      maxigp0_awsize(2 downto 0) => S00_AXI_1_AWSIZE(2 downto 0),
      maxigp0_awuser(15 downto 0) => S00_AXI_1_AWUSER(15 downto 0),
      maxigp0_awvalid => S00_AXI_1_AWVALID,
      maxigp0_bid(15 downto 0) => S00_AXI_1_BID(15 downto 0),
      maxigp0_bready => S00_AXI_1_BREADY,
      maxigp0_bresp(1 downto 0) => S00_AXI_1_BRESP(1 downto 0),
      maxigp0_bvalid => S00_AXI_1_BVALID(0),
      maxigp0_rdata(127 downto 0) => S00_AXI_1_RDATA(127 downto 0),
      maxigp0_rid(15 downto 0) => S00_AXI_1_RID(15 downto 0),
      maxigp0_rlast => S00_AXI_1_RLAST(0),
      maxigp0_rready => S00_AXI_1_RREADY,
      maxigp0_rresp(1 downto 0) => S00_AXI_1_RRESP(1 downto 0),
      maxigp0_rvalid => S00_AXI_1_RVALID(0),
      maxigp0_wdata(127 downto 0) => S00_AXI_1_WDATA(127 downto 0),
      maxigp0_wlast => S00_AXI_1_WLAST,
      maxigp0_wready => S00_AXI_1_WREADY(0),
      maxigp0_wstrb(15 downto 0) => S00_AXI_1_WSTRB(15 downto 0),
      maxigp0_wvalid => S00_AXI_1_WVALID,
      maxigp2_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      maxigp2_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      maxigp2_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      maxigp2_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID(15 downto 0),
      maxigp2_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      maxigp2_arlock => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK,
      maxigp2_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      maxigp2_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      maxigp2_arready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY,
      maxigp2_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      maxigp2_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER(15 downto 0),
      maxigp2_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID,
      maxigp2_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      maxigp2_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      maxigp2_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      maxigp2_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID(15 downto 0),
      maxigp2_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      maxigp2_awlock => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK,
      maxigp2_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      maxigp2_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      maxigp2_awready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY,
      maxigp2_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      maxigp2_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER(15 downto 0),
      maxigp2_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID,
      maxigp2_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID(15 downto 0),
      maxigp2_bready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY,
      maxigp2_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      maxigp2_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID,
      maxigp2_rdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      maxigp2_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID(15 downto 0),
      maxigp2_rlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST,
      maxigp2_rready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY,
      maxigp2_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      maxigp2_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID,
      maxigp2_wdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      maxigp2_wlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST,
      maxigp2_wready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY,
      maxigp2_wstrb(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      maxigp2_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID,
      maxihpm0_fpd_aclk => ddr4_c0_ddr4_ui_clk,
      maxihpm0_lpd_aclk => zynq_ultra_ps_e_pl_clk0,
      pl_clk0 => zynq_ultra_ps_e_pl_clk0,
      pl_clk1 => zynq_ultra_ps_e_pl_clk1,
      pl_resetn0 => zynq_ultra_ps_e_pl_resetn0
    );
end STRUCTURE;
