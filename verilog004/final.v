`include "BC.v"
`include "BO.v"


module final(clk, inicio, reset, a, b, c, x, saida);
    // entradas
    input clk;
    input inicio;
    input reset;
    input [15:0] a;
    input [15:0] b;
    input [15:0] c;
    input [15:0] x;

    // saidas
    output [15:0] saida;


    wire [1:0] m0_to_m0;
    wire [1:0] m1_to_m1;
    wire [1:0] m2_to_m2;
    wire lx_to_lx, ls_to_ls, lh_to_lh, h_to_h;
    wire [15:0] s;

    // junção do BC com BO

    BC bc_0(inicio, clk, reset, m0_to_m0, m1_to_m1, m2_to_m2, lx_to_lx, ls_to_ls, lh_to_lh,h_to_h);

    BO bo_0(a, b, c, x, m0_to_m0, m1_to_m1, m2_to_m2, lx_to_lx, ls_to_ls, lh_to_lh, h_to_h, clk, s);

    assign saida = s;
    
endmodule



module testbench;

    reg [15:0] a0 = 16'b0000000000000011;
    reg [15:0] b0 = 16'b0000000000000010;
    reg [15:0] c0 = 16'b0000000000000011;
    reg [15:0] x0 = 16'b0000000000000011;
    wire [15:0] s0;
    reg inicio0 = 0, clk0 = 0, reset0 = 0;
    

    always #1 begin
        clk0 <= ~clk0;
    end 

    final f0(clk0, inicio0, reset0, a0, b0, c0, x0, s0);

    initial begin
        $dumpvars;
        #2
        reset0 = 1;
        #2
        reset0 = 0;
        #2
        inicio0 = 1;
        #3
        inicio0 = 0;
        #10
        $finish;

    end

endmodule

