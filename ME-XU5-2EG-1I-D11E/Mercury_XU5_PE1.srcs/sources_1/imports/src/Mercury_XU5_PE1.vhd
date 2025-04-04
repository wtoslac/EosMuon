---------------------------------------------------------------------------------------------------
-- Copyright (c) 2022 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Mercury_XU5_PE1 is
  generic (
    BG_WIDTH : natural
  );
  
  port (
    
    -- Anios A
    IOA_D0_P                       : in   std_logic;
    IOA_D1_N                       : in   std_logic;
    IOA_D2_P                       : in   std_logic;
    IOA_D3_N                       : in   std_logic;
    IOA_D4_P                       : in   std_logic;
    IOA_D5_N                       : in   std_logic;
    IOA_D6_P                       : in   std_logic;
    IOA_D7_N                       : in   std_logic;
    IOA_D8_P                       : in   std_logic;
    IOA_D9_N                       : in   std_logic;
    IOA_D10_P                      : in   std_logic;
    IOA_D11_N                      : in   std_logic;
    IOA_D12_P                      : in   std_logic;
    IOA_D13_N                      : in   std_logic;
    IOA_D14_P                      : in   std_logic;
    IOA_D15_N                      : in   std_logic;
    IOA_D16_P                      : in   std_logic;
    IOA_D17_N                      : in   std_logic;
    IOA_D18_P                      : in   std_logic;
    IOA_D19_N                      : in   std_logic;
    IOA_D20_P                      : in   std_logic;
    IOA_D21_N                      : in   std_logic;
    IOA_D22_P                      : in   std_logic;
    IOA_D23_N                      : in   std_logic;
    IOA_CLK1_N                     : in   std_logic;
    IOA_CLK0_P                     : in   std_logic;
    
    -- Anios B
    IOB_D0_P                       : in   std_logic;
    IOB_D1_N                       : in   std_logic;
    IOB_D2_P                       : in   std_logic;
    IOB_D3_N                       : in   std_logic;
    IOB_D4_P                       : in   std_logic;
    IOB_D5_N                       : in   std_logic;
    IOB_D6_P                       : in   std_logic;
    IOB_D7_N                       : in   std_logic;
    IOB_D8_P                       : in   std_logic;
    IOB_D9_N                       : in   std_logic;
    IOB_D10_P                      : in   std_logic;
    IOB_D11_N                      : in   std_logic;
    IOB_D12_P                      : in   std_logic;
    IOB_D13_N                      : in   std_logic;
    IOB_D14_P                      : in   std_logic;
    IOB_D15_N                      : in   std_logic;
    IOB_D16_SC0_DIP1_N             : in   std_logic;
    IOB_D17_SC1_DIP2_N             : in   std_logic;
    IOB_D18_SC2_DIP3_N             : in   std_logic; -- Available on G1, No_MGT_routing modules
    IOB_D19_SC3_DIP4_N             : in   std_logic; -- Available on G1, No_MGT_routing modules
    IOB_D20_SC4_BTN0_N             : in   std_logic;
    IOB_D21_SC5_BTN1_N             : in   std_logic;
    IOB_D22_SC6_BTN2_N             : in   std_logic;
    IOB_D23_SC7_BTN3_N             : in   std_logic;
    IOB_CLK1_N                     : in   std_logic;
    IOB_CLK0_P                     : in   std_logic;
    
    -- FMC LPC Connector 0
    FMC_LA02_N                     : in   std_logic;
    FMC_LA02_P                     : in   std_logic;
    FMC_LA03_N                     : in   std_logic;
    FMC_LA03_P                     : in   std_logic;
    FMC_LA04_N                     : in   std_logic;
    FMC_LA04_P                     : in   std_logic;
    FMC_LA05_N                     : in   std_logic;
    FMC_LA05_P                     : in   std_logic;
    FMC_LA06_N                     : in   std_logic;
    FMC_LA06_P                     : in   std_logic;
    FMC_LA07_N                     : in   std_logic;
    FMC_LA07_P                     : in   std_logic;
    FMC_LA08_N                     : in   std_logic;
    FMC_LA08_P                     : in   std_logic;
    FMC_LA09_N                     : in   std_logic;
    FMC_LA09_P                     : in   std_logic;
    FMC_LA10_N                     : in   std_logic;
    FMC_LA10_P                     : in   std_logic;
    FMC_LA11_N                     : in   std_logic;
    FMC_LA11_P                     : in   std_logic;
    FMC_LA12_N                     : in   std_logic;
    FMC_LA12_P                     : in   std_logic;
    FMC_LA13_N                     : in   std_logic;
    FMC_LA13_P                     : in   std_logic;
    FMC_LA14_N                     : in   std_logic;
    FMC_LA14_P                     : in   std_logic;
    FMC_LA15_N                     : in   std_logic;
    FMC_LA15_P                     : in   std_logic;
    FMC_LA16_N                     : in   std_logic;
    FMC_LA16_P                     : in   std_logic;
    FMC_LA19_N                     : in   std_logic;
    FMC_LA19_P                     : in   std_logic;
    FMC_LA20_N                     : in   std_logic;
    FMC_LA20_P                     : in   std_logic;
    FMC_LA21_N                     : in   std_logic;
    FMC_LA21_P                     : in   std_logic;
    FMC_LA22_N                     : in   std_logic;
    FMC_LA22_P                     : in   std_logic;
    FMC_LA23_N                     : in   std_logic;
    FMC_LA23_P                     : in   std_logic;
    FMC_LA24_N                     : in   std_logic;
    FMC_LA24_P                     : in   std_logic;
    FMC_LA25_N                     : in   std_logic;
    FMC_LA25_P                     : in   std_logic;
    FMC_LA26_N                     : in   std_logic;
    FMC_LA26_P                     : in   std_logic;
    FMC_LA27_N                     : in   std_logic;
    FMC_LA27_P                     : in   std_logic;
    FMC_LA28_N                     : in   std_logic;
    FMC_LA28_P                     : in   std_logic;
    FMC_LA29_N                     : in   std_logic;
    FMC_LA29_P                     : in   std_logic;
    FMC_LA30_N                     : in   std_logic;
    FMC_LA30_P                     : in   std_logic;
    FMC_LA31_N                     : in   std_logic;
    FMC_LA31_P                     : in   std_logic;
    FMC_LA32_N                     : in   std_logic;
    FMC_LA32_P                     : in   std_logic;
    FMC_LA33_N                     : in   std_logic;
    FMC_LA33_P                     : in   std_logic;
    FMC_LA00_CC_N                  : in   std_logic;
    FMC_LA00_CC_P                  : in   std_logic;
    FMC_LA01_CC_N                  : in   std_logic;
    FMC_LA01_CC_P                  : in   std_logic;
    FMC_LA17_CC_N                  : in   std_logic;
    FMC_LA17_CC_P                  : in   std_logic;
    FMC_LA18_CC_N                  : in   std_logic;
    FMC_LA18_CC_P                  : in   std_logic;
    FMC_CLK0_M2C_N                 : in   std_logic;
    FMC_CLK0_M2C_P                 : in   std_logic;
    FMC_CLK1_M2C_N                 : in   std_logic;
    FMC_CLK1_M2C_P                 : in   std_logic;
    
    -- PL I2C, shared with PS I2C
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IOC
    IOC_D0_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D1_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D2_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D3_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D4_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D5_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D6_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOC_D7_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    
    -- IOD
    IOD_D0_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D1_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D2_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D3_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D4_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D5_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D6_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOD_D7_N                       : in   std_logic; -- Available on G1, No_MGT_routing modules
    
    -- IOE
    IOE_D0_LED0_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOE_D1_LED1_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOE_D2_LED2_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOE_D3_LED3_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    
    -- LED
    LED1_N_PL                      : out     std_logic;
    LED2_N_PL                      : out     std_logic;
    LED3_N_PL                      : out     std_logic;
    
    -- PE1 SI5338 CLK3
    OSC_N                          : in      std_logic;
    OSC_P                          : in      std_logic;
    
    -- PL 100 MHz Oscillator
    CLK100_PL_N                    : in      std_logic;
    CLK100_PL_P                    : in      std_logic;
    
    -- PL DDR4 Memory
    DDR4PL_ACT_N                   : out     std_logic;
    DDR4PL_RST_N                   : out     std_logic;
    DDR4PL_BA                      : out     std_logic_vector(1 downto 0);
    DDR4PL_BG                      : out     std_logic_vector(1 downto 0);
    DDR4PL_CKE                     : out     std_logic_vector(0 downto 0);
    DDR4PL_DQ                      : inout   std_logic_vector(15 downto 0);
    DDR4PL_ODT                     : out     std_logic_vector(0 downto 0);
    DDR4PL_A                       : out     std_logic_vector(16 downto 0);
    DDR4PL_CK_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CK_P                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CS_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_DM                      : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_N                   : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_P                   : inout   std_logic_vector(1 downto 0);
    
    -- PL Gigabit Ethernet
    ETH1_MDC                       : out     std_logic;
    ETH1_RXCLK                     : in      std_logic;
    ETH1_TXCLK                     : out     std_logic;
    ETH1_MDIO                      : inout   std_logic;
    ETH1_INT_N                     : in      std_logic;
    ETH1_RESET_N                   : out     std_logic;
    ETH1_RXCTL                     : in      std_logic;
    ETH1_TXCTL                     : out     std_logic;
    ETH1_RXD                       : in      std_logic_vector(3 downto 0);
    ETH1_TXD                       : out     std_logic_vector(3 downto 0)
  );
end Mercury_XU5_PE1;

architecture rtl of Mercury_XU5_PE1 is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Mercury_XU5 is
    port (
      Clk100              : out    std_logic;
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      IIC_sda_i           : in     std_logic;
      IIC_sda_o           : out    std_logic;
      IIC_sda_t           : out    std_logic;
      IIC_scl_i           : in     std_logic;
      IIC_scl_o           : out    std_logic;
      IIC_scl_t           : out    std_logic;
      LED_N_PL            : out    std_logic_vector(1 downto 0);
      C0_SYS_CLK_clk_n    : in     std_logic;
      C0_SYS_CLK_clk_p    : in     std_logic;
      C0_DDR4_act_n       : out    std_logic;
      C0_DDR4_reset_n     : out    std_logic;
      C0_DDR4_ba          : out    std_logic_vector(1 downto 0);
      C0_DDR4_bg          : out    std_logic_vector(BG_WIDTH-1 downto 0);
      C0_DDR4_cke         : out    std_logic_vector(0 downto 0);
      C0_DDR4_dq          : inout  std_logic_vector(15 downto 0);
      C0_DDR4_odt         : out    std_logic_vector(0 downto 0);
      C0_DDR4_adr         : out    std_logic_vector(16 downto 0);
      C0_DDR4_ck_c        : out    std_logic_vector(0 downto 0);
      C0_DDR4_ck_t        : out    std_logic_vector(0 downto 0);
      C0_DDR4_cs_n        : out    std_logic_vector(0 downto 0);
      C0_DDR4_dm_n        : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_c       : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_t       : inout  std_logic_vector(1 downto 0);
      MDIO_mdc            : out    std_logic;
      MDIO_mdio_i         : in     std_logic;
      MDIO_mdio_o         : out    std_logic;
      MDIO_mdio_t         : out    std_logic;
      ETH_CLK125          : out    std_logic;
      ETH_CLK125_90       : out    std_logic;
      ETH_CLK25           : out    std_logic;
      ETH_CLK10           : out    std_logic;
      ETH_resetn          : out    std_logic;
      GMII_col            : in     std_logic;
      GMII_crs            : in     std_logic;
      GMII_rx_clk         : in     std_logic;
      GMII_rx_dv          : in     std_logic;
      GMII_rx_er          : in     std_logic;
      GMII_rxd            : in     std_logic_vector(7 downto 0);
      GMII_speed_mode     : out    std_logic_vector(2 downto 0);
      GMII_tx_clk         : in     std_logic;
      GMII_tx_en          : out    std_logic;
      GMII_tx_er          : out    std_logic;
      GMII_txd            : out    std_logic_vector(7 downto 0);
      reg_ro              : in     std_logic_vector(2047 downto 0);
      reg_rw              : out    std_logic_vector(2047 downto 0)
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
  
  component Mercury_XU5_GMII2RGMII is
  port (
    Clk125          : in  std_logic;
    Clk125_90       : in  std_logic;
    Clk25           : in  std_logic;
    Clk10           : in  std_logic;
    Resetn          : in  std_logic;
  
    GMII_col        : out std_logic;
    GMII_crs        : out std_logic;
    GMII_rx_clk     : out std_logic;
    GMII_rx_dv      : out std_logic;
    GMII_rx_er      : out std_logic;
    GMII_rxd        : out std_logic_vector(7 downto 0);
    GMII_speed_mode : in  std_logic_vector(2 downto 0);
    GMII_tx_clk     : out std_logic;
    GMII_tx_en      : in  std_logic;
    GMII_tx_er      : in  std_logic;
    GMII_txd        : in  std_logic_vector(7 downto 0);
  
    RGMII_rxd       : in  std_logic_vector(3 downto 0);
    RGMII_rxclk     : in  std_logic;
    RGMII_rxctl     : in  std_logic;
    RGMII_txd       : out std_logic_vector(3 downto 0);
    RGMII_txclk     : out std_logic;
    RGMII_txctl     : out std_logic;
  
    Speed1000En     : out std_logic;
    Speed100En      : out std_logic;
    Speed10En       : out std_logic
  );
  end component Mercury_XU5_GMII2RGMII;

  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal Clk100           : std_logic;
  signal Clk50            : std_logic;
  signal Rst_N            : std_logic;
  signal IIC_sda_i        : std_logic;
  signal IIC_sda_o        : std_logic;
  signal IIC_sda_t        : std_logic;
  signal IIC_scl_i        : std_logic;
  signal IIC_scl_o        : std_logic;
  signal IIC_scl_t        : std_logic;
  signal LED_N_PL         : std_logic_vector(1 downto 0);
  signal MDIO_mdio_i      : std_logic;
  signal MDIO_mdio_o      : std_logic;
  signal MDIO_mdio_t      : std_logic;
  signal ETH_CLK125       : std_logic;
  signal ETH_CLK125_90    : std_logic;
  signal ETH_CLK25        : std_logic;
  signal ETH_CLK10        : std_logic;
  signal ETH_resetn       : std_logic;
  signal GMII_col         : std_logic;
  signal GMII_crs         : std_logic;
  signal GMII_rx_clk      : std_logic;
  signal GMII_rx_dv       : std_logic;
  signal GMII_rx_er       : std_logic;
  signal GMII_rxd         : std_logic_vector(7 downto 0);
  signal GMII_speed_mode  : std_logic_vector(2 downto 0);
  signal GMII_tx_clk      : std_logic;
  signal GMII_tx_en       : std_logic;
  signal GMII_tx_er       : std_logic;
  signal GMII_txd         : std_logic_vector(7 downto 0);
  signal LedCount         : unsigned(23 downto 0);
  signal reg_ro           : std_logic_vector(2047 downto 0);
  signal reg_rw           : std_logic_vector(2047 downto 0);
  
  component EosMuonDAQ is
    port(
      Clk50: in std_logic;
      Clk100: in std_logic;
      LED: out std_logic_vector(2 downto 0);
      -- Input Channel on PIN-IO A ---
      IOA: in std_logic_vector( 25 downto 0);
        -- Input Channel on PIN-IO B ---
      IOB: in std_logic_vector( 25 downto 0);
     
      -- Inputs for the FMC LPC Connector 0
    
      FMCN: in std_logic_vector( 35 downto 0);
      FMCP: in std_logic_vector( 35 downto 0);

      IOC: inout std_logic_vector(7 downto 0);
      IOD: inout std_logic_vector(6 downto 0);
      IOD7: in std_logic;
      -- 32x64-bits data for the PS access through AXI & Peek.
      reg_ro_out: out std_logic_vector(2047 downto 0)
      );
  end component EosMuonDAQ;

  component EosMuonTrigger is
    port(
      --Clk50: in std_logic;
      Clk100: in std_logic;
      LED: out std_logic_vector(2 downto 0);
      -- Input Channel on PIN-IO A ---
      IOA: in std_logic_vector( 25 downto 0);
      -- Input Channel on PIN-IO B ---
      IOB: in std_logic_vector( 25 downto 0);

      -- Inputs forFMC LPC Connector    
      FMCN: in std_logic_vector( 35 downto 0);
      FMCP: in std_logic_vector( 35 downto 0);

      IOC: inout std_logic_vector(7 downto 0);
      IOD: inout std_logic_vector(6 downto 0);
      IOD7: in std_logic
      );
  end component EosMuonTrigger;

begin --being instantiation of components
  
  EosMuonDAQ_i: component EosMuonDAQ 
    port map (
      Clk50 => Clk50,
      Clk100 => Clk100,
      LED(0) => LED1_N_PL,
      LED(1) => LED2_N_PL,
      LED(2) => LED3_N_PL,
      -- Input Channel on PIN-IO A ---
      IOA(25) => IOA_CLK1_N, 
      IOA(24) => IOA_CLK0_P,
      IOA(23) => IOA_D23_N,
      IOA(22) => IOA_D22_P,
      IOA(21) => IOA_D21_N,
      IOA(20) => IOA_D20_P,
      IOA(19) => IOA_D19_N,
      IOA(18) => IOA_D18_P,
      IOA(17) => IOA_D17_N,
      IOA(16) => IOA_D16_P,
      IOA(15) => IOA_D15_N,
      IOA(14) => IOA_D14_P,
      IOA(13) => IOA_D13_N,
      IOA(12) => IOA_D12_P,
      IOA(11) => IOA_D11_N,
      IOA(10) => IOA_D10_P,
      IOA(9) => IOA_D9_N,
      IOA(8) => IOA_D8_P,
      IOA(7) => IOA_D7_N,
      IOA(6) => IOA_D6_P,
      IOA(5) => IOA_D5_N,
      IOA(4) => IOA_D4_P,
      IOA(3) => IOA_D3_N,
      IOA(2) => IOA_D2_P,
      IOA(1) => IOA_D1_N,
      IOA(0) => IOA_D0_P,
     -- Input ChBnnel on PIN-IO B ---
      IOB(25) => IOB_CLK1_N, 
      IOB(24) => IOB_CLK0_P,
      IOB(23) => IOB_D23_SC7_BTN3_N,
      IOB(22) => IOB_D22_SC6_BTN2_N,
      IOB(21) => IOB_D21_SC5_BTN1_N,
      IOB(20) => IOB_D20_SC4_BTN0_N,
      IOB(19) => IOB_D19_SC3_DIP4_N,
      IOB(18) => IOB_D18_SC2_DIP3_N,
      IOB(17) => IOB_D17_SC1_DIP2_N,
      IOB(16) => IOB_D16_SC0_DIP1_N,
      IOB(15) => IOB_D15_N,
      IOB(14) => IOB_D14_P,
      IOB(13) => IOB_D13_N,
      IOB(12) => IOB_D12_P,
      IOB(11) => IOB_D11_N,
      IOB(10) => IOB_D10_P,
      IOB(9) => IOB_D9_N,
      IOB(8) => IOB_D8_P,
      IOB(7) => IOB_D7_N,
      IOB(6) => IOB_D6_P,
      IOB(5) => IOB_D5_N,
      IOB(4) => IOB_D4_P,
      IOB(3) => IOB_D3_N,
      IOB(2) => IOB_D2_P,
      IOB(1) => IOB_D1_N,
      IOB(0) => IOB_D0_P,
         
    -- Inputs forFMC LPC Connector 0
      FMCN(0) => FMC_LA00_CC_N,
      FMCN(1) => FMC_LA01_CC_N,
      FMCN(2) => FMC_LA02_N,
      FMCN(3) => FMC_LA03_N,
      FMCN(4) => FMC_LA04_N,
    FMCN(5) => FMC_LA05_N,
    FMCN(6) => FMC_LA06_N,
    FMCN(7) => FMC_LA07_N,
    FMCN(8) => FMC_LA08_N,
    FMCN(9) => FMC_LA09_N,
    FMCN(10) => FMC_LA10_N,
    FMCN(11) => FMC_LA11_N,
    FMCN(12) => FMC_LA12_N,
    FMCN(13) => FMC_LA13_N,
    FMCN(14) => FMC_LA14_N,
    FMCN(15) => FMC_LA15_N,
    FMCN(16) => FMC_LA16_N,
    FMCN(17) => FMC_LA17_CC_N,
    FMCN(18) => FMC_LA18_CC_N,
    FMCN(19) => FMC_LA19_N,
    FMCN(20) => FMC_LA20_N,
    FMCN(21) => FMC_LA21_N,
    FMCN(22) => FMC_LA22_N,
    FMCN(23) => FMC_LA23_N,
    FMCN(24) => FMC_LA24_N,
    FMCN(25) => FMC_LA25_N,
    FMCN(26) => FMC_LA26_N,
    FMCN(27) => FMC_LA27_N,
    FMCN(28) => FMC_LA28_N,
    FMCN(29) => FMC_LA29_N,
    FMCN(30) => FMC_LA30_N,
    FMCN(31) => FMC_LA31_N,
    FMCN(32) => FMC_LA32_N,
    FMCN(33) => FMC_LA33_N,
    FMCN(34) => FMC_CLK0_M2C_N,
    FMCN(35) => FMC_CLK1_M2C_N,
    FMCP(0) => FMC_LA00_CC_P,
    FMCP(1) => FMC_LA01_CC_P,
    FMCP(2) => FMC_LA02_P,
    FMCP(3) => FMC_LA03_P,
    FMCP(4) => FMC_LA04_P,
    FMCP(5) => FMC_LA05_P,
    FMCP(6) => FMC_LA06_P,
    FMCP(7) => FMC_LA07_P,
    FMCP(8) => FMC_LA08_P,
    FMCP(9) => FMC_LA09_P,
    FMCP(10) => FMC_LA10_P,
    FMCP(11) => FMC_LA11_P,
    FMCP(12) => FMC_LA12_P,
    FMCP(13) => FMC_LA13_P,
    FMCP(14) => FMC_LA14_P,
    FMCP(15) => FMC_LA15_P,
    FMCP(16) => FMC_LA16_P,
    FMCP(17) => FMC_LA17_CC_P,
    FMCP(18) => FMC_LA18_CC_P,
    FMCP(19) => FMC_LA19_P,
    FMCP(20) => FMC_LA20_P,
    FMCP(21) => FMC_LA21_P,
    FMCP(22) => FMC_LA22_P,
    FMCP(23) => FMC_LA23_P,
    FMCP(24) => FMC_LA24_P,
    FMCP(25) => FMC_LA25_P,
    FMCP(26) => FMC_LA26_P,
    FMCP(27) => FMC_LA27_P,
    FMCP(28) => FMC_LA28_P,
    FMCP(29) => FMC_LA29_P,
    FMCP(30) => FMC_LA30_P,
    FMCP(31) => FMC_LA31_P,
    FMCP(32) => FMC_LA32_P,
    FMCP(33) => FMC_LA33_P,
    FMCP(34) => FMC_CLK0_M2C_P,
    FMCP(35) => FMC_CLK1_M2C_P,  
      -- Output Channels on PIN-IO C --
      IOC(0) => IOC_D0_P,
      IOC(1) => IOC_D1_N,
      IOC(2) => IOC_D2_P,
      IOC(3) => IOC_D3_N,
      IOC(4) => IOC_D4_P,
      IOC(5) => IOC_D5_N,
      IOC(6) => IOC_D6_P,
      IOC(7) => IOC_D7_N,
      -- Output Channels on PIN-IO D --
      IOD(0) => IOD_D0_P,
      IOD(1) => IOD_D1_N,
      IOD(2) => IOD_D2_P,
      IOD(3) => IOD_D3_N,
      IOD(4) => IOD_D4_P,
      IOD(5) => IOD_D5_N,
      IOD(6) => IOD_D6_P,
      IOD7 => IOD_D7_N,
      -- 32x64-bits data for the PS access through AXI & Peek.
      reg_ro_out => reg_ro
      );
      
  EosMuonTrigger_i: component EosMuonTrigger 
    port map (
      --Clk50 => Clk50,
      Clk100 => Clk100,
      LED(0) => LED1_N_PL,
      LED(1) => LED2_N_PL,
      LED(2) => LED3_N_PL,
      -- Input Channel on PIN-IO A ---
      IOA(25) => IOA_CLK1_N, 
      IOA(24) => IOA_CLK0_P,
      IOA(23) => IOA_D23_N,
      IOA(22) => IOA_D22_P,
      IOA(21) => IOA_D21_N,
      IOA(20) => IOA_D20_P,
      IOA(19) => IOA_D19_N,
      IOA(18) => IOA_D18_P,
      IOA(17) => IOA_D17_N,
      IOA(16) => IOA_D16_P,
      IOA(15) => IOA_D15_N,
      IOA(14) => IOA_D14_P,
      IOA(13) => IOA_D13_N,
      IOA(12) => IOA_D12_P,
      IOA(11) => IOA_D11_N,
      IOA(10) => IOA_D10_P,
      IOA(9) => IOA_D9_N,
      IOA(8) => IOA_D8_P,
      IOA(7) => IOA_D7_N,
      IOA(6) => IOA_D6_P,
      IOA(5) => IOA_D5_N,
      IOA(4) => IOA_D4_P,
      IOA(3) => IOA_D3_N,
      IOA(2) => IOA_D2_P,
      IOA(1) => IOA_D1_N,
      IOA(0) => IOA_D0_P,
     -- Input ChBnnel on PIN-IO B ---
      IOB(25) => IOB_CLK1_N, 
      IOB(24) => IOB_CLK0_P,
      IOB(23) => IOB_D23_SC7_BTN3_N,
      IOB(22) => IOB_D22_SC6_BTN2_N,
      IOB(21) => IOB_D21_SC5_BTN1_N,
      IOB(20) => IOB_D20_SC4_BTN0_N,
      IOB(19) => IOB_D19_SC3_DIP4_N,
      IOB(18) => IOB_D18_SC2_DIP3_N,
      IOB(17) => IOB_D17_SC1_DIP2_N,
      IOB(16) => IOB_D16_SC0_DIP1_N,
      IOB(15) => IOB_D15_N,
      IOB(14) => IOB_D14_P,
      IOB(13) => IOB_D13_N,
      IOB(12) => IOB_D12_P,
      IOB(11) => IOB_D11_N,
      IOB(10) => IOB_D10_P,
      IOB(9) => IOB_D9_N,
      IOB(8) => IOB_D8_P,
      IOB(7) => IOB_D7_N,
      IOB(6) => IOB_D6_P,
      IOB(5) => IOB_D5_N,
      IOB(4) => IOB_D4_P,
      IOB(3) => IOB_D3_N,
      IOB(2) => IOB_D2_P,
      IOB(1) => IOB_D1_N,
      IOB(0) => IOB_D0_P,
         
    -- Inputs forFMC LPC Connector 0
      FMCN(0) => FMC_LA00_CC_N,
      FMCN(1) => FMC_LA01_CC_N,
      FMCN(2) => FMC_LA02_N,
      FMCN(3) => FMC_LA03_N,
      FMCN(4) => FMC_LA04_N,
    FMCN(5) => FMC_LA05_N,
    FMCN(6) => FMC_LA06_N,
    FMCN(7) => FMC_LA07_N,
    FMCN(8) => FMC_LA08_N,
    FMCN(9) => FMC_LA09_N,
    FMCN(10) => FMC_LA10_N,
    FMCN(11) => FMC_LA11_N,
    FMCN(12) => FMC_LA12_N,
    FMCN(13) => FMC_LA13_N,
    FMCN(14) => FMC_LA14_N,
    FMCN(15) => FMC_LA15_N,
    FMCN(16) => FMC_LA16_N,
    FMCN(17) => FMC_LA17_CC_N,
    FMCN(18) => FMC_LA18_CC_N,
    FMCN(19) => FMC_LA19_N,
    FMCN(20) => FMC_LA20_N,
    FMCN(21) => FMC_LA21_N,
    FMCN(22) => FMC_LA22_N,
    FMCN(23) => FMC_LA23_N,
    FMCN(24) => FMC_LA24_N,
    FMCN(25) => FMC_LA25_N,
    FMCN(26) => FMC_LA26_N,
    FMCN(27) => FMC_LA27_N,
    FMCN(28) => FMC_LA28_N,
    FMCN(29) => FMC_LA29_N,
    FMCN(30) => FMC_LA30_N,
    FMCN(31) => FMC_LA31_N,
    FMCN(32) => FMC_LA32_N,
    FMCN(33) => FMC_LA33_N,
    FMCN(34) => FMC_CLK0_M2C_N,
    FMCN(35) => FMC_CLK1_M2C_N,
    FMCP(0) => FMC_LA00_CC_P,
    FMCP(1) => FMC_LA01_CC_P,
    FMCP(2) => FMC_LA02_P,
    FMCP(3) => FMC_LA03_P,
    FMCP(4) => FMC_LA04_P,
    FMCP(5) => FMC_LA05_P,
    FMCP(6) => FMC_LA06_P,
    FMCP(7) => FMC_LA07_P,
    FMCP(8) => FMC_LA08_P,
    FMCP(9) => FMC_LA09_P,
    FMCP(10) => FMC_LA10_P,
    FMCP(11) => FMC_LA11_P,
    FMCP(12) => FMC_LA12_P,
    FMCP(13) => FMC_LA13_P,
    FMCP(14) => FMC_LA14_P,
    FMCP(15) => FMC_LA15_P,
    FMCP(16) => FMC_LA16_P,
    FMCP(17) => FMC_LA17_CC_P,
    FMCP(18) => FMC_LA18_CC_P,
    FMCP(19) => FMC_LA19_P,
    FMCP(20) => FMC_LA20_P,
    FMCP(21) => FMC_LA21_P,
    FMCP(22) => FMC_LA22_P,
    FMCP(23) => FMC_LA23_P,
    FMCP(24) => FMC_LA24_P,
    FMCP(25) => FMC_LA25_P,
    FMCP(26) => FMC_LA26_P,
    FMCP(27) => FMC_LA27_P,
    FMCP(28) => FMC_LA28_P,
    FMCP(29) => FMC_LA29_P,
    FMCP(30) => FMC_LA30_P,
    FMCP(31) => FMC_LA31_P,
    FMCP(32) => FMC_LA32_P,
    FMCP(33) => FMC_LA33_P,
    FMCP(34) => FMC_CLK0_M2C_P,
    FMCP(35) => FMC_CLK1_M2C_P,  
      -- Output Channels on PIN-IO C --
      IOC(0) => IOC_D0_P,
      IOC(1) => IOC_D1_N,
      IOC(2) => IOC_D2_P,
      IOC(3) => IOC_D3_N,
      IOC(4) => IOC_D4_P,
      IOC(5) => IOC_D5_N,
      IOC(6) => IOC_D6_P,
      IOC(7) => IOC_D7_N,
      -- Output Channels on PIN-IO D --
      IOD(0) => IOD_D0_P,
      IOD(1) => IOD_D1_N,
      IOD(2) => IOD_D2_P,
      IOD(3) => IOD_D3_N,
      IOD(4) => IOD_D4_P,
      IOD(5) => IOD_D5_N,
      IOD(6) => IOD_D6_P,
      IOD7 => IOD_D7_N
      );
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Mercury_XU5_i: component Mercury_XU5
    port map (
      Clk100               => Clk100,
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      IIC_sda_i            => IIC_sda_i,
      IIC_sda_o            => IIC_sda_o,
      IIC_sda_t            => IIC_sda_t,
      IIC_scl_i            => IIC_scl_i,
      IIC_scl_o            => IIC_scl_o,
      IIC_scl_t            => IIC_scl_t,
      LED_N_PL             => LED_N_PL,
      C0_SYS_CLK_clk_n     => CLK100_PL_N,
      C0_SYS_CLK_clk_p     => CLK100_PL_P,
      C0_DDR4_act_n        => DDR4PL_ACT_N,
      C0_DDR4_reset_n      => DDR4PL_RST_N,
      C0_DDR4_ba           => DDR4PL_BA,
      C0_DDR4_bg           => DDR4PL_BG (BG_WIDTH-1 downto 0),
      C0_DDR4_cke          => DDR4PL_CKE,
      C0_DDR4_dq           => DDR4PL_DQ,
      C0_DDR4_odt          => DDR4PL_ODT,
      C0_DDR4_adr          => DDR4PL_A,
      C0_DDR4_ck_c         => DDR4PL_CK_N,
      C0_DDR4_ck_t         => DDR4PL_CK_P,
      C0_DDR4_cs_n         => DDR4PL_CS_N,
      C0_DDR4_dm_n         => DDR4PL_DM,
      C0_DDR4_dqs_c        => DDR4PL_DQS_N,
      C0_DDR4_dqs_t        => DDR4PL_DQS_P,
      MDIO_mdc             => ETH1_MDC,
      MDIO_mdio_i          => MDIO_mdio_i,
      MDIO_mdio_o          => MDIO_mdio_o,
      MDIO_mdio_t          => MDIO_mdio_t,
      ETH_CLK125           => ETH_CLK125,
      ETH_CLK125_90        => ETH_CLK125_90,
      ETH_CLK25            => ETH_CLK25,
      ETH_CLK10            => ETH_CLK10,
      ETH_resetn           => ETH_resetn,
      GMII_col             => GMII_col,
      GMII_crs             => GMII_crs,
      GMII_rx_clk          => GMII_rx_clk,
      GMII_rx_dv           => GMII_rx_dv,
      GMII_rx_er           => GMII_rx_er,
      GMII_rxd             => GMII_rxd,
      GMII_speed_mode      => GMII_speed_mode,
      GMII_tx_clk          => GMII_tx_clk,
      GMII_tx_en           => GMII_tx_en,
      GMII_tx_er           => GMII_tx_er,
      GMII_txd             => GMII_txd,
      reg_ro               => reg_ro,
      reg_rw               => reg_rw
    );
  
  IIC_scl_iobuf: component IOBUF
    port map (
      I => IIC_scl_o,
      IO => I2C_SCL,
      O => IIC_scl_i,
      T => IIC_scl_t
    );
  
  IIC_sda_iobuf: component IOBUF
    port map (
      I => IIC_sda_o,
      IO => I2C_SDA,
      O => IIC_sda_i,
      T => IIC_sda_t
    );
  
  --process (Clk50)
  --begin
   -- if rising_edge (Clk50) then
    --  if Rst_N = '0' then
    --    LedCount    <= (others => '0');
     -- else
      --  LedCount    <= LedCount + 1;
     -- end if;
   -- end if;
  --end process;
  --LED1_N_PL <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  --LED2_N_PL <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  -- LED2_N_PL <= '0' when LED_N_PL(0) = '0' else 'Z';
  -- LED3_N_PL <= '0' when LED_N_PL(1) = '0' else 'Z';
  --reg_ro(31 downto 0) <= x"DACECAFE";
  --reg_ro(63 downto 32) <= x"DACECAFE";
  
  
  MDIO_mdio_iobuf: component IOBUF
    port map (
      I => MDIO_mdio_o,
      IO => ETH1_MDIO,
      O => MDIO_mdio_i,
      T => MDIO_mdio_t
    );
  
  i_gmii2rgmii : Mercury_XU5_GMII2RGMII
    port map (
      Clk125          => ETH_CLK125,
      Clk125_90       => ETH_CLK125_90,
      Clk25           => ETH_Clk25,
      Clk10           => ETH_Clk10,
      Resetn          => ETH_resetn,
  
      GMII_col        => GMII_col,
      GMII_crs        => GMII_crs,
      GMII_rx_clk     => GMII_rx_clk,
      GMII_rx_dv      => GMII_rx_dv,
      GMII_rx_er      => GMII_rx_er,
      GMII_rxd        => GMII_rxd,
      GMII_speed_mode => GMII_speed_mode,
      GMII_tx_clk     => GMII_tx_clk,
      GMII_tx_en      => GMII_tx_en,
      GMII_tx_er      => GMII_tx_er,
      GMII_txd        => GMII_txd,
  
      RGMII_rxd       => ETH1_RXD,
      RGMII_rxclk     => ETH1_RXCLK,
      RGMII_rxctl     => ETH1_RXCTL,
      RGMII_txd       => ETH1_TXD,
      RGMII_txclk     => ETH1_TXCLK,
      RGMII_txctl     => ETH1_TXCTL,
  
      Speed1000En     => open,
      Speed100En      => open,
      Speed10En       => open
    );
  
  ETH1_RESET_N        <= ETH_resetn;
  
end rtl;
