module FSM(
    input reset, ck, inicio,
    input zero, overflow_entrada,
    output pronto, overflow, set, pronto, dec, rac,
    output cac;
);

    reg[1:0] estado;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge ck or reset) begin
        if (reset == 1) estado <= S0;
        else begin
            case (estado)
                S0: begin
                        if (inicio == 1) estado <= S1;
                        set = 1;
                        dec = 0;
                        rac = 0;
                        cac = 1;
                        pronto = 1;
                    end
                S1: begin
                        if (zero == 0) estado <= S2;
                        else estado <= S3;
                        set = 0;
                        dec = 0;
                        rac = 0;
                        cac = 0;
                        pronto = 0;
                    end
                //S1: if (zero == 1) estado <= S3;
                S2: begin
                        estado <= S1;
                        set = 0;
                        dec = 1;
                        cac = 1;
                        rac = 0;
                        pronto = 0;
                    end
                S3: begin
                        estado <= S0;
                        set = 0;
                        dec = 0;
                        rac = 0;
                        cac = 0;
                        pronto = 1;
                    end
                default: 
            endcase
    end