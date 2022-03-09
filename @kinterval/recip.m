## Copyright 2014-2016 Oliver Heimlich
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
## @defmethod {@@kinterval} recip (@var{X})
##
## Compute the reciprocal for Kaucher interval @var{X}.
##
## @example
## @group
## inv (kinterval (1,2))
##   @result{} ans = [0.5,1]
## @end group
## @end example
## @seealso{@@kinterval/inv}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-24

function result = recip(x)
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif

  if iszeroin(pro(x))
    error ('wrong division, pro(x) contains zero');
  else
    result = kinterval(1./x.sup, 1./x.inf);
  endif
endfunction
