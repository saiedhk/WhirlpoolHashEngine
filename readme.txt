/**********************************************************************

   Project: WHIRLPOOL Hash Function

   Language: Verilog 2001
   Author: Saied H. Khayat
   Date:   March 2011
   URL: https://github.com/saiedhk
   
   Copyright Notice: Free use of this library is permitted under the
   guidelines and in accordance with the MIT License (MIT).
   http://opensource.org/licenses/MIT

   The MIT License (MIT)

   Copyright (c) 2016 Saied Hosseini Khayat
   
   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.

**********************************************************************/

Project Description

This project present a Verilog implementation of a single round (the main datapath) of the
WHIRLPOOL hash function. It contains the following hierarchy of Verilog module.

WHIRLPOOL_WCIPHER_ROUND
    WHIRLPOOL_WCIPHER_PI
    WHIRLPOOL_WCIPHER_MU
    WHIRLPOOL_WCIPHER_THETA
    WHIRLPOOL_WCIPHER_MU_INVERSE
    WHIRLPOOL_WCIPHER_GAMMA
        WHIRLPOOL_WCIPHER_SBOX

WHIRLPOOL is a cryptographic hash function, which was designed by Vincent Rijmen (co-creator 
of the Advanced Encryption Standard) and Paulo S. L. M. Barreto, in 2000. The hash has been 
recommended by the NESSIE project. It has also been adopted by the International Organization 
for Standardization (ISO). It is free of patent rights.

WHIRLPOOL is a hash based on Miyaguchi-Preneel construction. It takes a message of any length 
less than 2^256 bits and returns a 512-bit message digest. For a detailed definition of WHIRLPOOL, 
refer to  http://www.larc.usp.br/~pbarreto/WhirlpoolPage.html

This source code is written in synthesizable Verilog and it was verified against some known 
input-output bit vectors. However, the author would appreciate any bug reports.

        