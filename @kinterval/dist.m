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
## @defmethod {@@kinterval} dist (@var{X}, @var{Y})
## 
## Compute distance between Kaucher intervals @var{X} and @var{Y} (scalar or matrix).
## 
## @example
## @group
## dist (3.6, kinterval (3, 5))
##   @result{} ans = 1.4000
## @end group
## @group
## @end example
## @example
## @group
## dist( kinterval (1,2), kinterval (1,-1))
##   @result{} ans = 3
## @end group
## @end example
## @example
## @group
## A = [kinterval(1,2) kinterval(4,3); kinterval(0,1) kinterval(-1,-3)]
##   @result{} M = 
##      [1,2]  [4,3]
##      [0,1]  [-1,-3]
## B = [kinterval(2,2) kinterval(-1,1); kinterval(1,-1) kinterval(1,3)]
##   @result{} M = 
##      [2,2]  [-1,1]
##      [1,-1]  [1,3]
## dist(A,B)
##   @result{} ans = 
##      1   5
##      2   6
## @end group
## @end example
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-28

function result = dist(x,y)
    if (not (isa (x, "kinterval")))
        x = kinterval (x);
    endif
    if (not (isa (y, "kinterval")))
        y = kinterval (y);
    endif
    result = abs(innerminus(x,y));
endfunction

%!assert (dist (3.6, kinterval (3, 5)) == 1.4);
%!assert (dist (kinterval (3, 5), kinterval (5,3)) == 2);
