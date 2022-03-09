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
## @defop Method {@@kinterval} transpose (@var{X})
## @defopx Operator {@@kinterval} {@var{X}.'}
##
## Return the transpose of Kaucher interval matrix or vector @var{X}.
##
## @example
## @group
## kinterval (zeros (1, 3), ones (1, 3)) .'
##   @result{} ans = 
##      [0,1]
##      [0,1]
##      [0,1]
## @end group
## @end example
## @seealso{@@kinterval/ctranspose}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-17

function x = transpose (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  x.inf = transpose (x.inf);
  x.sup = transpose (x.sup);

endfunction

%!assert (transpose (kinterval (magic (3))) == kinterval (magic (3).'));

%!# from the documentation string
%!assert (transpose (kinterval (zeros (1, 3), ones (1, 3))) == kinterval (zeros (3, 1), ones (3, 1)));
