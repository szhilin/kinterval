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
## @defmethod {@@kinterval} isscalar (@var{A})
##
## Return true if @var{A} is an Kaucher interval scalar.
##
## Scalars (1x1 matrices) are subsets of the more general vector or matrix and
## @code{isvector} and @code{ismatrix} will return true for these objects as
## well.
## @seealso{@@kinterval/isvector, @@kinterval/ismatrix}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-17

## FIXME This function is only required, because of bug #43925

function result = isscalar (A)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = isscalar (A.inf);

endfunction
