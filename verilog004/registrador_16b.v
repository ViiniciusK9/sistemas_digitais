// registrador de 16-bits

module registrador_16b(clk, d, q);
    // entradas
    input clk;
    input [15:0] d;
    // saidas
    output reg [15;0] q;

    initial begin
        q = 16'b0000000000000000;
    end

    always @(posedge clk) begin 
        q = d;
    end
endmodule


testbench 

