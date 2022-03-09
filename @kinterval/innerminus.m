## Copyright 2020-2022 Sergei Zhilin
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
## @defmethod Method {@@kinterval} innerminus (@var{X}, @var{Y})
##
## Compute inner subtraction for Kaucher intervals @var{Y} and @var{X}.
##
## @example
## @group
## x = kinterval (2, 3);
## y = kinterval (1, 2);
## innerminus (x, y)
##   @result{} ans = [1, 1]
## x - y
##   @result{} ans = [0, 2]
## @end group
## @end example
## @seealso{@@kinterval/minus,@@kinterval/plus}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function z = innerminus (x, y)
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif

  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif

  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  zinf = x.inf - y.inf;
  zsup = x.sup - y.sup;

  z = kinterval (zinf, zsup);
endfunction
