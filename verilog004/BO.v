`include "multiplexador_4x1_16b.v"
`include "registrador_16b.v"
`include "ula.v"

module BO(a, b, c, x, m0, m1, m2, lx, ls, lh, h, clk, resultado);
    // entradas
    input [15:0] a;
    input [15:0] b;
    input [15:0] c;
    input [15:0] x;
    input [1:0] m0;
    input [1:0] m1;
    input [1:0] m2;
    input lx;
    input ls;
    input lh;
    input h;
    input clk;

    // saidas
    output [15:0] resultado;

    // constante
    parameter exx = 16'b0000000000000000;

    // fios 
    wire [15:0] re_x_to_mu;
    wire [15:0] mu_0_to_mu_1;
    wire [15:0] mu_0_to_mu_2;
    
    wire [15:0] mu_2_to_u0;
    wire [15:0] mu_1_to_u0;
    
    wire [15:0] u0_to_re;
    
    wire [15:0] re_s_to_mu;
    wire [15:0] re_h_to_mu;


    // funcionamento muito louco do bo
    registrador_16b re_x(clk, lx, x, re_x_to_mu);

    multiplexador_4x1_16b mu_0(exx, a, b, c, m0, mu_0_to_mu_1);
    multiplexador_4x1_16b mu_1(mu_0_to_mu_1, re_x_to_mu, re_s_to_mu, re_h_to_mu, m1, mu_1_to_u0);
    multiplexador_4x1_16b mu_2(re_x_to_mu, mu_0_to_mu_2, re_s_to_mu, re_h_to_mu, m2, mu_2_to_u0);

    ula u0(mu_2_to_u0, mu_1_to_u0, h, u0_to_re);

    registrador_16b re_s(clk, ls, u0_to_re, re_s_to_mu);
    registrador_16b re_h(clk, lh, u0_to_re, re_h_to_mu);

    assign resultado = re_s_to_mu;

endmodule
    