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
## @defmethod {@@kinterval} pro (@var{X})
##
## Compute the proper projection interval for Kaucher interval @var{X}.
##
## @example
## @group
## x = kinterval (1, -1)
## y = pro (x)
##   @result{} y = 
##   [-1,1]
## z = pro(y)
##   @result{} z = 
##   [-1,1]
## @end group
## @end example
## @seealso{@@kinterval/pro}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-24

function result = pro(x)
  if (nargin ~= 1)
    print_usage ();
    return
  endif

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  
  zinf = min(x.inf, x.sup);
  zsup = max(x.inf, x.sup);

  result = kinterval(zinf, zsup);
endfunction

%!assert (pro( kinterval (1, -1)) == kinterval (-1,1));
%!assert (pro( kinterval (-1, 1)) == kinterval (-1,1));
