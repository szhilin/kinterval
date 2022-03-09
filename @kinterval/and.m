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
## @defmethod {@@kinterval} and (@var{X}, @var{Y})
##
## Compute the greatest lower bound (infimum) of two Kaucher intervals 
## (interval matricies) with respect to inclusion.
##
## @example
## @group
## and (kinterval (1, 2), kinterval (3, 4))
##   @result{} ans = [2,4]
## @end group
## @end example
## @seealso{@@kinterval/and, @@kinterval/abs, @@kinterval/mag}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = and(x, y)
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
  
  result = kinterval (max(x.inf, y.inf), min(x.sup, y.sup));
endfunction

%!assert (kinterval (1, 2) .* kinterval (3, 4) == kinterval (2, 4));