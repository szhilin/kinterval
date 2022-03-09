## Copyright 2014-2016 Oliver Heimlich
## Copyright 2020 Sergei Zhilin
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @documentencoding UTF-8
## @defop Method {@@kinterval} mtimes (@var{X}, @var{Y})
## @defopx Operator {@@kinterval} {@var{X} * @var{Y}}
##
## Compute Kaucher interval matrix multiplication.
##
## @example
## @group
## x = kinterval ([1, 2; 7, 15], [2, 2; 7.5, 15]);
## y = kinterval ([3, 3; 0, 1], [3, 3.25; 0, 2]);
## x * y
##   @result{} ans = 
##      [3,6]      [5,10.5]
##      [21,22.5]  [36,54.375]
## @end group
## @end example
## @seealso{@@kinterval/mrdivide}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-31

function result = mtimes(x, y)

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif

  if (isscalar (x) || isscalar (y))
      result = times (x, y);
      return
  endif

  [xrows, xcols] = size(x.inf);
  [yrows, ycols] = size(y.inf);
  if  ndims(x.inf) > 2 || ndims(y.inf) > 2 || xcols ~= yrows
    error("wrong dimensions");
  endif

  zinf = zeros(xrows,ycols);
  zsup = zinf;

  for i = 1:xrows
      for j = 1: ycols
          ridx.type = "()"; 
          ridx.subs = {i,":"};
          r = subsref(x,ridx);

          cidx.type = "()"; 
          cidx.subs = {":",j};
          c = subsref(y,cidx);

          p = r .* c';

          zinf(i,j) = sum(p.inf);
          zsup(i,j) = sum(p.sup);
      endfor
  endfor

  result = kinterval(zinf, zsup);
endfunction

# TODO: tests for Kaucher interval matrix multiplication 