## Copyright 2015-2016 Oliver Heimlich
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
## @defmethod {@@kinterval} isvector (@var{A})
##
## Return true if @var{A} is a Kaucher interval vector.
##
## Scalars (1x1 vectors) are subsets of the more general vector and
## @code{isvector} will return true for these objects as well.
## @seealso{@@kinterval/isscalar, @@kinterval/ismatrix}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

## FIXME This function is only required, because of regression #44498

function result = isvector (A)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = isvector (A.inf);

endfunction

%!assert (not (isvector (kinterval ([]))));
%!assert (isvector (kinterval (0)));
%!assert (isvector (kinterval (zeros (1, 2))));
%!assert (isvector (kinterval (zeros (2, 1))));
%!assert (not (isvector (kinterval (zeros (5)))));
