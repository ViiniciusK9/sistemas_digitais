// registrador de 16-bits

module registrador_16b(clk, l, d, q);
    // entradas
    input clk;
    input l;
    input [15:0] d;
    // saidas
    output reg [15:0] q;

    initial begin
        q = 16'b0000000000000000;
    end

    always @(posedge clk and l == 1) begin 
        q = d;
    end
endmodule


module testbench;

    reg clk0 = 0;
    reg [15:0] d0 = 0;
    wire [15:0] q0;

    registrador_16b reg_16(clk0, d0, q0);

    always #1 begin
        clk0 <= ~clk0;
    end

    initial begin 
        $dumpvars;
        #2
        d0 = 16'b0000000000000100;
        #2
        d0 = 16'b0000000000000010;
        #4
        d0 = 16'b0000000000001000;
        #5;
        $finish;
    end

endmodule
