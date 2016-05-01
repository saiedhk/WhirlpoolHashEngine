//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_THETA
// Description:    Theta function of Whirlpool W-Cipher
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

module WHIRLPOOL_WCIPHER_THETA (
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

localparam REDPOLY = 8'h1D;    // reduction polynomial (in hex representation)

//---------functions----------
function [7:0] TIMES_2 ( input [7:0] X );
    TIMES_2[7:0] = ( X[7] ) ? ({X[6:0], 1'b0} ^ REDPOLY) : {X[6:0], 1'b0};
endfunction

function [7:0] TIMES_4 ( input [7:0] X );
begin
    TIMES_4[7:0] = TIMES_2( TIMES_2 (X[7:0]) );
end
endfunction

function [7:0] TIMES_8 ( input [7:0] X );
begin
    TIMES_8[7:0] = TIMES_2( TIMES_2 ( TIMES_2 (X[7:0]) ) );
end
endfunction

function [7:0] TIMES_5 ( input [7:0] X );
begin
    TIMES_5[7:0] = TIMES_4( X[7:0] ) ^ X;
end
endfunction

function [7:0] TIMES_9 ( input [7:0] X );
begin
    TIMES_9[7:0] = TIMES_8( X[7:0] ) ^ X;
end
endfunction

function [7:0] XORALL ( input [7:0] X0, X1, X2, X3, X4, X5, X6, X7 );
begin
    XORALL[7:0] = ( ( (X0 ^ X1) ^ (X2 ^ X3) ) ^ ( (X4 ^ X5) ^ (X6 ^ X7) ) );
end
endfunction

//---------combinational processes----------

// ROW 0
assign B00 = XORALL( A00 , TIMES_9(A01) , TIMES_2(A02) , TIMES_5(A03) , TIMES_8(A04) , A05 , TIMES_4(A06) , A07 );
assign B01 = XORALL( A00 , A01 , TIMES_9(A02) , TIMES_2(A03) , TIMES_5(A04) , TIMES_8(A05) , A06 , TIMES_4(A07) );
assign B02 = XORALL( TIMES_4(A00) , A01 , A02 , TIMES_9(A03) , TIMES_2(A04) , TIMES_5(A05) , TIMES_8(A06) , A07 );
assign B03 = XORALL( A00 , TIMES_4(A01) , A02 , A03 , TIMES_9(A04) , TIMES_2(A05) , TIMES_5(A06) , TIMES_8(A07) );
assign B04 = XORALL( TIMES_8(A00) , A01 , TIMES_4(A02) , A03 , A04 , TIMES_9(A05) , TIMES_2(A06) , TIMES_5(A07) );
assign B05 = XORALL( TIMES_5(A00) , TIMES_8(A01) , A02 , TIMES_4(A03) , A04 , A05 , TIMES_9(A06) , TIMES_2(A07) );
assign B06 = XORALL( TIMES_2(A00) , TIMES_5(A01) , TIMES_8(A02) , A03 , TIMES_4(A04) , A05 , A06 , TIMES_9(A07) );
assign B07 = XORALL( TIMES_9(A00) , TIMES_2(A01) , TIMES_5(A02) , TIMES_8(A03) , A04 , TIMES_4(A05) , A06 , A07 );

// ROW 1
assign B10 = XORALL( A10 , TIMES_9(A11) , TIMES_2(A12) , TIMES_5(A13) , TIMES_8(A14) , A15 , TIMES_4(A16) , A17 );
assign B11 = XORALL( A10 , A11 , TIMES_9(A12) , TIMES_2(A13) , TIMES_5(A14) , TIMES_8(A15) , A16 , TIMES_4(A17) );
assign B12 = XORALL( TIMES_4(A10) , A11 , A12 , TIMES_9(A13) , TIMES_2(A14) , TIMES_5(A15) , TIMES_8(A16) , A17 );
assign B13 = XORALL( A10 , TIMES_4(A11) , A12 , A13 , TIMES_9(A14) , TIMES_2(A15) , TIMES_5(A16) , TIMES_8(A17) );
assign B14 = XORALL( TIMES_8(A10) , A11 , TIMES_4(A12) , A13 , A14 , TIMES_9(A15) , TIMES_2(A16) , TIMES_5(A17) );
assign B15 = XORALL( TIMES_5(A10) , TIMES_8(A11) , A12 , TIMES_4(A13) , A14 , A15 , TIMES_9(A16) , TIMES_2(A17) );
assign B16 = XORALL( TIMES_2(A10) , TIMES_5(A11) , TIMES_8(A12) , A13 , TIMES_4(A14) , A15 , A16 , TIMES_9(A17) );
assign B17 = XORALL( TIMES_9(A10) , TIMES_2(A11) , TIMES_5(A12) , TIMES_8(A13) , A14 , TIMES_4(A15) , A16 , A17 );

// ROW 2
assign B20 = XORALL( A20 , TIMES_9(A21) , TIMES_2(A22) , TIMES_5(A23) , TIMES_8(A24) , A25 , TIMES_4(A26) , A27 );
assign B21 = XORALL( A20 , A21 , TIMES_9(A22) , TIMES_2(A23) , TIMES_5(A24) , TIMES_8(A25) , A26 , TIMES_4(A27) );
assign B22 = XORALL( TIMES_4(A20) , A21 , A22 , TIMES_9(A23) , TIMES_2(A24) , TIMES_5(A25) , TIMES_8(A26) , A27 );
assign B23 = XORALL( A20 , TIMES_4(A21) , A22 , A23 , TIMES_9(A24) , TIMES_2(A25) , TIMES_5(A26) , TIMES_8(A27) );
assign B24 = XORALL( TIMES_8(A20) , A21 , TIMES_4(A22) , A23 , A24 , TIMES_9(A25) , TIMES_2(A26) , TIMES_5(A27) );
assign B25 = XORALL( TIMES_5(A20) , TIMES_8(A21) , A22 , TIMES_4(A23) , A24 , A25 , TIMES_9(A26) , TIMES_2(A27) );
assign B26 = XORALL( TIMES_2(A20) , TIMES_5(A21) , TIMES_8(A22) , A23 , TIMES_4(A24) , A25 , A26 , TIMES_9(A27) );
assign B27 = XORALL( TIMES_9(A20) , TIMES_2(A21) , TIMES_5(A22) , TIMES_8(A23) , A24 , TIMES_4(A25) , A26 , A27 );

// ROW 3
assign B30 = XORALL( A30 , TIMES_9(A31) , TIMES_2(A32) , TIMES_5(A33) , TIMES_8(A34) , A35 , TIMES_4(A36) , A37 );
assign B31 = XORALL( A30 , A31 , TIMES_9(A32) , TIMES_2(A33) , TIMES_5(A34) , TIMES_8(A35) , A36 , TIMES_4(A37) );
assign B32 = XORALL( TIMES_4(A30) , A31 , A32 , TIMES_9(A33) , TIMES_2(A34) , TIMES_5(A35) , TIMES_8(A36) , A37 );
assign B33 = XORALL( A30 , TIMES_4(A31) , A32 , A33 , TIMES_9(A34) , TIMES_2(A35) , TIMES_5(A36) , TIMES_8(A37) );
assign B34 = XORALL( TIMES_8(A30) , A31 , TIMES_4(A32) , A33 , A34 , TIMES_9(A35) , TIMES_2(A36) , TIMES_5(A37) );
assign B35 = XORALL( TIMES_5(A30) , TIMES_8(A31) , A32 , TIMES_4(A33) , A34 , A35 , TIMES_9(A36) , TIMES_2(A37) );
assign B36 = XORALL( TIMES_2(A30) , TIMES_5(A31) , TIMES_8(A32) , A33 , TIMES_4(A34) , A35 , A36 , TIMES_9(A37) );
assign B37 = XORALL( TIMES_9(A30) , TIMES_2(A31) , TIMES_5(A32) , TIMES_8(A33) , A34 , TIMES_4(A35) , A36 , A37 );

// ROW 4
assign B40 = XORALL( A40 , TIMES_9(A41) , TIMES_2(A42) , TIMES_5(A43) , TIMES_8(A44) , A45 , TIMES_4(A46) , A47 );
assign B41 = XORALL( A40 , A41 , TIMES_9(A42) , TIMES_2(A43) , TIMES_5(A44) , TIMES_8(A45) , A46 , TIMES_4(A47) );
assign B42 = XORALL( TIMES_4(A40) , A41 , A42 , TIMES_9(A43) , TIMES_2(A44) , TIMES_5(A45) , TIMES_8(A46) , A47 );
assign B43 = XORALL( A40 , TIMES_4(A41) , A42 , A43 , TIMES_9(A44) , TIMES_2(A45) , TIMES_5(A46) , TIMES_8(A47) );
assign B44 = XORALL( TIMES_8(A40) , A41 , TIMES_4(A42) , A43 , A44 , TIMES_9(A45) , TIMES_2(A46) , TIMES_5(A47) );
assign B45 = XORALL( TIMES_5(A40) , TIMES_8(A41) , A42 , TIMES_4(A43) , A44 , A45 , TIMES_9(A46) , TIMES_2(A47) );
assign B46 = XORALL( TIMES_2(A40) , TIMES_5(A41) , TIMES_8(A42) , A43 , TIMES_4(A44) , A45 , A46 , TIMES_9(A47) );
assign B47 = XORALL( TIMES_9(A40) , TIMES_2(A41) , TIMES_5(A42) , TIMES_8(A43) , A44 , TIMES_4(A45) , A46 , A47 );

// ROW 5
assign B50 = XORALL( A50 , TIMES_9(A51) , TIMES_2(A52) , TIMES_5(A53) , TIMES_8(A54) , A55 , TIMES_4(A56) , A57 );
assign B51 = XORALL( A50 , A51 , TIMES_9(A52) , TIMES_2(A53) , TIMES_5(A54) , TIMES_8(A55) , A56 , TIMES_4(A57) );
assign B52 = XORALL( TIMES_4(A50) , A51 , A52 , TIMES_9(A53) , TIMES_2(A54) , TIMES_5(A55) , TIMES_8(A56) , A57 );
assign B53 = XORALL( A50 , TIMES_4(A51) , A52 , A53 , TIMES_9(A54) , TIMES_2(A55) , TIMES_5(A56) , TIMES_8(A57) );
assign B54 = XORALL( TIMES_8(A50) , A51 , TIMES_4(A52) , A53 , A54 , TIMES_9(A55) , TIMES_2(A56) , TIMES_5(A57) );
assign B55 = XORALL( TIMES_5(A50) , TIMES_8(A51) , A52 , TIMES_4(A53) , A54 , A55 , TIMES_9(A56) , TIMES_2(A57) );
assign B56 = XORALL( TIMES_2(A50) , TIMES_5(A51) , TIMES_8(A52) , A53 , TIMES_4(A54) , A55 , A56 , TIMES_9(A57) );
assign B57 = XORALL( TIMES_9(A50) , TIMES_2(A51) , TIMES_5(A52) , TIMES_8(A53) , A54 , TIMES_4(A55) , A56 , A57 );

// ROW 6
assign B60 = XORALL( A60 , TIMES_9(A61) , TIMES_2(A62) , TIMES_5(A63) , TIMES_8(A64) , A65 , TIMES_4(A66) , A67 );
assign B61 = XORALL( A60 , A61 , TIMES_9(A62) , TIMES_2(A63) , TIMES_5(A64) , TIMES_8(A65) , A66 , TIMES_4(A67) );
assign B62 = XORALL( TIMES_4(A60) , A61 , A62 , TIMES_9(A63) , TIMES_2(A64) , TIMES_5(A65) , TIMES_8(A66) , A67 );
assign B63 = XORALL( A60 , TIMES_4(A61) , A62 , A63 , TIMES_9(A64) , TIMES_2(A65) , TIMES_5(A66) , TIMES_8(A67) );
assign B64 = XORALL( TIMES_8(A60) , A61 , TIMES_4(A62) , A63 , A64 , TIMES_9(A65) , TIMES_2(A66) , TIMES_5(A67) );
assign B65 = XORALL( TIMES_5(A60) , TIMES_8(A61) , A62 , TIMES_4(A63) , A64 , A65 , TIMES_9(A66) , TIMES_2(A67) );
assign B66 = XORALL( TIMES_2(A60) , TIMES_5(A61) , TIMES_8(A62) , A63 , TIMES_4(A64) , A65 , A66 , TIMES_9(A67) );
assign B67 = XORALL( TIMES_9(A60) , TIMES_2(A61) , TIMES_5(A62) , TIMES_8(A63) , A64 , TIMES_4(A65) , A66 , A67 );

// ROW 7
assign B70 = XORALL( A70 , TIMES_9(A71) , TIMES_2(A72) , TIMES_5(A73) , TIMES_8(A74) , A75 , TIMES_4(A76) , A77 );
assign B71 = XORALL( A70 , A71 , TIMES_9(A72) , TIMES_2(A73) , TIMES_5(A74) , TIMES_8(A75) , A76 , TIMES_4(A77) );
assign B72 = XORALL( TIMES_4(A70) , A71 , A72 , TIMES_9(A73) , TIMES_2(A74) , TIMES_5(A75) , TIMES_8(A76) , A77 );
assign B73 = XORALL( A70 , TIMES_4(A71) , A72 , A73 , TIMES_9(A74) , TIMES_2(A75) , TIMES_5(A76) , TIMES_8(A77) );
assign B74 = XORALL( TIMES_8(A70) , A71 , TIMES_4(A72) , A73 , A74 , TIMES_9(A75) , TIMES_2(A76) , TIMES_5(A77) );
assign B75 = XORALL( TIMES_5(A70) , TIMES_8(A71) , A72 , TIMES_4(A73) , A74 , A75 , TIMES_9(A76) , TIMES_2(A77) );
assign B76 = XORALL( TIMES_2(A70) , TIMES_5(A71) , TIMES_8(A72) , A73 , TIMES_4(A74) , A75 , A76 , TIMES_9(A77) );
assign B77 = XORALL( TIMES_9(A70) , TIMES_2(A71) , TIMES_5(A72) , TIMES_8(A73) , A74 , TIMES_4(A75) , A76 , A77 );


endmodule
