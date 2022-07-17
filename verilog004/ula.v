

module ula(e0, e1, h, s);
    // entradas
    input [15:0] e0;
    input [15:0] e1;
    input h;
    // saidas
    output reg [15:0] s;

    // funcionamento
    wire [15:0] soma, mult;

    assign soma = e0 + e1;
    assign mult = e0 * e1;

    always @(h) begin
        case (h)
            1'b0:  s = soma;
            1'b1:  s = mult;
        endcase
    end 
endmodule

module testbench;

    reg [15:0] ee0 = 16'b0000000000000011;
    reg [15:0] ee1 = 16'b0000000000000010;
    reg h0;
    wire [15:0] s0;

    ula u0(ee0, ee1, h0, s0);

    initial begin
        $dumpvars;
        #2
        h0 = 1'b0;
        #2
        h0 = 1'b1;
        #2
        ee1 = 16'b0000000000000011;
        h0 = 1'b0;
        #2
        h0 = 1'b1;
        #2

        $finish;
    end
endmodule
