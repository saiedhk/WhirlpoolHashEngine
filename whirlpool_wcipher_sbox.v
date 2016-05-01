//======================================================================
//
// Module Name:    WHIRLPOOL_WCIPHER_SBOX
// Description:    SBox function of Whirlpool W-Cipher
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

// Sub-byte operation (a purely combinational module)
module WHIRLPOOL_WCIPHER_SBOX (
        output reg [7:0 ] odata,   
        input      [7:0 ] idata
);

//---------wires, registers----------

reg  [3:0] a, b, d;
wire [3:0] c, g, h;

//---------combinational processes----------

// E-inverse mini-box
always @*
begin
    case (idata[3:0])
        4'h0: a = 4'hF;
        4'h1: a = 4'h0;
        4'h2: a = 4'hD;
        4'h3: a = 4'h7;
        4'h4: a = 4'hB;
        4'h5: a = 4'hE;
        4'h6: a = 4'h5;
        4'h7: a = 4'hA;
        4'h8: a = 4'h9;
        4'h9: a = 4'h2;
        4'hA: a = 4'hC;
        4'hB: a = 4'h1;
        4'hC: a = 4'h3;
        4'hD: a = 4'h4;
        4'hE: a = 4'h8;
        4'hF: a = 4'h6;
    endcase
end


// E mini-box
always @*
begin
    case (idata[7:4])
        4'h0: b = 4'h1;
        4'h1: b = 4'hB;
        4'h2: b = 4'h9;
        4'h3: b = 4'hC;
        4'h4: b = 4'hD;
        4'h5: b = 4'h6;
        4'h6: b = 4'hF;
        4'h7: b = 4'h3;
        4'h8: b = 4'hE;
        4'h9: b = 4'h8;
        4'hA: b = 4'h7;
        4'hB: b = 4'h4;
        4'hC: b = 4'hA;
        4'hD: b = 4'h2;
        4'hE: b = 4'h5;
        4'hF: b = 4'h0;
    endcase
end
    

// R mini-box
always @*
begin
    case (c[3:0])
        4'h0: d = 4'h7;
        4'h1: d = 4'hC;
        4'h2: d = 4'hB;
        4'h3: d = 4'hD;
        4'h4: d = 4'hE;
        4'h5: d = 4'h4;
        4'h6: d = 4'h9;
        4'h7: d = 4'hF;
        4'h8: d = 4'h6;
        4'h9: d = 4'h3;
        4'hA: d = 4'h8;
        4'hB: d = 4'hA;
        4'hC: d = 4'h2;
        4'hD: d = 4'h5;
        4'hE: d = 4'h1;
        4'hF: d = 4'h0;
    endcase
end


assign c[3:0] = { a[3]^b[3] , a[2]^b[2] , a[1]^b[1] , a[0]^b[0] };    
assign g[3:0] = { a[3]^d[3] , a[2]^d[2] , a[1]^d[1] , a[0]^d[0] };    
assign h[3:0] = { d[3]^b[3] , d[2]^b[2] , d[1]^b[1] , d[0]^b[0] };    


// E-inverse mini-box
always @*
begin
    case (g[3:0])
        4'h0: odata[3:0] = 4'hF;
        4'h1: odata[3:0] = 4'h0;
        4'h2: odata[3:0] = 4'hD;
        4'h3: odata[3:0] = 4'h7;
        4'h4: odata[3:0] = 4'hB;
        4'h5: odata[3:0] = 4'hE;
        4'h6: odata[3:0] = 4'h5;
        4'h7: odata[3:0] = 4'hA;
        4'h8: odata[3:0] = 4'h9;
        4'h9: odata[3:0] = 4'h2;
        4'hA: odata[3:0] = 4'hC;
        4'hB: odata[3:0] = 4'h1;
        4'hC: odata[3:0] = 4'h3;
        4'hD: odata[3:0] = 4'h4;
        4'hE: odata[3:0] = 4'h8;
        4'hF: odata[3:0] = 4'h6;
    endcase
end


// E mini-box
always @*
begin
    case (h[3:0])
        4'h0: odata[7:4] = 4'h1;
        4'h1: odata[7:4] = 4'hB;
        4'h2: odata[7:4] = 4'h9;
        4'h3: odata[7:4] = 4'hC;
        4'h4: odata[7:4] = 4'hD;
        4'h5: odata[7:4] = 4'h6;
        4'h6: odata[7:4] = 4'hF;
        4'h7: odata[7:4] = 4'h3;
        4'h8: odata[7:4] = 4'hE;
        4'h9: odata[7:4] = 4'h8;
        4'hA: odata[7:4] = 4'h7;
        4'hB: odata[7:4] = 4'h4;
        4'hC: odata[7:4] = 4'hA;
        4'hD: odata[7:4] = 4'h2;
        4'hE: odata[7:4] = 4'h5;
        4'hF: odata[7:4] = 4'h0;
    endcase
end


endmodule
