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
## @defmethod {@@kinterval} or (@var{X}, @var{Y})
##
## Compute the least lower bound (supremum) of two Kaucher intervals 
## (interval matricies) with respect to inclusion.
##
## @example
## @group
## or (kinterval (1, 2), kinterval (3, 4))
##   @result{} ans = 2
## @end group
## @end example
## @seealso{@@kinterval/or, @@kinterval/abs, @@kinterval/mag}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = or(x, y)
  if (nargin ~= 2)
    print_usage ();
    return
  endif

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif

  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  result = kinterval (min(x.inf, y.inf), max(x.sup, y.sup));
endfunction

# TODO: test for OR (least lower bound) of two Kaucher intervals