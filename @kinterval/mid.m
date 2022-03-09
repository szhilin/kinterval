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
## @defmethod {@@kinterval} mid (@var{X})
##
## Get the midpoint of Kaucher interval @var{X}.
##
## @example
## @group
## mid (kinterval (2.5, 3.5))
##   @result{} ans = 3
## @end group
## @end example
## @seealso{@@kinterval/inf, @@kinterval/sup, @@kinterval/rad}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = mid(x)
  if (nargin ~= 1)
    print_usage ();
    return
  endif

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif

  z = x ./ 2;
  result = z.inf + z.sup;
endfunction

%!assert (mid (kinterval (2.5, 3.5)), 3);
