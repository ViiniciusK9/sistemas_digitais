module FSM_sintese (
    w,
    ck,
    reset,
    z
);
    // Entradas
    input w, ck, reset;
    output z;

    reg reg0;
    wire fio0;

    assign fio0 = w;
    assign z = w & reg0;

    always @(posedge ck or reset ) begin
        if(reset == 1) reg0 = 0;
        else reg0 = fio0;
    end
    

endmodule