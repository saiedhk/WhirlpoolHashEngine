//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_MU
// Description:    Mu function of Whirlpool W-Cipher
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

module WHIRLPOOL_WCIPHER_MU (
    output [7:0] B00, B01, B02, B03, B04, B05, B06, B07,
                 B10, B11, B12, B13, B14, B15, B16, B17,
                 B20, B21, B22, B23, B24, B25, B26, B27,
                 B30, B31, B32, B33, B34, B35, B36, B37,
                 B40, B41, B42, B43, B44, B45, B46, B47,
                 B50, B51, B52, B53, B54, B55, B56, B57,
                 B60, B61, B62, B63, B64, B65, B66, B67,
                 B70, B71, B72, B73, B74, B75, B76, B77,
    input  [0:511] A   // input bit string (bit order left to right)
);

//---------combinational processes----------

    assign B00 = A[0   : 7  ];
    assign B01 = A[8   : 15 ];
    assign B02 = A[16  : 23 ];
    assign B03 = A[24  : 31 ];
    assign B04 = A[32  : 39 ];
    assign B05 = A[40  : 47 ];
    assign B06 = A[48  : 55 ];
    assign B07 = A[56  : 63 ];
    assign B10 = A[64  : 71 ];
    assign B11 = A[72  : 79 ];
    assign B12 = A[80  : 87 ];
    assign B13 = A[88  : 95 ];
    assign B14 = A[96  : 103];
    assign B15 = A[104 : 111];
    assign B16 = A[112 : 119];
    assign B17 = A[120 : 127];
    assign B20 = A[128 : 135];
    assign B21 = A[136 : 143];
    assign B22 = A[144 : 151];
    assign B23 = A[152 : 159];
    assign B24 = A[160 : 167];
    assign B25 = A[168 : 175];
    assign B26 = A[176 : 183];
    assign B27 = A[184 : 191];
    assign B30 = A[192 : 199];
    assign B31 = A[200 : 207];
    assign B32 = A[208 : 215];
    assign B33 = A[216 : 223];
    assign B34 = A[224 : 231];
    assign B35 = A[232 : 239];
    assign B36 = A[240 : 247];
    assign B37 = A[248 : 255];
    assign B40 = A[256 : 263];
    assign B41 = A[264 : 271];
    assign B42 = A[272 : 279];
    assign B43 = A[280 : 287];
    assign B44 = A[288 : 295];
    assign B45 = A[296 : 303];
    assign B46 = A[304 : 311];
    assign B47 = A[312 : 319];
    assign B50 = A[320 : 327];
    assign B51 = A[328 : 335];
    assign B52 = A[336 : 343];
    assign B53 = A[344 : 351];
    assign B54 = A[352 : 359];
    assign B55 = A[360 : 367];
    assign B56 = A[368 : 375];
    assign B57 = A[376 : 383];
    assign B60 = A[384 : 391];
    assign B61 = A[392 : 399];
    assign B62 = A[400 : 407];
    assign B63 = A[408 : 415];
    assign B64 = A[416 : 423];
    assign B65 = A[424 : 431];
    assign B66 = A[432 : 439];
    assign B67 = A[440 : 447];
    assign B70 = A[448 : 455];
    assign B71 = A[456 : 463];
    assign B72 = A[464 : 471];
    assign B73 = A[472 : 479];
    assign B74 = A[480 : 487];
    assign B75 = A[488 : 495];
    assign B76 = A[496 : 503];
    assign B77 = A[504 : 511];

endmodule