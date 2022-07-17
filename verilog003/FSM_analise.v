
module FSM_analise (
    reset,
    cnt,
    clock,
    y
);
    // entradas
    input reset;
    input cnt;
    input clock;
    output y;

    reg[1:0] registrador;
    wire[1:0] fio;

    assign fio[0] = registrador[0] ^ cnt;
    assign fio[1] = registrador[1] & ~cnt | registrador[0] & cnt & ~registrador[1] | registrador[1] & ~registrador[0];
    assign y = registrador[0] & registrador[1];

    always @(posedge clock or reset ) begin
        if(reset == 1) registrador = 0;
        else registrador = fio;
    end

endmodule


module testbench;

    reg cnt0 = 0;
    reg reset0 = 0;
    reg clock0 = 0;
    wire y0;

    FSM_analise FSM0(reset0, cnt0, clock0, y0);
    
    always #1 begin
        clock0<=~clock0;
    end 

    initial begin
        $dumpvars;
        #1 
        reset0 = 1;
        #1
        reset0 = 0;
        #1
        cnt0 = 1;
        #500
        $finish;
    end

endmodule