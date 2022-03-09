## Copyright 2014-2016 Oliver Heimlich
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
## @defmethod {@@kinterval} ndims (@var{A})
##
## Return the number of dimensions of @var{A}.
##
## For any array, the result will always be larger than or equal to 2.
## Trailing singleton dimensions are not counted.
## @seealso{@@kinterval/length, @@kinterval/numel, @@kinterval/size, @@kinterval/rows, @@kinterval/columns}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

function result = ndims (a)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = ndims (a.inf);

endfunction

%!assert (ndims (kinterval ([])), 2);
%!assert (ndims (kinterval (0)), 2);
%!assert (ndims (kinterval (magic (3))), 2);
