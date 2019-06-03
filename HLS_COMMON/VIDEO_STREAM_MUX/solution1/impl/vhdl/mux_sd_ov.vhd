-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_sd_ov is
generic (
    C_S_AXI_AXILITES_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_AXILITES_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_in_sd_V_V_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    data_in_sd_V_V_TVALID : IN STD_LOGIC;
    data_in_sd_V_V_TREADY : OUT STD_LOGIC;
    data_in_ov7670_V_V_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    data_in_ov7670_V_V_TVALID : IN STD_LOGIC;
    data_in_ov7670_V_V_TREADY : OUT STD_LOGIC;
    outputStream_V_V_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    outputStream_V_V_TVALID : OUT STD_LOGIC;
    outputStream_V_V_TREADY : IN STD_LOGIC;
    s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
    s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_ADDR_WIDTH-1 downto 0);
    s_axi_AXILiteS_WVALID : IN STD_LOGIC;
    s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH-1 downto 0);
    s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH/8-1 downto 0);
    s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
    s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_ADDR_WIDTH-1 downto 0);
    s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_RREADY : IN STD_LOGIC;
    s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH-1 downto 0);
    s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_BREADY : IN STD_LOGIC;
    s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of mux_sd_ov is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "mux_sd_ov,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=39,HLS_SYN_LUT=56}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_18 : BOOLEAN;
    signal switch_stream : STD_LOGIC;
    signal data_in_sd_V_V_TDATA_blk_n : STD_LOGIC;
    signal switch_stream_read_read_fu_30_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal data_in_ov7670_V_V_TDATA_blk_n : STD_LOGIC;
    signal outputStream_V_V_TDATA_blk_n : STD_LOGIC;
    signal ap_sig_87 : BOOLEAN;
    signal ap_sig_ioackin_outputStream_V_V_TREADY : STD_LOGIC;
    signal ap_reg_ioackin_outputStream_V_V_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_100 : BOOLEAN;

    component mux_sd_ov_AXILiteS_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        switch_stream : OUT STD_LOGIC );
    end component;



begin
    mux_sd_ov_AXILiteS_s_axi_U : component mux_sd_ov_AXILiteS_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_AXILITES_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_AXILITES_DATA_WIDTH)
    port map (
        AWVALID => s_axi_AXILiteS_AWVALID,
        AWREADY => s_axi_AXILiteS_AWREADY,
        AWADDR => s_axi_AXILiteS_AWADDR,
        WVALID => s_axi_AXILiteS_WVALID,
        WREADY => s_axi_AXILiteS_WREADY,
        WDATA => s_axi_AXILiteS_WDATA,
        WSTRB => s_axi_AXILiteS_WSTRB,
        ARVALID => s_axi_AXILiteS_ARVALID,
        ARREADY => s_axi_AXILiteS_ARREADY,
        ARADDR => s_axi_AXILiteS_ARADDR,
        RVALID => s_axi_AXILiteS_RVALID,
        RREADY => s_axi_AXILiteS_RREADY,
        RDATA => s_axi_AXILiteS_RDATA,
        RRESP => s_axi_AXILiteS_RRESP,
        BVALID => s_axi_AXILiteS_BVALID,
        BREADY => s_axi_AXILiteS_BREADY,
        BRESP => s_axi_AXILiteS_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        switch_stream => switch_stream);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ioackin_outputStream_V_V_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY))))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY))))))) then 
                    ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and not(ap_sig_87) and (ap_const_logic_1 = outputStream_V_V_TREADY)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and not(ap_sig_87) and (ap_const_logic_1 = outputStream_V_V_TREADY)))) then 
                    ap_reg_ioackin_outputStream_V_V_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    ap_done_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_100_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_87)
    begin
                ap_sig_100 <= ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_87));
    end process;


    ap_sig_18_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_18 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_87_assign_proc : process(ap_start, data_in_sd_V_V_TVALID, data_in_ov7670_V_V_TVALID, switch_stream_read_read_fu_30_p2)
    begin
                ap_sig_87 <= (((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (data_in_ov7670_V_V_TVALID = ap_const_logic_0)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (data_in_sd_V_V_TVALID = ap_const_logic_0)) or (ap_start = ap_const_logic_0));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_18)
    begin
        if (ap_sig_18) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_outputStream_V_V_TREADY_assign_proc : process(outputStream_V_V_TREADY, ap_reg_ioackin_outputStream_V_V_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_outputStream_V_V_TREADY)) then 
            ap_sig_ioackin_outputStream_V_V_TREADY <= outputStream_V_V_TREADY;
        else 
            ap_sig_ioackin_outputStream_V_V_TREADY <= ap_const_logic_1;
        end if; 
    end process;


    data_in_ov7670_V_V_TDATA_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, data_in_ov7670_V_V_TVALID, switch_stream_read_read_fu_30_p2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0))) then 
            data_in_ov7670_V_V_TDATA_blk_n <= data_in_ov7670_V_V_TVALID;
        else 
            data_in_ov7670_V_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in_ov7670_V_V_TREADY_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            data_in_ov7670_V_V_TREADY <= ap_const_logic_1;
        else 
            data_in_ov7670_V_V_TREADY <= ap_const_logic_0;
        end if; 
    end process;


    data_in_sd_V_V_TDATA_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, data_in_sd_V_V_TVALID, switch_stream_read_read_fu_30_p2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)))) then 
            data_in_sd_V_V_TDATA_blk_n <= data_in_sd_V_V_TVALID;
        else 
            data_in_sd_V_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_in_sd_V_V_TREADY_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_sig_ioackin_outputStream_V_V_TREADY)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and not((ap_sig_87 or ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)) or (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and (ap_const_logic_0 = ap_sig_ioackin_outputStream_V_V_TREADY)))))) then 
            data_in_sd_V_V_TREADY <= ap_const_logic_1;
        else 
            data_in_sd_V_V_TREADY <= ap_const_logic_0;
        end if; 
    end process;


    outputStream_V_V_TDATA_assign_proc : process(data_in_sd_V_V_TDATA, data_in_ov7670_V_V_TDATA, switch_stream_read_read_fu_30_p2, ap_sig_100)
    begin
        if (ap_sig_100) then
            if (not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0))) then 
                outputStream_V_V_TDATA <= data_in_sd_V_V_TDATA;
            elsif ((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) then 
                outputStream_V_V_TDATA <= data_in_ov7670_V_V_TDATA;
            else 
                outputStream_V_V_TDATA <= "XXXXXXXX";
            end if;
        else 
            outputStream_V_V_TDATA <= "XXXXXXXX";
        end if; 
    end process;


    outputStream_V_V_TDATA_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, outputStream_V_V_TREADY, switch_stream_read_read_fu_30_p2)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)))) then 
            outputStream_V_V_TDATA_blk_n <= outputStream_V_V_TREADY;
        else 
            outputStream_V_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    outputStream_V_V_TVALID_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, switch_stream_read_read_fu_30_p2, ap_sig_87, ap_reg_ioackin_outputStream_V_V_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and (switch_stream_read_read_fu_30_p2 = ap_const_lv1_0) and not(ap_sig_87) and (ap_const_logic_0 = ap_reg_ioackin_outputStream_V_V_TREADY)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((switch_stream_read_read_fu_30_p2 = ap_const_lv1_0)) and not(ap_sig_87) and (ap_const_logic_0 = ap_reg_ioackin_outputStream_V_V_TREADY)))) then 
            outputStream_V_V_TVALID <= ap_const_logic_1;
        else 
            outputStream_V_V_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    switch_stream_read_read_fu_30_p2 <= (0=>switch_stream, others=>'-');
end behav;