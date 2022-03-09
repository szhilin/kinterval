## Copyright 2020-2021 Sergei Zhilin
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
## @defmethod {@@kinterval} opp (@var{X})
##
## Get the opposite interval for Kaucher interval @var{X}.
##
## @example
## @group
## opp (kinterval (3, -5))
##   @result{} ans = [-3,5]
## @end group
## @end example
## @seealso{@@kinterval/uminus, @@kinterval/innerminus, @@kinterval/minus, @@kinterval/plus}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-17

function result = opp(x)
  if (nargin ~= 1)
    print_usage ();
    return
  endif
  
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  
  result = kinterval(-x.inf, -x.sup);
endfunction

%!assert (opp( kinterval (3, -5) ) == kinterval (-3, 5));
%!assert (opp( kinterval (0, 0) ) == kinterval (-0, -0));