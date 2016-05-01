//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_ROUND
// Description:    Top-level Round function of Whirlpool W-Cipher
//
// Language:       Verilog-2001
//
// Module Dependencies:
//    WHIRLPOOL_WCIPHER_PI
//    WHIRLPOOL_WCIPHER_MU
//    WHIRLPOOL_WCIPHER_THETA
//    WHIRLPOOL_WCIPHER_MU_INVERSE
//    WHIRLPOOL_WCIPHER_GAMMA
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

module WHIRLPOOL_WCIPHER_ROUND (
    output [0:511] odata,
    input [0:511] idata,
    input [0:511] subkey
);

//---------wires, registers----------

wire [7:0]  A00, A01, A02, A03, A04, A05, A06, A07,
            A10, A11, A12, A13, A14, A15, A16, A17,
            A20, A21, A22, A23, A24, A25, A26, A27,
            A30, A31, A32, A33, A34, A35, A36, A37,
            A40, A41, A42, A43, A44, A45, A46, A47,
            A50, A51, A52, A53, A54, A55, A56, A57,
            A60, A61, A62, A63, A64, A65, A66, A67,
            A70, A71, A72, A73, A74, A75, A76, A77;
            
wire [7:0]  B00, B01, B02, B03, B04, B05, B06, B07,
            B10, B11, B12, B13, B14, B15, B16, B17,
            B20, B21, B22, B23, B24, B25, B26, B27,
            B30, B31, B32, B33, B34, B35, B36, B37,
            B40, B41, B42, B43, B44, B45, B46, B47,
            B50, B51, B52, B53, B54, B55, B56, B57,
            B60, B61, B62, B63, B64, B65, B66, B67,
            B70, B71, B72, B73, B74, B75, B76, B77;
            
wire [7:0]  C00, C01, C02, C03, C04, C05, C06, C07,
            C10, C11, C12, C13, C14, C15, C16, C17,
            C20, C21, C22, C23, C24, C25, C26, C27,
            C30, C31, C32, C33, C34, C35, C36, C37,
            C40, C41, C42, C43, C44, C45, C46, C47,
            C50, C51, C52, C53, C54, C55, C56, C57,
            C60, C61, C62, C63, C64, C65, C66, C67,
            C70, C71, C72, C73, C74, C75, C76, C77;
            
wire [7:0]  D00, D01, D02, D03, D04, D05, D06, D07,
            D10, D11, D12, D13, D14, D15, D16, D17,
            D20, D21, D22, D23, D24, D25, D26, D27,
            D30, D31, D32, D33, D34, D35, D36, D37,
            D40, D41, D42, D43, D44, D45, D46, D47,
            D50, D51, D52, D53, D54, D55, D56, D57,
            D60, D61, D62, D63, D64, D65, D66, D67,
            D70, D71, D72, D73, D74, D75, D76, D77;
            
wire [0:511] E;
                        


//---------instantiations--------------------

// turn input bit vector into internal state matrix
WHIRLPOOL_WCIPHER_MU whirlpool_wcipher_mu 
(
    // outputs
    .B00(A00), .B01(A01), .B02(A02), .B03(A03), .B04(A04), .B05(A05), .B06(A06), .B07(A07),
    .B10(A10), .B11(A11), .B12(A12), .B13(A13), .B14(A14), .B15(A15), .B16(A16), .B17(A17),
    .B20(A20), .B21(A21), .B22(A22), .B23(A23), .B24(A24), .B25(A25), .B26(A26), .B27(A27),
    .B30(A30), .B31(A31), .B32(A32), .B33(A33), .B34(A34), .B35(A35), .B36(A36), .B37(A37),
    .B40(A40), .B41(A41), .B42(A42), .B43(A43), .B44(A44), .B45(A45), .B46(A46), .B47(A47),
    .B50(A50), .B51(A51), .B52(A52), .B53(A53), .B54(A54), .B55(A55), .B56(A56), .B57(A57),
    .B60(A60), .B61(A61), .B62(A62), .B63(A63), .B64(A64), .B65(A65), .B66(A66), .B67(A67),
    .B70(A70), .B71(A71), .B72(A72), .B73(A73), .B74(A74), .B75(A75), .B76(A76), .B77(A77),
    // input
    .A(idata)
);

// Sub-byte operation (Gamma Function)
WHIRLPOOL_WCIPHER_GAMMA whirlpool_wcipher_gamma 
(
    // outputs
    .B00(B00), .B01(B01), .B02(B02), .B03(B03), .B04(B04), .B05(B05), .B06(B06), .B07(B07),
    .B10(B10), .B11(B11), .B12(B12), .B13(B13), .B14(B14), .B15(B15), .B16(B16), .B17(B17),
    .B20(B20), .B21(B21), .B22(B22), .B23(B23), .B24(B24), .B25(B25), .B26(B26), .B27(B27),
    .B30(B30), .B31(B31), .B32(B32), .B33(B33), .B34(B34), .B35(B35), .B36(B36), .B37(B37),
    .B40(B40), .B41(B41), .B42(B42), .B43(B43), .B44(B44), .B45(B45), .B46(B46), .B47(B47),
    .B50(B50), .B51(B51), .B52(B52), .B53(B53), .B54(B54), .B55(B55), .B56(B56), .B57(B57),
    .B60(B60), .B61(B61), .B62(B62), .B63(B63), .B64(B64), .B65(B65), .B66(B66), .B67(B67),
    .B70(B70), .B71(B71), .B72(B72), .B73(B73), .B74(B74), .B75(B75), .B76(B76), .B77(B77),
    // inputs
    .A00(A00), .A01(A01), .A02(A02), .A03(A03), .A04(A04), .A05(A05), .A06(A06), .A07(A07),
    .A10(A10), .A11(A11), .A12(A12), .A13(A13), .A14(A14), .A15(A15), .A16(A16), .A17(A17),
    .A20(A20), .A21(A21), .A22(A22), .A23(A23), .A24(A24), .A25(A25), .A26(A26), .A27(A27),
    .A30(A30), .A31(A31), .A32(A32), .A33(A33), .A34(A34), .A35(A35), .A36(A36), .A37(A37),
    .A40(A40), .A41(A41), .A42(A42), .A43(A43), .A44(A44), .A45(A45), .A46(A46), .A47(A47),
    .A50(A50), .A51(A51), .A52(A52), .A53(A53), .A54(A54), .A55(A55), .A56(A56), .A57(A57),
    .A60(A60), .A61(A61), .A62(A62), .A63(A63), .A64(A64), .A65(A65), .A66(A66), .A67(A67),
    .A70(A70), .A71(A71), .A72(A72), .A73(A73), .A74(A74), .A75(A75), .A76(A76), .A77(A77)
);


// ShiftColumn operation (Pi Function)
WHIRLPOOL_WCIPHER_PI whirlpool_wcipher_pi 
(
    // outputs
    .B00(C00), .B01(C01), .B02(C02), .B03(C03), .B04(C04), .B05(C05), .B06(C06), .B07(C07),
    .B10(C10), .B11(C11), .B12(C12), .B13(C13), .B14(C14), .B15(C15), .B16(C16), .B17(C17),
    .B20(C20), .B21(C21), .B22(C22), .B23(C23), .B24(C24), .B25(C25), .B26(C26), .B27(C27),
    .B30(C30), .B31(C31), .B32(C32), .B33(C33), .B34(C34), .B35(C35), .B36(C36), .B37(C37),
    .B40(C40), .B41(C41), .B42(C42), .B43(C43), .B44(C44), .B45(C45), .B46(C46), .B47(C47),
    .B50(C50), .B51(C51), .B52(C52), .B53(C53), .B54(C54), .B55(C55), .B56(C56), .B57(C57),
    .B60(C60), .B61(C61), .B62(C62), .B63(C63), .B64(C64), .B65(C65), .B66(C66), .B67(C67),
    .B70(C70), .B71(C71), .B72(C72), .B73(C73), .B74(C74), .B75(C75), .B76(C76), .B77(C77),
    // inputs
    .A00(B00), .A01(B01), .A02(B02), .A03(B03), .A04(B04), .A05(B05), .A06(B06), .A07(B07),
    .A10(B10), .A11(B11), .A12(B12), .A13(B13), .A14(B14), .A15(B15), .A16(B16), .A17(B17),
    .A20(B20), .A21(B21), .A22(B22), .A23(B23), .A24(B24), .A25(B25), .A26(B26), .A27(B27),
    .A30(B30), .A31(B31), .A32(B32), .A33(B33), .A34(B34), .A35(B35), .A36(B36), .A37(B37),
    .A40(B40), .A41(B41), .A42(B42), .A43(B43), .A44(B44), .A45(B45), .A46(B46), .A47(B47),
    .A50(B50), .A51(B51), .A52(B52), .A53(B53), .A54(B54), .A55(B55), .A56(B56), .A57(B57),
    .A60(B60), .A61(B61), .A62(B62), .A63(B63), .A64(B64), .A65(B65), .A66(B66), .A67(B67),
    .A70(B70), .A71(B71), .A72(B72), .A73(B73), .A74(B74), .A75(B75), .A76(B76), .A77(B77)
);


// MixRow operation (Theta Function)
WHIRLPOOL_WCIPHER_THETA whirlpool_wcipher_theta 
(
    // outputs
    .B00(D00), .B01(D01), .B02(D02), .B03(D03), .B04(D04), .B05(D05), .B06(D06), .B07(D07),
    .B10(D10), .B11(D11), .B12(D12), .B13(D13), .B14(D14), .B15(D15), .B16(D16), .B17(D17),
    .B20(D20), .B21(D21), .B22(D22), .B23(D23), .B24(D24), .B25(D25), .B26(D26), .B27(D27),
    .B30(D30), .B31(D31), .B32(D32), .B33(D33), .B34(D34), .B35(D35), .B36(D36), .B37(D37),
    .B40(D40), .B41(D41), .B42(D42), .B43(D43), .B44(D44), .B45(D45), .B46(D46), .B47(D47),
    .B50(D50), .B51(D51), .B52(D52), .B53(D53), .B54(D54), .B55(D55), .B56(D56), .B57(D57),
    .B60(D60), .B61(D61), .B62(D62), .B63(D63), .B64(D64), .B65(D65), .B66(D66), .B67(D67),
    .B70(D70), .B71(D71), .B72(D72), .B73(D73), .B74(D74), .B75(D75), .B76(D76), .B77(D77),
    // inputs
    .A00(C00), .A01(C01), .A02(C02), .A03(C03), .A04(C04), .A05(C05), .A06(C06), .A07(C07),
    .A10(C10), .A11(C11), .A12(C12), .A13(C13), .A14(C14), .A15(C15), .A16(C16), .A17(C17),
    .A20(C20), .A21(C21), .A22(C22), .A23(C23), .A24(C24), .A25(C25), .A26(C26), .A27(C27),
    .A30(C30), .A31(C31), .A32(C32), .A33(C33), .A34(C34), .A35(C35), .A36(C36), .A37(C37),
    .A40(C40), .A41(C41), .A42(C42), .A43(C43), .A44(C44), .A45(C45), .A46(C46), .A47(C47),
    .A50(C50), .A51(C51), .A52(C52), .A53(C53), .A54(C54), .A55(C55), .A56(C56), .A57(C57),
    .A60(C60), .A61(C61), .A62(C62), .A63(C63), .A64(C64), .A65(C65), .A66(C66), .A67(C67),
    .A70(C70), .A71(C71), .A72(C72), .A73(C73), .A74(C74), .A75(C75), .A76(C76), .A77(C77)
);


// turn state matrix into bit vector
WHIRLPOOL_WCIPHER_MU_INVERSE whirlpool_wcipher_mu_inverse 
(
    // outputs
    .A(E[0:511]),
    // input
    .B00(D00), .B01(D01), .B02(D02), .B03(D03), .B04(D04), .B05(D05), .B06(D06), .B07(D07),
    .B10(D10), .B11(D11), .B12(D12), .B13(D13), .B14(D14), .B15(D15), .B16(D16), .B17(D17),
    .B20(D20), .B21(D21), .B22(D22), .B23(D23), .B24(D24), .B25(D25), .B26(D26), .B27(D27),
    .B30(D30), .B31(D31), .B32(D32), .B33(D33), .B34(D34), .B35(D35), .B36(D36), .B37(D37),
    .B40(D40), .B41(D41), .B42(D42), .B43(D43), .B44(D44), .B45(D45), .B46(D46), .B47(D47),
    .B50(D50), .B51(D51), .B52(D52), .B53(D53), .B54(D54), .B55(D55), .B56(D56), .B57(D57),
    .B60(D60), .B61(D61), .B62(D62), .B63(D63), .B64(D64), .B65(D65), .B66(D66), .B67(D67),
    .B70(D70), .B71(D71), .B72(D72), .B73(D73), .B74(D74), .B75(D75), .B76(D76), .B77(D77)
);

//---------combinational processes----------

// Add round key operation (sigma function)
assign odata[0:511] = E[0:511] ^ subkey[0:511];


endmodule
