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
## @deftypemethod {@@kinterval} {@var{R} =} rad (@var{X})
## @deftypemethodx {@@kinterval} {[@var{M}, @var{R}] =} rad (@var{X})
##
## Get the radius (and midpoint) of Kaucher interval @var{X}.
##
## With two output parameters the midpoint and radius are computed.
##
## @example
## @group
## rad (kinterval (2.5, 3.5))
##   @result{} ans = 0.50000
## @end group
## @end example
## @seealso{@@kinterval/inf, @@kinterval/sup, @@kinterval/mid, @@kinterval/wid}
## @end deftypemethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-24

function [out1, out2] = rad (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  m = mid (x);
  ## The midpoint is rounded to nearest and the radius must cover both boundaries
  #r1 = mpfr_function_d ('minus', +inf, m, x.inf);
  #r2 = mpfr_function_d ('minus', +inf, x.sup, m);
  r1 = abs(m - x.inf);
  r2 = abs(x.sup - m);
  r = max (r1, r2);

  #r (isempty (x)) = nan ();

  if (nargout >= 2)
    out1 = m;
    out2 = r;
  else
    out1 = r;
  endif

endfunction

%!test;
%! [m, r] = rad (kinterval (2.5, 3.5));
%! assert (m, 3);
%! assert (r, .5);

%!# from the documentation string
%!assert (rad (kinterval (2.5, 3.5)), .5);