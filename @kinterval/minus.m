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
## @defop Method {@@kinterval} minus (@var{X}, @var{Y})
## @defopx Operator {@@kinterval} {@var{X} - @var{Y}}
##
## Subtract all numbers of interval @var{Y} from all numbers of @var{X}.
##
## @example
## @group
## x = kinterval (2, 3);
## y = kinterval (1, 2);
## x - y
##   @result{} ans = [0, 2]
## @end group
## @end example
## @seealso{@@kinterval/plus}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = minus (x, y)
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif

  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif

  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  result = kinterval (x.inf - y.sup, x.sup - y.inf);
endfunction

%!assert (kinterval (2, 3) - kinterval (1, 2) == kinterval (0, 2));
%!assert (kinterval (2, -3) - kinterval (1, 2) == kinterval (0, -4));
