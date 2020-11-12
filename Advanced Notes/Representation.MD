# IEEE 32bit Floating Representation

## Example 01 : -7.75<sub>10</sub>

 - Determine sign => **Negative**
 - Convert to binary => **-0111.11<sub>2</sub>**
 - Normalized scientific notation => **1.1111x<sup>2</sup>**
 - Compute biased exponent and convert to binary => **2<sub>10</sub> + 127<sub>10</sub> = 129<sub>10</sub> = 10000001<sub>2</sub>**
 - Write components in binary =>\
   **Sign : 1**\
   **Exponent : 10000001**\
   **Mantissa : 11110000000000000000000**
 - Convert to hex => **C 0 F 8 0 0 0 0**
 - Final result => **C0F80000<sub>16</sub>**

## Example 02 : 41440000<sub>16<sub>

 - Convert to binary => **0100 0001 01010 0100 0000 0000 0000 0000<sub>2<sub>**
 - Split into components => **0 10000010 10001000000000000000000<sub>2<sub>**
 - Determine exponent => **100000010<sub>2<sub> = 130<sub>10<sub>**
 - Remove bias => **130<sub>10<sub> - 127<sub>10<sub> = 3<sub>10<sub>**
 - Determine sign => **Positive**
 - Final Result => **+1.10001x2<sup>3</sup> = +1100.01 = +12.25**

# IEEE 64bit Representation
