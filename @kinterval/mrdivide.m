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
## @defop Method {@@kinterval} mrdivide (@var{X}, @var{Y})
## @defopx Operator {@@kinterval} {@var{X} / @var{Y}}
##
## Return the Kaucher interval matrix right division of @var{X} and @var{Y}.
##
## @seealso{@@kinterval/mtimes}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = mrdivide(x, y)
 
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif

  if (isscalar (x) || isscalar (y))
      result = rdivide(x, y);
      return
  endif

  [xrows, xcols] = size(x.inf);
  [yrows, ycols] = size(y.inf);
  if  ndims(x.inf) > 2 || ndims(y.inf) > 2 || xcols ~= yrows 
    error("wrong dimensions");
  endif

  error('matrix right division is not implemented yet');

endfunction

# TODO: example for Kaucher interval matrix right division
# TODO: tests for Kaucher interval matrix right division