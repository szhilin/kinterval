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
## @defmethod {@@kinterval} isrow (@var{A})
##
## Return true if @var{A} is an interval row vector.
##
## @seealso{@@kinterval/isvector, @@kinterval/iscolumn}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

## FIXME This function is only required, because of a regression in octave 4.0

function result = isrow (A)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = isrow (A.inf);

endfunction

%!assert (not (isrow (kinterval ([]))));
%!assert (isrow (kinterval (0)));
%!assert (isrow (kinterval (zeros (1, 2))));
%!assert (not (isrow (kinterval (zeros (2, 1)))));
%!assert (not (isrow (kinterval (zeros (5)))));
