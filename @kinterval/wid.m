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
## @defmethod {@@kinterval} wid (@var{X})
##
## Get the width of Kaucher interval @var{X}.
##
## @example
## @group
## wid (kinterval (2.5, 3.5))
##   @result{} ans = 1
## @end group
## @end example
## @seealso{@@kinterval/inf, @@kinterval/sup, @@kinterval/rad}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-27

function result = wid (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  #result = mpfr_function_d ('minus', +inf, x.sup, x.inf);
  #result(x.inf > x.sup) = nan ();

  result = abs(x.sup - x.inf);

endfunction

%!# from the documentation string
%!assert (wid (kinterval (2.5, 3.5)), 1);
%!assert (wid (kinterval (3.5, 2.5)), 1);
