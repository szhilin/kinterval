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
## @defmethod {@@kinterval} ismatrix (@var{A})
##
## Return true if @var{A} is a 2-D interval array.
##
## @seealso{@@kinterval/isscalar, @@kinterval/isvector}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

## FIXME: One happy day this function can be removed, because bug #42422 has
## been solved with GNU Octave 4.0.
function result = ismatrix (A)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = ismatrix (A.inf);

endfunction

%!assert (ismatrix (kinterval ([])));
%!assert (ismatrix (kinterval (0)));
%!assert (ismatrix (kinterval (zeros (3, 1))));
%!assert (ismatrix (kinterval (zeros (1, 4))));
%!assert (ismatrix (kinterval (zeros (3, 4))));
