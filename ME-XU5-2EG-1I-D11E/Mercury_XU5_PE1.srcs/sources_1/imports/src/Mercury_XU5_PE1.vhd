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
    IOA_D0_P                       : inout   std_logic;
    IOA_D1_N                       : inout   std_logic;
    IOA_D2_P                       : inout   std_logic;
    IOA_D3_N                       : inout   std_logic;
    IOA_D4_P                       : inout   std_logic;
    IOA_D5_N                       : inout   std_logic;
    IOA_D6_P                       : inout   std_logic;
    IOA_D7_N                       : inout   std_logic;
    IOA_D8_P                       : inout   std_logic;
    IOA_D9_N                       : inout   std_logic;
    IOA_D10_P                      : inout   std_logic;
    IOA_D11_N                      : inout   std_logic;
    IOA_D12_P                      : inout   std_logic;
    IOA_D13_N                      : inout   std_logic;
    IOA_D14_P                      : inout   std_logic;
    IOA_D15_N                      : inout   std_logic;
    IOA_D16_P                      : inout   std_logic;
    IOA_D17_N                      : inout   std_logic;
    IOA_D18_P                      : inout   std_logic;
    IOA_D19_N                      : inout   std_logic;
    IOA_D20_P                      : inout   std_logic;
    IOA_D21_N                      : inout   std_logic;
    IOA_D22_P                      : inout   std_logic;
    IOA_D23_N                      : inout   std_logic;
    IOA_CLK1_N                     : inout   std_logic;
    IOA_CLK0_P                     : inout   std_logic;
    
    -- Anios B
    IOB_D0_P                       : inout   std_logic;
    IOB_D1_N                       : inout   std_logic;
    IOB_D2_P                       : inout   std_logic;
    IOB_D3_N                       : inout   std_logic;
    IOB_D4_P                       : inout   std_logic;
    IOB_D5_N                       : inout   std_logic;
    IOB_D6_P                       : inout   std_logic;
    IOB_D7_N                       : inout   std_logic;
    IOB_D8_P                       : inout   std_logic;
    IOB_D9_N                       : inout   std_logic;
    IOB_D10_P                      : inout   std_logic;
    IOB_D11_N                      : inout   std_logic;
    IOB_D12_P                      : inout   std_logic;
    IOB_D13_N                      : inout   std_logic;
    IOB_D14_P                      : inout   std_logic;
    IOB_D15_N                      : inout   std_logic;
    IOB_D16_SC0_DIP1_N             : inout   std_logic;
    IOB_D17_SC1_DIP2_N             : inout   std_logic;
    IOB_D18_SC2_DIP3_N             : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOB_D19_SC3_DIP4_N             : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IOB_D20_SC4_BTN0_N             : inout   std_logic;
    IOB_D21_SC5_BTN1_N             : inout   std_logic;
    IOB_D22_SC6_BTN2_N             : inout   std_logic;
    IOB_D23_SC7_BTN3_N             : inout   std_logic;
    IOB_CLK1_N                     : inout   std_logic;
    IOB_CLK0_P                     : inout   std_logic;
    
    -- FMC LPC Connector 0
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    
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
    IOD_D7_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    
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
  
  component EosMuon is
    port(
      Clk50: in std_logic;
      LED1: out std_logic;
      LED2: out std_logic;
      LED3: out std_logic;
      -- Input Channel on PIN-IO A ---
      A23: in std_logic;
      A22: in std_logic;
      A21: in std_logic;
      A20: in std_logic;
      A19: in std_logic;
      A18: in std_logic;
      A17: in std_logic;
      A16: in std_logic;
      A15: in std_logic;
      A14: in std_logic;
      A13: in std_logic;
      A12: in std_logic;
      A11: in std_logic;
      A10: in std_logic;
      A9: in std_logic;
      A8: in std_logic;
      A7: in std_logic;
      A6: in std_logic;
      A5: in std_logic;
      A4: in std_logic;
      A3: in std_logic;
      A2: in std_logic;
      A1: in std_logic;
      A0: in std_logic;
      ACLK1: in std_logic;
      ACLK0: in std_logic;
-- Input Channel on PIN-IO B ---
      B23: in std_logic;
      B22: in std_logic;
      B21: in std_logic;
      B20: in std_logic;
      B19: in std_logic;
      B18: in std_logic;
      B17: in std_logic;
      B16: in std_logic;
      B15: in std_logic;
      B14: in std_logic;
      B13: in std_logic;
      B12: in std_logic;
      B11: in std_logic;
      B10: in std_logic;
      B9: in std_logic;
      B8: in std_logic;
      B7: in std_logic;
      B6: in std_logic;
      B5: in std_logic;
      B4: in std_logic;
      B3: in std_logic;
      B2: in std_logic;
      B1: in std_logic;
      B0: in std_logic;
      BCLK1: in std_logic;
      BCLK0: in std_logic;
    -- Inputs forFMC LPC Connector 0
    FMC02N: in std_logic;
    FMC02P: in std_logic;
    FMC03N: in std_logic;
    FMC03P: in std_logic;
    FMC04N: in std_logic;
    FMC04P: in std_logic;
    FMC05N: in std_logic;
    FMC05P: in std_logic;
    FMC06N: in std_logic;
    FMC06P: in std_logic;
    FMC07N: in std_logic;
    FMC07P: in std_logic;
    FMC08N: in std_logic;
    FMC08P: in std_logic;
    FMC09N: in std_logic;
    FMC09P: in std_logic;
    FMC10N: in std_logic;
    FMC10P: in std_logic;
    FMC11N: in std_logic;
    FMC11P: in std_logic;
    FMC12N: in std_logic;
    FMC12P: in std_logic;
    FMC13N: in std_logic;
    FMC13P: in std_logic;
    FMC14N: in std_logic;
    FMC14P: in std_logic;
    FMC15N: in std_logic;
    FMC15P: in std_logic;
    FMC16N: in std_logic;
    FMC16P: in std_logic;
    FMC19N: in std_logic;
    FMC19P: in std_logic;
    FMC20N: in std_logic;
    FMC20P: in std_logic;
    FMC21N: in std_logic;
    FMC21P: in std_logic;
    FMC22N: in std_logic;
    FMC22P: in std_logic;
    FMC23N: in std_logic;
    FMC23P: in std_logic;
    FMC24N: in std_logic;
    FMC24P: in std_logic;
    FMC25N: in std_logic;
    FMC25P: in std_logic;
    FMC26N: in std_logic;
    FMC26P: in std_logic;
    FMC27N: in std_logic;
    FMC27P: in std_logic;
    FMC28N: in std_logic;
    FMC28P: in std_logic;
    FMC29N: in std_logic;
    FMC29P: in std_logic;
    FMC30N: in std_logic;
    FMC30P: in std_logic;
    FMC31N: in std_logic;
    FMC31P: in std_logic;
    FMC32N: in std_logic;
    FMC32P: in std_logic;
    FMC33N: in std_logic;
    FMC33P: in std_logic;
    FMC00CCN: in std_logic;
    FMC00CCP: in std_logic;
    FMC01CCN: in std_logic;
    FMC01CCP: in std_logic;
    FMC17CCN: in std_logic;
    FMC17CCP: in std_logic;
    FMC18CCN: in std_logic;
    FMC18CCP: in std_logic;
    FMCCLK0M2CN: in std_logic;
    FMCCLK0M2CP: in std_logic;
    FMCCLK1M2CN: in std_logic;
    FMCCLK1M2CP: in std_logic;   
       -- Output Channels on PIN-IO C --
      C7: out std_logic;
      C6: out std_logic;
      C5: out std_logic;
      C4: out std_logic;
      C3: out std_logic;
      C2: out std_logic;
      C1: out std_logic;
      C0: out std_logic;
      reg_ro_out: out std_logic_vector(2047 downto 0)
      );
  end component EosMuon;

begin
  
  EosMuon_i: component EosMuon 
    port map (
      Clk50 => Clk50,
      LED1 => LED1_N_PL,
      LED2 => LED2_N_PL,
      LED3 => LED3_N_PL,
      -- Input Channel on PIN-IO A ---
      A23 => IOA_D23_N,
      A22 => IOA_D22_P,
      A21 => IOA_D21_N,
      A20 => IOA_D20_P,
      A19 => IOA_D19_N,
      A18 => IOA_D18_P,
      A17 => IOA_D17_N,
      A16 => IOA_D16_P,
      A15 => IOA_D15_N,
      A14 => IOA_D14_P,
      A13 => IOA_D13_N,
      A12 => IOA_D12_P,
      A11 => IOA_D11_N,
      A10 => IOA_D10_P,
      A9 => IOA_D9_N,
      A8 => IOA_D8_P,
      A7 => IOA_D7_N,
      A6 => IOA_D6_P,
      A5 => IOA_D5_N,
      A4 => IOA_D4_P,
      A3 => IOA_D3_N,
      A2 => IOA_D2_P,
      A1 => IOA_D1_N,
      A0 => IOA_D0_P,
      ACLK1 => IOA_CLK1_N, 
      ACLK0 => IOA_CLK0_P,
     -- Input ChBnnel on PIN-IO B ---
      B23 => IOB_D23_SC7_BTN3_N,
      B22 => IOB_D22_SC6_BTN2_N,
      B21 => IOB_D21_SC5_BTN1_N,
      B20 => IOB_D20_SC4_BTN0_N,
      B19 => IOB_D19_SC3_DIP4_N,
      B18 => IOB_D18_SC2_DIP3_N,
      B17 => IOB_D17_SC1_DIP2_N,
      B16 => IOB_D16_SC0_DIP1_N,
      B15 => IOB_D15_N,
      B14 => IOB_D14_P,
      B13 => IOB_D13_N,
      B12 => IOB_D12_P,
      B11 => IOB_D11_N,
      B10 => IOB_D10_P,
      B9 => IOB_D9_N,
      B8 => IOB_D8_P,
      B7 => IOB_D7_N,
      B6 => IOB_D6_P,
      B5 => IOB_D5_N,
      B4 => IOB_D4_P,
      B3 => IOB_D3_N,
      B2 => IOB_D2_P,
      B1 => IOB_D1_N,
      B0 => IOB_D0_P,
      BCLK1 => IOB_CLK1_N, 
      BCLK0 => IOB_CLK0_P,
      
    -- Inputs forFMC LPC Connector 0
    FMC02N => FMC_LA02_N,
    FMC02P => FMC_LA02_P,
    FMC03N => FMC_LA03_N,
    FMC03P => FMC_LA03_P,
    FMC04N => FMC_LA04_N,
    FMC04P => FMC_LA04_P,
    FMC05N => FMC_LA05_N,
    FMC05P => FMC_LA05_P,
    FMC06N => FMC_LA06_N,
    FMC06P => FMC_LA06_P,
    FMC07N => FMC_LA07_N,
    FMC07P => FMC_LA07_P,
    FMC08N => FMC_LA08_N,
    FMC08P => FMC_LA08_P,
    FMC09N => FMC_LA09_N,
    FMC09P => FMC_LA09_P,
    FMC10N => FMC_LA10_N,
    FMC10P => FMC_LA10_P,
    FMC11N => FMC_LA11_N,
    FMC11P => FMC_LA11_P,
    FMC12N => FMC_LA12_N,
    FMC12P => FMC_LA12_P,
    FMC13N => FMC_LA13_N,
    FMC13P => FMC_LA13_P,
    FMC14N => FMC_LA14_N,
    FMC14P => FMC_LA14_P,
    FMC15N => FMC_LA15_N,
    FMC15P => FMC_LA15_P,
    FMC16N => FMC_LA16_N,
    FMC16P => FMC_LA16_P,
    FMC19N => FMC_LA19_N,
    FMC19P => FMC_LA19_P,
    FMC20N => FMC_LA20_N,
    FMC20P => FMC_LA20_P,
    FMC21N => FMC_LA21_N,
    FMC21P => FMC_LA21_P,
    FMC22N => FMC_LA22_N,
    FMC22P => FMC_LA22_P,
    FMC23N => FMC_LA23_N,
    FMC23P => FMC_LA23_P,
    FMC24N => FMC_LA24_N,
    FMC24P => FMC_LA24_P,
    FMC25N => FMC_LA25_N,
    FMC25P => FMC_LA25_P,
    FMC26N => FMC_LA26_N,
    FMC26P => FMC_LA26_P,
    FMC27N => FMC_LA27_N,
    FMC27P => FMC_LA27_P,
    FMC28N => FMC_LA28_N,
    FMC28P => FMC_LA28_P,
    FMC29N => FMC_LA29_N,
    FMC29P => FMC_LA29_P,
    FMC30N => FMC_LA30_N,
    FMC30P => FMC_LA30_P,
    FMC31N => FMC_LA31_N,
    FMC31P => FMC_LA31_P,
    FMC32N => FMC_LA32_N,
    FMC32P => FMC_LA32_P,
    FMC33N => FMC_LA33_N,
    FMC33P => FMC_LA33_P,
    FMC00CCN => FMC_LA00_CC_N,
    FMC00CCP => FMC_LA00_CC_P,
    FMC01CCN => FMC_LA01_CC_N,
    FMC01CCP => FMC_LA01_CC_P,
    FMC17CCN => FMC_LA17_CC_N,
    FMC17CCP => FMC_LA17_CC_P,
    FMC18CCN => FMC_LA18_CC_N,
    FMC18CCP => FMC_LA18_CC_P,
    FMCCLK0M2CN => FMC_CLK0_M2C_N,
    FMCCLK0M2CP => FMC_CLK0_M2C_P,
    FMCCLK1M2CN => FMC_CLK1_M2C_N,
    FMCCLK1M2CP => FMC_CLK1_M2C_P,  
      -- Output Channels on PIN-IO C --
      C7 => IOC_D7_N,
      C6 => IOC_D6_P,
      C5 => IOC_D5_N,
      C4 => IOC_D4_P,
      C3 => IOC_D3_N,
      C2 => IOC_D2_P,
      C1 => IOC_D1_N,
      C0 => IOC_D0_P,
      reg_ro_out => reg_ro
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
