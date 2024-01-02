`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/02 21:46:36
// Design Name: 
// Module Name: SYSTOLIC_11PE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SYSTOLIC_11PE#(
    parameter DATA_WIDTH = 32
)(
    input  clk,
    input  rst,
    input  func_sel,                   // 0 -> matrix multiplication, 1 -> fir 
    input  [DATA_WIDTH-1:0] i_data_11, // 11 means row 1, column 1
    input  [DATA_WIDTH-1:0] i_data_21,
    // input  [DATA_WIDTH-1:0] i_fir_data_12,
    // input  [DATA_WIDTH-1:0] i_fir_data_22,
    input  [DATA_WIDTH-1:0] i_tap_11,
    input  [DATA_WIDTH-1:0] i_tap_12,
    // input  [DATA_WIDTH-1:0] i_fir_tap_21,
    // input  [DATA_WIDTH-1:0] i_fir_tap_22,
    
    input [351:0]i_fir_data,
    input [351:0]i_fir_tap,
    
    // output [DATA_WIDTH-1:0] o_muldata_11,
    // output [DATA_WIDTH-1:0] o_muldata_12,
    // output [DATA_WIDTH-1:0] o_muldata_21,
    // output [DATA_WIDTH-1:0] o_muldata_22,

    output [DATA_WIDTH-1:0] o_data_11,
    output [DATA_WIDTH-1:0] o_data_12,
    output [DATA_WIDTH-1:0] o_data_21,
    output [DATA_WIDTH-1:0] o_data_22,

    output [DATA_WIDTH-1:0]o_fir_data
);


wire signed [DATA_WIDTH-1:0] o_muldata_11;
wire signed [DATA_WIDTH-1:0] o_muldata_12;
wire signed [DATA_WIDTH-1:0] o_muldata_21;
wire signed [DATA_WIDTH-1:0] o_muldata_22;

reg signed [31:0]temp_data[6:0];
reg signed [31:0]temp_tap[6:0];
reg signed [31:0]o_fir_w,o_fir_r;

reg [DATA_WIDTH-1:0] tap_sel_11, tap_sel_12, tap_sel_21, tap_sel_22;
reg [DATA_WIDTH-1:0] data_sel_11, data_sel_12, data_sel_21,data_sel_22;

assign o_fir_data = o_fir_r;

assign {PE[0].i_pe_data, PE[1].i_pe_data, PE[2].i_pe_data, PE[3].i_pe_data} = {data_sel_11, data_sel_12, data_sel_21, data_sel_22};
assign {PE[0].i_pe_tap,  PE[1].i_pe_tap,  PE[2].i_pe_tap,  PE[3].i_pe_tap}  = {tap_sel_11, tap_sel_12, tap_sel_21, tap_sel_22};

// assign {PE[4].i_pe_data, PE[5].i_pe_data, PE[6].i_pe_data, PE[7].i_pe_data, PE[8].i_pe_data, PE[9].i_pe_data, PE[10].i_pe_data} = {i_fir_data[4],i_fir_data[5],i_fir_data[6],i_fir_data[7],i_fir_data[8],i_fir_data[9],i_fir_data[10]} 
// assign {PE[4].i_pe_tap,  PE[5].i_pe_tap,  PE[6].i_pe_tap,  PE[7].i_pe_tap, PE[8].i_pe_tap,  PE[9].i_pe_tap,  PE[10].i_pe_tap}  = {i_fir_tap[4],i_fir_tap[5],i_fir_tap[6],i_fir_tap[7],i_fir_tap[8],i_fir_tap[9],i_fir_tap[10]} 
assign {o_data_11, o_data_12, o_data_21, o_data_22} = {PE[0].o_accumulate, PE[1].o_accumulate, PE[2].o_accumulate, PE[3].o_accumulate};
assign {o_muldata_11, o_muldata_12, o_muldata_21, o_muldata_22} = {PE[0].o_mul, PE[1].o_mul, PE[2].o_mul, PE[3].o_mul};

genvar i;
generate
    for(i = 0; i < 4; i = i + 1)  begin: PE
        wire [DATA_WIDTH-1:0] i_pe_data;
        wire [DATA_WIDTH-1:0] i_pe_tap;
        wire [DATA_WIDTH-1:0] o_pe_data;
        wire [DATA_WIDTH-1:0] o_pe_tap;
        wire [DATA_WIDTH-1:0] o_accumulate;
        wire [DATA_WIDTH-1:0] o_mul;
        PE #(
            .DATA_WIDTH(DATA_WIDTH)
        )PE_inst(
            .clk(clk),
            .rst(rst),
            .i_data(i_pe_data),
            .i_tap(i_pe_tap),
            .o_data_t(o_pe_data),
            .o_tap_t(o_pe_tap),
            .o_accumulate(o_accumulate),
            .o_mul(o_mul)
        );
    end
endgenerate

always @(posedge clk) begin
    temp_data[0] <= i_fir_data[159:128];
    temp_data[1] <= i_fir_data[191:160];
    temp_data[2] <= i_fir_data[223:192];
    temp_data[3] <= i_fir_data[255:224];
    temp_data[4] <= i_fir_data[287:256];
    temp_data[5] <= i_fir_data[319:288];
    temp_data[6] <= i_fir_data[351:320];
    temp_tap[0] <= i_fir_tap[159:128];
    temp_tap[1] <= i_fir_tap[191:160];
    temp_tap[2] <= i_fir_tap[223:192];
    temp_tap[3] <= i_fir_tap[255:224];
    temp_tap[4] <= i_fir_tap[287:256];
    temp_tap[5] <= i_fir_tap[319:288];
    temp_tap[6] <= i_fir_tap[351:320];  
end

always @*begin
    o_fir_w<=   (temp_data[0]*temp_tap[0])+
                (temp_data[1]*temp_tap[1])+
                (temp_data[2]*temp_tap[2])+
                (temp_data[3]*temp_tap[3])+
                (temp_data[4]*temp_tap[4])+
                (temp_data[5]*temp_tap[5])+
                (temp_data[6]*temp_tap[6])+o_muldata_11+o_muldata_12+o_muldata_21+o_muldata_22;
end

always @(posedge clk or posedge rst) begin
    if(rst) begin
        o_fir_r <= {DATA_WIDTH{1'b0}};
    end else begin
        o_fir_r <= o_fir_w;
    end
end


always @(*) begin
    if(func_sel) begin
        data_sel_11 = i_fir_data[31:0];       
        data_sel_12 = i_fir_data[63:32];
        data_sel_21 = i_fir_data[95:64];
        data_sel_22 = i_fir_data[127:96];
        tap_sel_11 = i_fir_tap[31:0];  
        tap_sel_12 = i_fir_tap[63:32];
        tap_sel_21 = i_fir_tap[95:64];
        tap_sel_22 = i_fir_tap[127:96];
    end else begin
        data_sel_11 = i_data_11;
        data_sel_12 = PE[0].o_pe_data;
        data_sel_21 = i_data_21;
        data_sel_22 = PE[2].o_pe_data;
        tap_sel_11 = i_tap_11;
        tap_sel_12 = i_tap_12;
        tap_sel_21  = PE[0].o_pe_tap;
        tap_sel_22  = PE[1].o_pe_tap;
    end
end

endmodule
