module BC (inicio, clk, rst, m0, m1, m2, lx, ls, lh, h);

    // entradas
    input inicio, clk, rst;

    // saidas
    output reg [1:0] m0;
    output reg [1:0] m1;
    output reg [1:0] m2;
    output reg lx, ls, lh, h;

    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;

    reg [2:0] estado;

    always @(posedge clk) begin
        if (rst == 1) begin 
            estado <= s0;
            m0 <= 01;
            m1 <= 01;
            m2 <= 00;
            lx <= 1;
            ls <= 0;
            lh <= 0;
            h <= 1;
        end
        else
            case (estado)
                s0: 
                    if (inicio == 1) begin
                        estado = s1;
                        m0 <= 01;
                        m1 <= 01;
                        m2 <= 00;
                        lx <= 0;
                        ls <= 0;
                        lh <= 1;
                        h <= 1;
                    end
                s1: 
                    begin
                        estado = s2;
                        m0 <= 01;
                        m1 <= 00;
                        m2 <= 11;
                        lx <= 0;
                        ls <= 1;
                        lh <= 0;
                        h <= 1;
                    end
                s2: 
                    begin
                        estado = s3;
                        m0 <= 10;
                        m1 <= 00;
                        m2 <= 00;
                        lx <= 0;
                        ls <= 0;
                        lh <= 1;
                        h <= 1;
                    end
                s3: 
                    begin
                        estado = s4;
                        m0 <= 10;
                        m1 <= 11;
                        m2 <= 10;
                        lx <= 0;
                        ls <= 1;
                        lh <= 0;
                        h <= 0;
                    end
                s4: 
                    begin
                        estado = s5;
                        m0 <= 11;
                        m1 <= 00;
                        m2 <= 10;
                        lx <= 0;
                        ls <= 1;
                        lh <= 0;
                        h <= 0;
                    end
                s5: 
                    begin
                        estado = s6;
                        m0 <= 00;
                        m1 <= 00;
                        m2 <= 00;
                        lx <= 0;
                        ls <= 0;
                        lh <= 0;
                        h <= 0;
                    end
                s6: 
                    begin
                        estado = s0;
                        m0 <= 01;
                        m1 <= 01;
                        m2 <= 00;
                        lx <= 1;
                        ls <= 0;
                        lh <= 0;
                        h <= 1;
                    end
            endcase
    end

endmodule