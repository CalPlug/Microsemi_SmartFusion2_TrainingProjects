// ***********************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2013 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreConfigP
//				Soft IP core for facilitating configuration of peripheral
//              blocks (MDDR, FDDR, SERDESIF) in a SmartFusion2 or IGLOO2
//              device.
//
// SVN Revision Information:
// SVN $Revision: 22264 $
// SVN $Date: 2014-04-02 15:55:11 +0100 (Wed, 02 Apr 2014) $
//
// Notes:
//
// ***********************************************************************/

module CoreConfigP (
    // APB_2 interface
    input               FIC_2_APB_M_PRESET_N,
    input               FIC_2_APB_M_PCLK,
    input               FIC_2_APB_M_PSEL,
    input               FIC_2_APB_M_PENABLE,
    input               FIC_2_APB_M_PWRITE,
    input        [16:2] FIC_2_APB_M_PADDR,
    input        [31:0] FIC_2_APB_M_PWDATA,
    output  reg  [31:0] FIC_2_APB_M_PRDATA,
    output  reg         FIC_2_APB_M_PREADY,
    output  reg         FIC_2_APB_M_PSLVERR,
    // Clock and reset to slaves
    output  reg         APB_S_PCLK,
    output  reg         APB_S_PRESET_N,
    // MDDR
    output  reg         MDDR_PSEL,
    output  reg         MDDR_PENABLE,
    output  reg         MDDR_PWRITE,
    output  reg  [15:2] MDDR_PADDR,
    output  reg  [31:0] MDDR_PWDATA,
    input        [31:0] MDDR_PRDATA,
    input               MDDR_PREADY,
    input               MDDR_PSLVERR,
    // FDDR
    output  reg         FDDR_PSEL,
    output  reg         FDDR_PENABLE,
    output  reg         FDDR_PWRITE,
    output  reg  [15:2] FDDR_PADDR,
    output  reg  [31:0] FDDR_PWDATA,
    input        [31:0] FDDR_PRDATA,
    input               FDDR_PREADY,
    input               FDDR_PSLVERR,
    // SERDESIF_0
    output  reg         SDIF0_PSEL,
    output  reg         SDIF0_PENABLE,
    output  reg         SDIF0_PWRITE,
    output  reg  [15:2] SDIF0_PADDR,
    output  reg  [31:0] SDIF0_PWDATA,
    input        [31:0] SDIF0_PRDATA,
    input               SDIF0_PREADY,
    input               SDIF0_PSLVERR,
    // SERDESIF_1
    output  reg         SDIF1_PSEL,
    output  reg         SDIF1_PENABLE,
    output  reg         SDIF1_PWRITE,
    output  reg  [15:2] SDIF1_PADDR,
    output  reg  [31:0] SDIF1_PWDATA,
    input        [31:0] SDIF1_PRDATA,
    input               SDIF1_PREADY,
    input               SDIF1_PSLVERR,
    // SERDESIF_2
    output  reg         SDIF2_PSEL,
    output  reg         SDIF2_PENABLE,
    output  reg         SDIF2_PWRITE,
    output  reg  [15:2] SDIF2_PADDR,
    output  reg  [31:0] SDIF2_PWDATA,
    input        [31:0] SDIF2_PRDATA,
    input               SDIF2_PREADY,
    input               SDIF2_PSLVERR,
    // SERDESIF_3
    output  reg         SDIF3_PSEL,
    output  reg         SDIF3_PENABLE,
    output  reg         SDIF3_PWRITE,
    output  reg  [15:2] SDIF3_PADDR,
    output  reg  [31:0] SDIF3_PWDATA,
    input        [31:0] SDIF3_PRDATA,
    input               SDIF3_PREADY,
    input               SDIF3_PSLVERR,
    // Some SDIF APB port signals are replicated for connection to
    // CoreResetP. The PRDATA buses from the SDIF blocks carry status
    // information when a read is not in progress, and this status info
    // is used within CoreResetP.
    output  reg         R_SDIF0_PSEL,
    output  reg         R_SDIF0_PWRITE,
    output  reg  [31:0] R_SDIF0_PRDATA,
    output  reg         R_SDIF1_PSEL,
    output  reg         R_SDIF1_PWRITE,
    output  reg  [31:0] R_SDIF1_PRDATA,
    output  reg         R_SDIF2_PSEL,
    output  reg         R_SDIF2_PWRITE,
    output  reg  [31:0] R_SDIF2_PRDATA,
    output  reg         R_SDIF3_PSEL,
    output  reg         R_SDIF3_PWRITE,
    output  reg  [31:0] R_SDIF3_PRDATA,

    output  reg         CONFIG1_DONE,
    input               SDIF_RELEASED,
    output  reg         CONFIG2_DONE,
    input               INIT_DONE,

    output  reg         SOFT_EXT_RESET_OUT,
    output  reg         SOFT_RESET_F2M,
    output  reg         SOFT_M3_RESET,
    output  reg         SOFT_MDDR_DDR_AXI_S_CORE_RESET,
    output  reg         SOFT_FDDR_CORE_RESET,
    output  reg         SOFT_SDIF0_PHY_RESET,
    output  reg         SOFT_SDIF0_CORE_RESET,
    output  reg         SOFT_SDIF1_PHY_RESET,
    output  reg         SOFT_SDIF1_CORE_RESET,
    output  reg         SOFT_SDIF2_PHY_RESET,
    output  reg         SOFT_SDIF2_CORE_RESET,
    output  reg         SOFT_SDIF3_PHY_RESET,
    output  reg         SOFT_SDIF3_CORE_RESET,
    // The following two signals are used when targeting an 090/7500 device
    // which has two PCIe controllers within a single SERDES interface
    // block.
    output  reg         SOFT_SDIF0_0_CORE_RESET,
    output  reg         SOFT_SDIF0_1_CORE_RESET
    );

    parameter FAMILY = 19;

    // Use the following parameters to indicate whether or not a particular
    // peripheral block is being used.
    parameter MDDR_IN_USE  = 1;
    parameter FDDR_IN_USE  = 1;
    parameter SDIF0_IN_USE = 1;
    parameter SDIF1_IN_USE = 1;
    parameter SDIF2_IN_USE = 1;
    parameter SDIF3_IN_USE = 1;

    // Following are used to indicate if a particular SDIF block is used
    // for PCIe.
    parameter SDIF0_PCIE   = 0;
    parameter SDIF1_PCIE   = 0;
    parameter SDIF2_PCIE   = 0;
    parameter SDIF3_PCIE   = 0;

    // Set the following parameter to 1 to include the SOFT_RESET control
    // register. This is used to control SOFT_* outputs.
    // These outputs can be used in CoreResetP to directly control its
    // various reset outputs.
    parameter ENABLE_SOFT_RESETS = 0;

    // Set the DEVICE_090 parameter to 1 when an 090/7500 device is being
    // targeted, otherwise set to 0.
    // When DEVICE_090 = 1, the address space normally allocated to
    // SERDESIF_0 and SERDESIF_1 is allocated to SERDESIF_0 only. This is
    // to support the SERDES interface used in the 090/7500 device which
    // contains two PCIe controllers. The extra address space allows the
    // two PCIe controllers to be accessed.
    // (An extra configuration address bit is taken into the SERDES
    //  interface on an 090/7500 device. The SERDES block used in this
    //  device gets address bits [14:2] whereas the SERDES blocks in other
    //  devices receive address bits [13:2].)
    parameter DEVICE_090    = 0;

    // A read only version register is used to inform software of the
    // capabilities of this core. For example, versions prior to 7.0
    // did not have an SDIF_RELEASED status bit, so any software that polls
    // this bit would hang if used with an earlier version of the core.
    localparam VERSION_MAJOR = 7;
    localparam VERSION_MINOR = 0;

    localparam [15:0] VERSION_MAJOR_VECTOR = VERSION_MAJOR;
    localparam [15:0] VERSION_MINOR_VECTOR = VERSION_MINOR;

    // Parameters for state machine states
    localparam          S0 = 2'b00;
    localparam          S1 = 2'b01;
    localparam          S2 = 2'b10;

    reg          [1:0]  state;
    reg          [1:0]  next_state;
    reg                 next_FIC_2_APB_M_PREADY;
    reg                 psel;
    reg                 d_psel;
    reg                 d_penable;
    reg                 pready;
    reg                 pslverr;
    reg         [31:0]  prdata;
    reg         [31:0]  int_prdata;
    reg                 int_psel;
    reg          [1:0]  control_reg_1;
    reg         [16:0]  soft_reset_reg;
    reg         [16:2]  paddr;
    reg         [31:0]  pwdata;
    reg                 pwrite;
    reg                 mddr_sel;
    reg                 fddr_sel;
    reg                 sdif0_sel;
    reg                 sdif1_sel;
    reg                 sdif2_sel;
    reg                 sdif3_sel;
    reg                 int_sel;
    reg                 INIT_DONE_q1;
    reg                 INIT_DONE_q2;
    reg                 SDIF_RELEASED_q1;
    reg                 SDIF_RELEASED_q2;

    //---------------------------------------------------------------------
    // SDIF related APB signals for connection to CoreResetP.
    // The PRDATA buses from the SDIF blocks carry status information when
    // a read is not in progress, and this status info is used within
    // CoreResetP.
    //---------------------------------------------------------------------
    always @(*)
    begin
        R_SDIF0_PSEL    = SDIF0_PSEL;
        R_SDIF0_PWRITE  = SDIF0_PWRITE;
        R_SDIF0_PRDATA  = SDIF0_PRDATA;
        R_SDIF1_PSEL    = SDIF1_PSEL;
        R_SDIF1_PWRITE  = SDIF1_PWRITE;
        R_SDIF1_PRDATA  = SDIF1_PRDATA;
        R_SDIF2_PSEL    = SDIF2_PSEL;
        R_SDIF2_PWRITE  = SDIF2_PWRITE;
        R_SDIF2_PRDATA  = SDIF2_PRDATA;
        R_SDIF3_PSEL    = SDIF3_PSEL;
        R_SDIF3_PWRITE  = SDIF3_PWRITE;
        R_SDIF3_PRDATA  = SDIF3_PRDATA;
    end

    //---------------------------------------------------------------------
    // Drive APB_S_PCLK signal to slaves.
    //---------------------------------------------------------------------
    always @(*)
    begin
        APB_S_PCLK = FIC_2_APB_M_PCLK;
    end

    //---------------------------------------------------------------------
    // Drive APB_S_PRESET_N signal to slaves.
    //---------------------------------------------------------------------
    always @(*)
    begin
        APB_S_PRESET_N = FIC_2_APB_M_PRESET_N;
    end

    //---------------------------------------------------------------------
    // PADDR, PWRITE and PWDATA from master registered before passing on to
    // slaves.
    //---------------------------------------------------------------------
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            paddr  <= 15'b0;
            pwrite <= 1'b0;
            pwdata <= 32'b0;
        end
        else
        begin
            if (state == S0)
            begin
                paddr  <= FIC_2_APB_M_PADDR;
                pwrite <= FIC_2_APB_M_PWRITE;
                pwdata <= FIC_2_APB_M_PWDATA;
            end
        end
    end

    always @(*)
    begin
        MDDR_PADDR   = paddr[15:2];
        FDDR_PADDR   = paddr[15:2];
        SDIF0_PADDR  = paddr[15:2];
        SDIF1_PADDR  = paddr[15:2];
        SDIF2_PADDR  = paddr[15:2];
        SDIF3_PADDR  = paddr[15:2];
        MDDR_PWRITE  = pwrite;
        FDDR_PWRITE  = pwrite;
        SDIF0_PWRITE = pwrite;
        SDIF1_PWRITE = pwrite;
        SDIF2_PWRITE = pwrite;
        SDIF3_PWRITE = pwrite;
        MDDR_PWDATA  = pwdata;
        FDDR_PWDATA  = pwdata;
        SDIF0_PWDATA = pwdata;
        SDIF1_PWDATA = pwdata;
        SDIF2_PWDATA = pwdata;
        SDIF3_PWDATA = pwdata;
    end

    //---------------------------------------------------------------------
    // Decode master address to produce slave selects
    //---------------------------------------------------------------------

    //                                                  111111     111111
    //                                                  54321098   54321098
    // --------------------------------------------------------------------
    // 090/7500 device
    // ---------------
    // MDDR         0x40020000 - 0x40020FFF             00000000 - 00001111
    // FDDR         0x40021000 - 0x40021FFF             00010000 - 00011111
    // Internal     0x40022000 - 0x40023FFF             00100000 - 00111111
    // (Unused)     0x40024000 - 0x40027FFF             01000000 - 01111111
    // SERDESIF_0   0x40028000 - 0x4002FFFF (32 KB)     10000000 - 11111111
    //
    // Devices other than 090/7500 or 150/12000
    // ----------------------------------------
    // MDDR         0x40020000 - 0x40020FFF             00000000 - 00001111
    // FDDR         0x40021000 - 0x40021FFF             00010000 - 00011111
    // Internal     0x40022000 - 0x40023FFF             00100000 - 00111111
    // (Unused)     0x40024000 - 0x40027FFF             01000000 - 01111111
    // SERDESIF_0   0x40028000 - 0x4002BFFF (16 KB)     10000000 - 10111111
    // SERDESIF_1   0x4002C000 - 0x4002FFFF (16 KB)     11000000 - 11111111
    //
    // 150/12000 device
    // ----------------
    // MDDR         0x40020000 - 0x40020FFF             00000000 - 00001111
    // FDDR         0x40021000 - 0x40021FFF             00010000 - 00011111
    // Internal     0x40022000 - 0x40023FFF             00100000 - 00111111
    // (Unused)     0x40024000 - 0x40027FFF             01000000 - 01111111
    // SERDESIF_0   0x40028000 - 0x4002BFFF (16 KB)     10000000 - 10111111
    // SERDESIF_1   0x4002C000 - 0x4002FFFF (16 KB)     11000000 - 11111111
    // SERDESIF_2   0x40030000 - 0x40033FFF (16 KB)    100000000 -100111111
    // SERDESIF_3   0x40034000 - 0x40037FFF (16 KB)    101000000 -101111111
    //
    //
    // Note: System registers (not particular to this block) begin
    //       at address 0x40038000 in the system memory map.
    //
    // Note: Aliases of MDDR, FDDR and internal registers will appear
    //       in the address space labelled Unused above.
    // --------------------------------------------------------------------
    always @(*)
    begin
        mddr_sel  = 1'b0;
        fddr_sel  = 1'b0;
        int_sel   = 1'b0;
        sdif0_sel = 1'b0;
        sdif1_sel = 1'b0;
        sdif2_sel = 1'b0;
        sdif3_sel = 1'b0;
        if (paddr[16:15] == 2'b10)
        begin
            if (paddr[14] == 1'b1)
                sdif3_sel = 1'b1;
            else
                sdif2_sel = 1'b1;
        end
        else
        begin
            if (paddr[15] == 1'b1)
            begin
                if (DEVICE_090 == 1)
                begin
                    sdif0_sel = 1'b1;
                end
                else
                begin
                    if (paddr[14] == 1'b1)
                        sdif1_sel = 1'b1;
                    else
                        sdif0_sel = 1'b1;
                end
            end
            else
            begin
                if (paddr[13] == 1'b1)
                    int_sel = 1'b1;
                else
                    if (paddr[12] == 1'b1)
                        fddr_sel = 1'b1;
                    else
                        mddr_sel = 1'b1;
            end
        end
    end

    always @(*)
    begin
        if (psel)
        begin
            MDDR_PSEL  = mddr_sel;
            FDDR_PSEL  = fddr_sel;
            SDIF0_PSEL = sdif0_sel;
            SDIF1_PSEL = sdif1_sel;
            SDIF2_PSEL = sdif2_sel;
            SDIF3_PSEL = sdif3_sel;
            int_psel   = int_sel;
        end
        else
        begin
            MDDR_PSEL  = 1'b0;
            FDDR_PSEL  = 1'b0;
            SDIF0_PSEL = 1'b0;
            SDIF1_PSEL = 1'b0;
            SDIF2_PSEL = 1'b0;
            SDIF3_PSEL = 1'b0;
            int_psel   = 1'b0;
        end
    end

    //---------------------------------------------------------------------
    // State machine
    //---------------------------------------------------------------------
    always @(*)
    begin
        next_state = state;
        next_FIC_2_APB_M_PREADY = FIC_2_APB_M_PREADY;
        d_psel = 1'b0;
        d_penable = 1'b0;
        case (state)
            S0:
            begin
                if (FIC_2_APB_M_PSEL && !FIC_2_APB_M_PENABLE)
                begin
                    next_state = S1;
                    next_FIC_2_APB_M_PREADY = 1'b0;
                end
            end
            S1:
            begin
                next_state = S2;
                d_psel = 1'b1;
            end
            S2:
            begin
                d_psel = 1'b1;
                d_penable = 1'b1;
                if (pready)
                begin
                    next_FIC_2_APB_M_PREADY = 1'b1;
                    next_state = S0;
                end
            end
            default:
            begin
                next_state = S0;
            end
        endcase
    end

    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            state <= S0;
            FIC_2_APB_M_PREADY <= 1'b1;
        end
        else
        begin
            state <= next_state;
            FIC_2_APB_M_PREADY <= next_FIC_2_APB_M_PREADY;
        end
    end

    always @(negedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            psel <= 1'b0;
            MDDR_PENABLE  <= 1'b0;
            FDDR_PENABLE  <= 1'b0;
            SDIF0_PENABLE <= 1'b0;
            SDIF1_PENABLE <= 1'b0;
            SDIF2_PENABLE <= 1'b0;
            SDIF3_PENABLE <= 1'b0;
        end
        else
        begin
            psel <= d_psel;
            MDDR_PENABLE  <= d_penable && mddr_sel;
            FDDR_PENABLE  <= d_penable && fddr_sel;
            SDIF0_PENABLE <= d_penable && sdif0_sel;
            SDIF1_PENABLE <= d_penable && sdif1_sel;
            SDIF2_PENABLE <= d_penable && sdif2_sel;
            SDIF3_PENABLE <= d_penable && sdif3_sel;
        end
    end
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // Mux signals from slaves.
    //---------------------------------------------------------------------
    always @(*)
    begin
        casez ({MDDR_PSEL,FDDR_PSEL,SDIF0_PSEL,SDIF1_PSEL,SDIF2_PSEL,SDIF3_PSEL,int_psel})
            7'b1??????:
            begin
                prdata  = MDDR_PRDATA;
                pslverr = MDDR_PSLVERR;
                pready  = MDDR_PREADY;
            end
            7'b?1?????:
            begin
                prdata  = FDDR_PRDATA;
                pslverr = FDDR_PSLVERR;
                pready  = FDDR_PREADY;
            end
            7'b??1????:
            begin
                prdata  = SDIF0_PRDATA;
                pslverr = SDIF0_PSLVERR;
                pready  = SDIF0_PREADY;
            end
            7'b???1???:
            begin
                prdata  = SDIF1_PRDATA;
                pslverr = SDIF1_PSLVERR;
                pready  = SDIF1_PREADY;
            end
            7'b????1??:
            begin
                prdata  = SDIF2_PRDATA;
                pslverr = SDIF2_PSLVERR;
                pready  = SDIF2_PREADY;
            end
            7'b?????1?:
            begin
                prdata  = SDIF3_PRDATA;
                pslverr = SDIF3_PSLVERR;
                pready  = SDIF3_PREADY;
            end
            7'b??????1:
            begin
                prdata  = int_prdata;
                pslverr = 1'b0;
                pready  = 1'b1;
            end
            default:
            begin
                prdata  = int_prdata;
                pslverr = 1'b0;
                pready  = 1'b1;
            end
        endcase
    end

    //---------------------------------------------------------------------
    // Register read data from slaves.
    //---------------------------------------------------------------------
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            FIC_2_APB_M_PRDATA   <= 32'b0;
            FIC_2_APB_M_PSLVERR  <= 1'b0;
        end
        else
        begin
            if (state == S2)
            begin
                FIC_2_APB_M_PRDATA   <= prdata;
                FIC_2_APB_M_PSLVERR  <= pslverr;
            end
        end
    end

    //---------------------------------------------------------------------
    // Synchronize INIT_DONE input to FIC_2_APB_M_PCLK domain.
    //---------------------------------------------------------------------
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            INIT_DONE_q1 <= 1'b0;
            INIT_DONE_q2 <= 1'b0;
        end
        else
        begin
            INIT_DONE_q1 <= INIT_DONE;
            INIT_DONE_q2 <= INIT_DONE_q1;
        end
    end

    //---------------------------------------------------------------------
    // Synchronize SDIF_RELEASED input to FIC_2_APB_M_PCLK domain.
    //---------------------------------------------------------------------
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            SDIF_RELEASED_q1 <= 1'b0;
            SDIF_RELEASED_q2 <= 1'b0;
        end
        else
        begin
            SDIF_RELEASED_q1 <= SDIF_RELEASED;
            SDIF_RELEASED_q2 <= SDIF_RELEASED_q1;
        end
    end

    //---------------------------------------------------------------------
    // Internal registers
    //---------------------------------------------------------------------
    // Control register 1
    //    [0] = CONFIG1_DONE
    //    [1] = CONFIG2_DONE
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            control_reg_1 <= 2'b0;
        end
        else
        begin
            if (int_psel && FIC_2_APB_M_PENABLE && FIC_2_APB_M_PWRITE
                && (FIC_2_APB_M_PADDR[4:2] == 3'b000)
            )
            begin
                control_reg_1 <= FIC_2_APB_M_PWDATA[1:0];
            end
        end
    end
    always @(*)
    begin
        CONFIG1_DONE = control_reg_1[0];
        CONFIG2_DONE = control_reg_1[1];
    end

    // Soft reset control register
    always @(posedge FIC_2_APB_M_PCLK or negedge FIC_2_APB_M_PRESET_N)
    begin
        if (!FIC_2_APB_M_PRESET_N)
        begin
            soft_reset_reg <= 17'b0;
        end
        else
        begin
            if (ENABLE_SOFT_RESETS == 1)
            begin
                if (int_psel && FIC_2_APB_M_PENABLE && FIC_2_APB_M_PWRITE
                    && (FIC_2_APB_M_PADDR[4:2] == 3'b100)
                )
                begin
                    soft_reset_reg <= FIC_2_APB_M_PWDATA[16:0];
                end
            end
        end
    end
    always @(*)
    begin
        SOFT_EXT_RESET_OUT             = soft_reset_reg[ 0];
        SOFT_RESET_F2M                 = soft_reset_reg[ 1];
        SOFT_M3_RESET                  = soft_reset_reg[ 2];
        SOFT_MDDR_DDR_AXI_S_CORE_RESET = soft_reset_reg[ 3];
        //SOFT_FAB_RESET                 = soft_reset_reg[ 4];
        //SOFT_USER_FAB_RESET            = soft_reset_reg[ 5];
        SOFT_FDDR_CORE_RESET           = soft_reset_reg[ 6];
        SOFT_SDIF0_PHY_RESET           = soft_reset_reg[ 7];
        SOFT_SDIF0_CORE_RESET          = soft_reset_reg[ 8];
        SOFT_SDIF1_PHY_RESET           = soft_reset_reg[ 9];
        SOFT_SDIF1_CORE_RESET          = soft_reset_reg[10];
        SOFT_SDIF2_PHY_RESET           = soft_reset_reg[11];
        SOFT_SDIF2_CORE_RESET          = soft_reset_reg[12];
        SOFT_SDIF3_PHY_RESET           = soft_reset_reg[13];
        SOFT_SDIF3_CORE_RESET          = soft_reset_reg[14];
        // The following two signals are used when targeting an 090/7500
        // device which has two PCIe controllers within a single SERDES
        // interface block.
        SOFT_SDIF0_0_CORE_RESET        = soft_reset_reg[15];
        SOFT_SDIF0_1_CORE_RESET        = soft_reset_reg[16];
    end

    // Read data from internal registers
    always @(*)
    begin
        case (FIC_2_APB_M_PADDR[4:2])
            3'b000: int_prdata = {30'b0, control_reg_1}; // CTRL_REG_1
            3'b001: int_prdata = {30'b0, SDIF_RELEASED_q2, INIT_DONE_q2};  // STATUS_REG
            3'b010: int_prdata = 32'b0; // Used to be CTRL_REG_2
            3'b011: int_prdata = { // Read only Configuration Status Register
                                  26'b0,
                                  (MDDR_IN_USE  == 1),
                                  (FDDR_IN_USE  == 1),
                                  (SDIF3_IN_USE == 1),
                                  (SDIF2_IN_USE == 1),
                                  (SDIF1_IN_USE == 1),
                                  (SDIF0_IN_USE == 1)
                                 };
            3'b100: int_prdata = {15'b0, soft_reset_reg}; // SOFT_RESET_REG
            3'b101: int_prdata = {
                                    VERSION_MAJOR_VECTOR,   // [31:16]
                                    VERSION_MINOR_VECTOR    // [15: 0]
                                 };
            default: int_prdata = 32'b0;
        endcase
    end

endmodule
