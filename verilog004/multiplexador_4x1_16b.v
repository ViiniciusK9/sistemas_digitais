

module multiplexador_4x1_16b(entrada_0, entrada_1, entrada_2, entrada_3, entrada_controle, saida);
    // entradas
    input [15:0] entrada_0;
    input [15:0] entrada_1;
    input [15:0] entrada_2;
    input [15:0] entrada_3;
    input [1:0] entrada_controle;
    // saidas
    output reg [15:0] saida;

    // funcionamento do circuito

    always @(entrada_controle) begin
        case (entrada_controle)
            2'b00: saida = entrada_0;
            2'b01: saida = entrada_1;
            2'b10: saida = entrada_2;
            2'b11: saida = entrada_3; 
        endcase
    end 
endmodule

module testbench;

    reg [15:0] e0 = 16'b0000000000000000;
    reg [15:0] e1 = 16'b0000000000000001;
    reg [15:0] e2 = 16'b0000000000000010;
    reg [15:0] e3 = 16'b0000000000000011;
    reg [1:0] ec = 2'b00;
    wire [15:0] s;

    multiplexador_4x1_16b m0(e0, e1, e2, e3, ec, s);

    initial begin
        $dumpvars;

        #2
        ec = 2'b01;
        #2
        ec = 2'b10;
        #2
        ec = 2'b11;
        #2
        ec = 2'b00;
        #2

        $finish;
    end

endmodule

    