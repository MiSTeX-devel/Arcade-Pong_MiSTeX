/*
  MIT License

  Copyright (c) 2019 Richard Eng

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
*/

/*
  Pong - Ball Horizontal Direction Circuit
  ----------------------------------------
*/
`default_nettype none

module ball_horizontal_direction
(
    input wire move, _hit2, sc, attract, _hit1,
    output wire l, r, aa, ba
);

wire c1d_to_d1a;
ls00 c1d(sc, attract, c1d_to_d1a);

wire d1a_to_h3b;
ls04 d1a(c1d_to_d1a, d1a_to_h3b);

ls74 h3b(d1a_to_h3b, r, _hit1, _hit2, l, r);

wire h4d_to_h4c;
ls00 h4d(move, l, h4d_to_h4c);
ls00 h4b(move, r, ba);
ls00 h4c(h4d_to_h4c, ba, aa);

endmodule
`default_nettype wire
