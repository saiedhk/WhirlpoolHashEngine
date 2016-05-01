//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_GAMMA
// Description:    Gamma function of Whirlpool W-Cipher
//
// Language:       Verilog-2001
//
// Module Dependencies:
//    WHIRLPOOL_WCIPHER_SBOX
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

module WHIRLPOOL_WCIPHER_GAMMA (
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
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_00 ( .idata(A00), .odata(B00) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_01 ( .idata(A01), .odata(B01) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_02 ( .idata(A02), .odata(B02) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_03 ( .idata(A03), .odata(B03) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_04 ( .idata(A04), .odata(B04) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_05 ( .idata(A05), .odata(B05) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_06 ( .idata(A06), .odata(B06) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_07 ( .idata(A07), .odata(B07) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_10 ( .idata(A10), .odata(B10) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_11 ( .idata(A11), .odata(B11) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_12 ( .idata(A12), .odata(B12) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_13 ( .idata(A13), .odata(B13) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_14 ( .idata(A14), .odata(B14) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_15 ( .idata(A15), .odata(B15) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_16 ( .idata(A16), .odata(B16) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_17 ( .idata(A17), .odata(B17) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_20 ( .idata(A20), .odata(B20) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_21 ( .idata(A21), .odata(B21) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_22 ( .idata(A22), .odata(B22) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_23 ( .idata(A23), .odata(B23) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_24 ( .idata(A24), .odata(B24) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_25 ( .idata(A25), .odata(B25) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_26 ( .idata(A26), .odata(B26) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_27 ( .idata(A27), .odata(B27) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_30 ( .idata(A30), .odata(B30) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_31 ( .idata(A31), .odata(B31) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_32 ( .idata(A32), .odata(B32) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_33 ( .idata(A33), .odata(B33) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_34 ( .idata(A34), .odata(B34) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_35 ( .idata(A35), .odata(B35) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_36 ( .idata(A36), .odata(B36) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_37 ( .idata(A37), .odata(B37) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_40 ( .idata(A40), .odata(B40) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_41 ( .idata(A41), .odata(B41) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_42 ( .idata(A42), .odata(B42) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_43 ( .idata(A43), .odata(B43) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_44 ( .idata(A44), .odata(B44) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_45 ( .idata(A45), .odata(B45) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_46 ( .idata(A46), .odata(B46) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_47 ( .idata(A47), .odata(B47) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_50 ( .idata(A50), .odata(B50) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_51 ( .idata(A51), .odata(B51) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_52 ( .idata(A52), .odata(B52) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_53 ( .idata(A53), .odata(B53) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_54 ( .idata(A54), .odata(B54) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_55 ( .idata(A55), .odata(B55) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_56 ( .idata(A56), .odata(B56) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_57 ( .idata(A57), .odata(B57) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_60 ( .idata(A60), .odata(B60) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_61 ( .idata(A61), .odata(B61) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_62 ( .idata(A62), .odata(B62) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_63 ( .idata(A63), .odata(B63) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_64 ( .idata(A64), .odata(B64) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_65 ( .idata(A65), .odata(B65) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_66 ( .idata(A66), .odata(B66) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_67 ( .idata(A67), .odata(B67) );

WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_70 ( .idata(A70), .odata(B70) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_71 ( .idata(A71), .odata(B71) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_72 ( .idata(A72), .odata(B72) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_73 ( .idata(A73), .odata(B73) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_74 ( .idata(A74), .odata(B74) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_75 ( .idata(A75), .odata(B75) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_76 ( .idata(A76), .odata(B76) );
WHIRLPOOL_WCIPHER_SBOX whirlpool_sbox_77 ( .idata(A77), .odata(B77) );


endmodule