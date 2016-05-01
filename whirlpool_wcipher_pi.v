//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_PI
// Description:    Pi function of Whirlpool W-Cipher
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

module WHIRLPOOL_WCIPHER_PI (
    output [7:0] B00, B01, B02, B03, B04, B05, B06, B07,
                 B10, B11, B12, B13, B14, B15, B16, B17,
                 B20, B21, B22, B23, B24, B25, B26, B27,
                 B30, B31, B32, B33, B34, B35, B36, B37,
                 B40, B41, B42, B43, B44, B45, B46, B47,
                 B50, B51, B52, B53, B54, B55, B56, B57,
                 B60, B61, B62, B63, B64, B65, B66, B67,
                 B70, B71, B72, B73, B74, B75, B76, B77,
     input [7:0] A00, A01, A02, A03, A04, A05, A06, A07,
                 A10, A11, A12, A13, A14, A15, A16, A17,
                 A20, A21, A22, A23, A24, A25, A26, A27,
                 A30, A31, A32, A33, A34, A35, A36, A37,
                 A40, A41, A42, A43, A44, A45, A46, A47,
                 A50, A51, A52, A53, A54, A55, A56, A57,
                 A60, A61, A62, A63, A64, A65, A66, A67,
                 A70, A71, A72, A73, A74, A75, A76, A77
    );

//---------combinational processes----------
    // shift column 0 downward by 0 positions
    assign B00 = A00;
    assign B10 = A10;
    assign B20 = A20;
    assign B30 = A30;
    assign B40 = A40;
    assign B50 = A50;
    assign B60 = A60;
    assign B70 = A70;

    // shift column 1 downward by 1 positions
    assign B01 = A71;
    assign B11 = A01;
    assign B21 = A11;
    assign B31 = A21;
    assign B41 = A31;
    assign B51 = A41;
    assign B61 = A51;
    assign B71 = A61;

    // shift column 2 downward by 2 positions
    assign B02 = A62;
    assign B12 = A72;
    assign B22 = A02;
    assign B32 = A12;
    assign B42 = A22;
    assign B52 = A32;
    assign B62 = A42;
    assign B72 = A52;

    // shift column 3 downward by 3 positions
    assign B03 = A53;
    assign B13 = A63;
    assign B23 = A73;
    assign B33 = A03;
    assign B43 = A13;
    assign B53 = A23;
    assign B63 = A33;
    assign B73 = A43;

    // shift column 4 downward by 4 positions
    assign B04 = A44;
    assign B14 = A54;
    assign B24 = A64;
    assign B34 = A74;
    assign B44 = A04;
    assign B54 = A14;
    assign B64 = A24;
    assign B74 = A34;

    // shift column 5 downward by 5 positions
    assign B05 = A35;
    assign B15 = A45;
    assign B25 = A55;
    assign B35 = A65;
    assign B45 = A75;
    assign B55 = A05;
    assign B65 = A15;
    assign B75 = A25;

    // shift column 6 downward by 6 positions
    assign B06 = A26;
    assign B16 = A36;
    assign B26 = A46;
    assign B36 = A56;
    assign B46 = A66;
    assign B56 = A76;
    assign B66 = A06;
    assign B76 = A16;

    // shift column 7 downward by 7 positions
    assign B07 = A17;
    assign B17 = A27;
    assign B27 = A37;
    assign B37 = A47;
    assign B47 = A57;
    assign B57 = A67;
    assign B67 = A77;
    assign B77 = A07;

endmodule