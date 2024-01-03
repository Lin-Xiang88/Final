`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/04 00:10:20
// Design Name: 
// Module Name: sort
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


module QSORT(
    input  clk,
    input  rst,
    input [31:0]acc_data_i,
    input acc_data_valid,
    input func_sel, 
    output reg [31:0]SORT_OUT
    );

reg [31:0]array[10:1];      
reg [3:0]sort_cnt;    
reg [3:0]out_cnt;    
always @(posedge clk or posedge rst)begin  
    if(rst)begin
        sort_cnt<=0;
        {array[10], array[9], array[8], array[7], array[6], array[5], array[4], array[3], array[2], array[1]}<=0;
    end
    else begin
        if(func_sel && acc_data_valid)begin
            {array[10], array[9], array[8], array[7], array[6], array[5], array[4], array[3], array[2], array[1]}<={array[9],array[8], array[7], array[6], array[5], array[4], array[3], array[2], array[1], acc_data_i};
            if(sort_cnt==10)sort_cnt<=10;
            else sort_cnt<=sort_cnt+1;
        end
    end
end    
    
always @(posedge clk or posedge rst)begin  
    if(rst) out_cnt<=0;
    else begin
        if(sort_cnt==10)begin
            if(out_cnt==10)out_cnt<=10;
            else out_cnt<=out_cnt+1;
        end   
    end
end

always @(posedge clk)begin
    case(out_cnt)
        1:SORT_OUT<=array[10];
        2:SORT_OUT<=array[9];
        3:SORT_OUT<=array[8];
        4:SORT_OUT<=array[7];
        5:SORT_OUT<=array[6];
        6:SORT_OUT<=array[5];
        7:SORT_OUT<=array[4];
        8:SORT_OUT<=array[3];
        9:SORT_OUT<=array[2];
        10:SORT_OUT<=array[1];
    endcase
end


integer i, j;
reg [31:0] temp;
always @*begin
    for (i = 10; i > 0; i = i - 1) begin
        for (j = 1 ; j < i; j = j + 1) begin
                if (array[j] < array[j + 1])
                begin
                    temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
        end 
    end
    end 
end    
    
    
endmodule
