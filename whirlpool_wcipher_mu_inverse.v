//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_MU_INVERSE
// Description:    Mu-inverse function of Whirlpool W-Cipher
//
// Language:       Verilog-2001
//
// Module Dependencies:  none
//
// Developer:  Saied H. Khayat
// URL: https://github.com/saiedhk
// Date:  May 2014
// 
// Copyright Notice: Free use of this library is permitted under the
// guidelines and in accordance with the MIT License (MIT).
// http://opensource.org/licenses/MIT
//
//======================================================================

`timescale 1ns/1ps

//`define DEBUG
`define PRINT_TEST_VECTORS

module WHIRLPOOL_WCIPHER_MU_INVERSE (
    output [0:511] A,
    input  [7:0] B00, B01, B02, B03, B04, B05, B06, B07,
                 B10, B11, B12, B13, B14, B15, B16, B17,
                 B20, B21, B22, B23, B24, B25, B26, B27,
                 B30, B31, B32, B33, B34, B35, B36, B37,
                 B40, B41, B42, B43, B44, B45, B46, B47,
                 B50, B51, B52, B53, B54, B55, B56, B57,
                 B60, B61, B62, B63, B64, B65, B66, B67,
                 B70, B71, B72, B73, B74, B75, B76, B77
);

//---------combinational processes----------

    assign A[0   : 7  ] = B00;
    assign A[8   : 15 ] = B01;
    assign A[16  : 23 ] = B02;
    assign A[24  : 31 ] = B03;
    assign A[32  : 39 ] = B04;
    assign A[40  : 47 ] = B05;
    assign A[48  : 55 ] = B06;
    assign A[56  : 63 ] = B07;
    assign A[64  : 71 ] = B10;
    assign A[72  : 79 ] = B11;
    assign A[80  : 87 ] = B12;
    assign A[88  : 95 ] = B13;
    assign A[96  : 103] = B14;
    assign A[104 : 111] = B15;
    assign A[112 : 119] = B16;
    assign A[120 : 127] = B17;
    assign A[128 : 135] = B20;
    assign A[136 : 143] = B21;
    assign A[144 : 151] = B22;
    assign A[152 : 159] = B23;
    assign A[160 : 167] = B24;
    assign A[168 : 175] = B25;
    assign A[176 : 183] = B26;
    assign A[184 : 191] = B27;
    assign A[192 : 199] = B30;
    assign A[200 : 207] = B31;
    assign A[208 : 215] = B32;
    assign A[216 : 223] = B33;
    assign A[224 : 231] = B34;
    assign A[232 : 239] = B35;
    assign A[240 : 247] = B36;
    assign A[248 : 255] = B37;
    assign A[256 : 263] = B40;
    assign A[264 : 271] = B41;
    assign A[272 : 279] = B42;
    assign A[280 : 287] = B43;
    assign A[288 : 295] = B44;
    assign A[296 : 303] = B45;
    assign A[304 : 311] = B46;
    assign A[312 : 319] = B47;
    assign A[320 : 327] = B50;
    assign A[328 : 335] = B51;
    assign A[336 : 343] = B52;
    assign A[344 : 351] = B53;
    assign A[352 : 359] = B54;
    assign A[360 : 367] = B55;
    assign A[368 : 375] = B56;
    assign A[376 : 383] = B57;
    assign A[384 : 391] = B60;
    assign A[392 : 399] = B61;
    assign A[400 : 407] = B62;
    assign A[408 : 415] = B63;
    assign A[416 : 423] = B64;
    assign A[424 : 431] = B65;
    assign A[432 : 439] = B66;
    assign A[440 : 447] = B67;
    assign A[448 : 455] = B70;
    assign A[456 : 463] = B71;
    assign A[464 : 471] = B72;
    assign A[472 : 479] = B73;
    assign A[480 : 487] = B74;
    assign A[488 : 495] = B75;
    assign A[496 : 503] = B76;
    assign A[504 : 511] = B77;

endmodule