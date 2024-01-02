`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 18:17:58
// Design Name: 
// Module Name: SYSTOLIC_DF
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


module SYSTOLIC_DF(
    input  clk,
    input  rst,
    input [31:0]acc_data_i,
    input acc_data_valid,
    input func_sel, 
    output reg [31:0]ACC_OUT
    );

parameter DATA_WIDTH = 32;

parameter idle          = 4'b0000;
parameter mm_data_in    = 4'b0001;
parameter mm_opr        = 4'b0010;
parameter mm_finish     = 4'b1111;
parameter fir_opr       = 4'b1000;

wire [31:0]o_data[3:0];
//MM
wire [31:0]MM_OUT_t0;
wire [31:0]MM_OUT_t1;
wire [31:0]MM_OUT_t2;
wire [31:0]MM_OUT_t3;
wire [31:0]MM_OUT_t4;
wire [31:0]MM_OUT_t5;
wire [31:0]MM_OUT_t6;
wire [31:0]MM_OUT_t7;
wire [31:0]MM_OUT_t8;
wire [31:0]MM_OUT_t9;
wire [31:0]MM_OUT_t10;
wire [31:0]MM_OUT_t11;
wire [31:0]MM_OUT_t12;
wire [31:0]MM_OUT_t13;
wire [31:0]MM_OUT_t14;
wire [31:0]MM_OUT_t15;

wire [351:0]i_fir_data;
wire [351:0]i_fir_tap;
wire [31:0]o_fir_data;

reg [31:0]MM_OUT[15:0];
reg [31:0]mm_buffer[11:0];
reg [3:0]mm_opr_cnt;
reg [3:0]mm_cy_cnt;
reg [4:0]mm_out_cnt;
//FIR
reg [31:0]fir_data[10:0];
reg [31:0]fir_tap[10:0];
reg [8:0]fir_cy_cnt;
reg [3:0]fir_opr_cnt;
reg [31:0]systolic_di[3:0];
reg [31:0]systolic_ti[3:0];

reg [3:0]ps;
reg systolic_rst;

reg [DATA_WIDTH-1:0] i_data_11;
reg [DATA_WIDTH-1:0] i_data_21;
reg [DATA_WIDTH-1:0] i_tap_11;
reg [DATA_WIDTH-1:0] i_tap_12;
reg [DATA_WIDTH-1:0] i_fir_data_12;
reg [DATA_WIDTH-1:0] i_fir_data_22;
reg [DATA_WIDTH-1:0] i_fir_tap_21;
reg [DATA_WIDTH-1:0] i_fir_tap_22;

assign MM_OUT_t0=MM_OUT[0];
assign MM_OUT_t1=MM_OUT[1];
assign MM_OUT_t2=MM_OUT[2];
assign MM_OUT_t3=MM_OUT[3];
assign MM_OUT_t4=MM_OUT[4];
assign MM_OUT_t5=MM_OUT[5];
assign MM_OUT_t6=MM_OUT[6];
assign MM_OUT_t7=MM_OUT[7];
assign MM_OUT_t8=MM_OUT[8];
assign MM_OUT_t9=MM_OUT[9];
assign MM_OUT_t10=MM_OUT[10];
assign MM_OUT_t11=MM_OUT[11];
assign MM_OUT_t12=MM_OUT[12];
assign MM_OUT_t13=MM_OUT[13];
assign MM_OUT_t14=MM_OUT[14];
assign MM_OUT_t15=MM_OUT[15];

assign i_fir_data =  {fir_data[10],fir_data[9],fir_data[8],fir_data[7],fir_data[6],fir_data[5],fir_data[4],fir_data[3],fir_data[2],fir_data[1],fir_data[0]};
assign i_fir_tap = {fir_tap[10],fir_tap[9],fir_tap[8],fir_tap[7],fir_tap[6],fir_tap[5],fir_tap[4],fir_tap[3],fir_tap[2],fir_tap[1],fir_tap[0]};

always@(posedge clk or posedge rst)begin
    if(rst) ps<=idle;
    else begin
        case(ps)
            idle: begin 
                if(acc_data_valid && !func_sel && mm_cy_cnt<9) ps<=mm_data_in;
                else if(acc_data_valid && func_sel && fir_cy_cnt>10) ps<=fir_opr;
                else ps<=idle;
            end
            mm_data_in:begin
                if(!acc_data_valid) begin
                    if(mm_cy_cnt>0) ps<=mm_opr;
                    else            ps<=idle;
                end
                else ps<=mm_data_in;
            end
            mm_opr:begin
                if(acc_data_valid && !func_sel && mm_cy_cnt<9) ps<=mm_data_in;
                else if(mm_cy_cnt==9 && mm_opr_cnt==6)    ps<=idle;
                else ps<=mm_opr;
            end      
            fir_opr:begin
                if(fir_opr_cnt==4)ps<=idle;
                else ps<=fir_opr;
            end
        endcase
    end    
end    
//=======================================================================================================
//MM
always@(posedge clk or posedge rst)begin
    if(rst)    mm_cy_cnt<=0; 
    else begin 
        if(ps==mm_data_in && !acc_data_valid)   mm_cy_cnt<=mm_cy_cnt+1;
        else if(mm_cy_cnt==8 && mm_opr_cnt==6)  mm_cy_cnt<=mm_cy_cnt+1;
        else mm_cy_cnt<=mm_cy_cnt;
    end    
end    

always@(posedge clk or posedge rst)begin
    if(rst)    mm_opr_cnt<=0; 
    else begin 
        if(mm_cy_cnt==8 && mm_opr_cnt==6)   mm_opr_cnt<=0;
        else if(ps == mm_opr)   begin
            if(mm_opr_cnt==7)mm_opr_cnt<=7;
            else mm_opr_cnt<=mm_opr_cnt+1;
        end
        else mm_opr_cnt<=0;
    end    
end    

always@(posedge clk)begin
    if(acc_data_valid)begin
        if(func_sel)begin
            {mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]} <= {mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};//delete          
        end else begin
            {mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]} <= {mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0],acc_data_i};
        end 
    end else begin
        {mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]} <= {mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8],mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4],mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};//delete
    end
end

always@*begin
    case(mm_cy_cnt)
        2,6:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}={mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4]};
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}={mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};
        end
        3,7:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}={mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8]};
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}={mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};     
        end
        4,8:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}={mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}={mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8]};
        end
        5:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}={mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4]};
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}={mm_buffer[11],mm_buffer[10],mm_buffer[9],mm_buffer[8]};
        end
        9:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}={mm_buffer[3],mm_buffer[2],mm_buffer[1],mm_buffer[0]};
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}={mm_buffer[7],mm_buffer[6],mm_buffer[5],mm_buffer[4]};
        end
        default:begin
            {systolic_di[3],systolic_di[2],systolic_di[1],systolic_di[0]}=0;
            {systolic_ti[3],systolic_ti[2],systolic_ti[1],systolic_ti[0]}=0;
        end
    endcase
end    

always@(posedge clk or posedge rst)begin
    if(rst)    systolic_rst<=1; 
    else begin 
        if(mm_opr_cnt==6 || fir_opr_cnt==5) systolic_rst<=1;     
        else systolic_rst<=0;
    end    
end    

always@(posedge clk or posedge rst)begin
    if(rst)mm_out_cnt<=0;
    else begin
        if(mm_out_cnt==16)mm_out_cnt<=16;
        else if(mm_cy_cnt==9)mm_out_cnt<=mm_out_cnt+1;
        else mm_out_cnt<=0;
    end
end


integer i;
always@(posedge clk or posedge rst)begin
    if(rst)begin
        for(i=0;i<16;i=i+1) MM_OUT[i]<=0;
    end else begin
        //if(ps==mm_opr && acc_data_valid && !func_sel)begin
        if(mm_opr_cnt==6)begin
            case (mm_cy_cnt)
                2,6:begin
                    {MM_OUT[5],MM_OUT[4],MM_OUT[1],MM_OUT[0]}<={MM_OUT[5],MM_OUT[4],MM_OUT[1],MM_OUT[0]} + {o_data[3],o_data[2],o_data[1],o_data[0]};
                end
                3,7:begin
                    {MM_OUT[7],MM_OUT[6],MM_OUT[3],MM_OUT[2]}<={MM_OUT[7],MM_OUT[6],MM_OUT[3],MM_OUT[2]} + {o_data[3],o_data[2],o_data[1],o_data[0]};
                end
                4,8:begin
                    {MM_OUT[13],MM_OUT[12],MM_OUT[9],MM_OUT[8]}<={MM_OUT[13],MM_OUT[12],MM_OUT[9],MM_OUT[8]} + {o_data[3],o_data[2],o_data[1],o_data[0]};
                end
                5,9:begin
                    {MM_OUT[15],MM_OUT[14],MM_OUT[11],MM_OUT[10]}<={MM_OUT[15],MM_OUT[14],MM_OUT[11],MM_OUT[10]} + {o_data[3],o_data[2],o_data[1],o_data[0]};
                end            
            endcase
        end
    end     
end
//=======================================================================================================
//FIR
always@(posedge clk or posedge rst)begin
    if(rst) fir_cy_cnt<=0;
    else begin
        if(acc_data_valid && func_sel)begin
            fir_cy_cnt<=fir_cy_cnt+1;
        end
    end
end

always@(posedge clk or posedge rst)begin
    if(rst) fir_opr_cnt<=0;
    else begin
        if(ps==fir_opr)fir_opr_cnt<=fir_opr_cnt+1;
        else    fir_opr_cnt<=0;    
    end
end


always@(posedge clk or posedge rst)begin
    if(rst)begin
        {fir_tap[10],fir_tap[9],fir_tap[8],fir_tap[7],fir_tap[6],fir_tap[5],fir_tap[4],fir_tap[3],fir_tap[2],fir_tap[1],fir_tap[0]}<=0;
    end else begin
        if(acc_data_valid && func_sel && fir_cy_cnt<11)begin
            {fir_tap[10],fir_tap[9],fir_tap[8],fir_tap[7],fir_tap[6],fir_tap[5],fir_tap[4],fir_tap[3],fir_tap[2],fir_tap[1],fir_tap[0]} <= {fir_tap[9],fir_tap[8],fir_tap[7],fir_tap[6],fir_tap[5],fir_tap[4],fir_tap[3],fir_tap[2],fir_tap[1],fir_tap[0],acc_data_i};
        end
    end 
end

always@(posedge clk or posedge rst)begin
    if(rst)begin
        {fir_data[10],fir_data[9],fir_data[8],fir_data[7],fir_data[6],fir_data[5],fir_data[4],fir_data[3],fir_data[2],fir_data[1],fir_data[0]}<=0; 
    end else begin
        if(acc_data_valid && func_sel && fir_cy_cnt>10)begin
            {fir_data[10],fir_data[9],fir_data[8],fir_data[7],fir_data[6],fir_data[5],fir_data[4],fir_data[3],fir_data[2],fir_data[1],fir_data[0]}<= {fir_data[9],fir_data[8],fir_data[7],fir_data[6],fir_data[5],fir_data[4],fir_data[3],fir_data[2],fir_data[1],fir_data[0],acc_data_i};
        end
    end
end

always@*begin
    if(func_sel && fir_opr_cnt>1)
        ACC_OUT = o_fir_data;
    else if(mm_cy_cnt==9)begin
        case(mm_out_cnt)
            0:ACC_OUT = MM_OUT[0];
            1:ACC_OUT = MM_OUT[1];
            2:ACC_OUT = MM_OUT[2];
            3:ACC_OUT = MM_OUT[3];
            4:ACC_OUT = MM_OUT[4];
            5:ACC_OUT = MM_OUT[5];
            6:ACC_OUT = MM_OUT[6];
            7:ACC_OUT = MM_OUT[7];  
            8:ACC_OUT = MM_OUT[8];
            9:ACC_OUT = MM_OUT[9];
            10:ACC_OUT = MM_OUT[10];
            11:ACC_OUT = MM_OUT[11];
            12:ACC_OUT = MM_OUT[12];
            13:ACC_OUT = MM_OUT[13];
            14:ACC_OUT = MM_OUT[14];
            15:ACC_OUT = MM_OUT[15];        
        endcase 
    end
end
//=======================================================================================================
//SYSTOLIC input
always@(posedge clk or posedge rst)begin
    if(rst) begin
        i_data_11<=0;
        i_data_21<=0;
        i_tap_11<=0;
        i_tap_12<=0;
    end else begin 
        if(ps==mm_opr)begin
            if(mm_opr_cnt==0)begin
                i_data_11<=systolic_di[3];
                i_data_21<=0;
                i_tap_11<=systolic_ti[3];
                i_tap_12<=0;
            end else if(mm_opr_cnt==1)begin    
                i_data_11<=systolic_di[2];
                i_data_21<=systolic_di[1];
                i_tap_11<=systolic_ti[1];
                i_tap_12<=systolic_ti[2];        
            end else if(mm_opr_cnt==2)begin    
                i_data_11<=0;
                i_data_21<=systolic_di[0];
                i_tap_11<=0;
                i_tap_12<=systolic_ti[0];        
            end else begin
                i_data_11<=0;
                i_data_21<=0;
                i_tap_11<=0;
                i_tap_12<=0;  
            end
        end       
        else begin
            i_data_11<=0;
            i_data_21<=0;
            i_tap_11<=0;
            i_tap_12<=0;                    
        end    
    end
end

SYSTOLIC_11PE #(
    .DATA_WIDTH(DATA_WIDTH)
)SYSTOLIC_11PE_INST(
    .clk(clk),
    .rst(systolic_rst),
    .func_sel(func_sel),                   // 0 -> matrix multiplication, 1 -> fir 
    .i_data_11(i_data_11), 
    .i_data_21(i_data_21),
    .i_tap_11(i_tap_11),
    .i_tap_12(i_tap_12),
    .i_fir_data(i_fir_data),
    .i_fir_tap(i_fir_tap),
    .o_data_11(o_data[0]),
    .o_data_12(o_data[1]),
    .o_data_21(o_data[2]),
    .o_data_22(o_data[3]),
    .o_fir_data(o_fir_data)
);

endmodule
