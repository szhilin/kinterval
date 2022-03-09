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
## @defop Method {@@kinterval} uminus (@var{X})
## @defopx Operator {@@kinterval} {-@var{X}}
##
## Negate all numbers in the interval.
##
## @example
## @group
## x = kinterval (2, 3);
## -x
##   @result{} ans = [-2, -3]
## @end group
## @end example
## @seealso{@@kinterval/uplus}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-18

function x = uminus (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  [x.inf, x.sup] = deal (-x.sup, -x.inf);

endfunction

%!# from the documentation string
%!assert (-kinterval (2, 3) == kinterval (-3, -2));
