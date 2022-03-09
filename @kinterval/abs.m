## Copyright 2014-2017 Oliver Heimlich
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
## @defmethod {@@kinterval} abs (@var{X})
##
## Compute the absolute value of Kaucher interval.
##
## @example
## @group
## abs (kinterval (2.5, 3.5))
##   @result{} ans = 3.5
## abs (kinterval (-5.5, 1.5))
##   @result{} ans = 5.5
## @end group
## @end example
## @seealso{@@kinterval/mag}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-27

function result = abs(x)
  if (nargin ~= 1)
    print_usage ();
    return
  endif

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif

  result = max(abs(x.inf), abs(x.sup));
endfunction

# TODO: tests for absolute value of Kaucher interval