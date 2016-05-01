# WhirlpoolHashEngine
WHIRLPOOL Hash Engine in Verilog

This Github project presents a Verilog implementation of a single round (the main datapath) of the
WHIRLPOOL hash function. 

WHIRLPOOL is a cryptographic hash function, which was designed by Vincent Rijmen (co-creator 
of the Advanced Encryption Standard) and Paulo S. L. M. Barreto, in 2000. The hash has been 
recommended by the NESSIE project. It has also been adopted by the International Organization 
for Standardization (ISO). It is free of patent rights.

WHIRLPOOL is a hash based on Miyaguchi-Preneel construction. It takes a message of any length 
less than 2^256 bits and returns a 512-bit message digest. For a detailed definition of WHIRLPOOL, 
refer to  http://www.larc.usp.br/~pbarreto/WhirlpoolPage.html

This source code is written in synthesizable Verilog and it was verified against some known 
input-output bit vectors. However, the author would appreciate any bug reports.
