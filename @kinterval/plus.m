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
## @defop Method {@@kinterval} plus (@var{X}, @var{Y})
## @defopx Operator {@@kinterval} {@var{X} + @var{Y}}
##
## Add all numbers of interval @var{X} to all numbers of @var{Y}.
##
## @example
## @group
## x = kinterval (2, 3);
## y = kinterval (1, 2);
## x + y
##   @result{} ans = [3, 5]
## @end group
## @end example
## @seealso{@@kinterval/minus}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-31

function result = plus (x, y)
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif
  
  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  result = kinterval (x.inf + y.inf, x.sup + y.sup);
endfunction

%!assert (kinterval (2, 3) + kinterval (1, 2) == kinterval (3, 5));
%!assert (kinterval (2, -3) + kinterval (1, 2) == kinterval (3, -1));