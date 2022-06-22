include "FSM_Somatorio.v"

module testbench;

    reg reset, ck, inicio,
    reg zero,
    wire set, dec, rac, cac,
    wire pronto;

    FSM FSM0(reset0, ck0, inicio0, zero0, set0, dec0, rac0, cac0, pronto0);

