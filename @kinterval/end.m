## Copyright 2017 Joel Dahne
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
## @defmethod {@@kinterval} end (@var{A}, @var{k}, @var{n})
##
## The magic index @code{end} refers to the last valid entry in an indexing
## operation.
##
## For @var{n} = 1 the output of the indexing operation is a column vector and a
## single index is used to address all entries in column-first order.  For
## @var{n} > 1 the @var{k}'th dimension is addressed separately.
##
## @example
## @group
## A = kinterval ([1 2 3; 4 5 6]);
## A(1, end)
##   @result{} ans =  [3,3]
## A(end, 1)
##   @result{} ans =  [4,4]
## A(end)
##   @result{} ans =  [6,6]
## @end group
## @end example
## @seealso{@@kinterval/size, @@kinterval/length, @@kinterval/numel, @@kinterval/rows, @@kinterval/columns}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function ret = end (a, k, n)

  if (n == k)
    ret = prod (size (a.inf)(n:ndims (a.inf)));
  else
    ret = size (a.inf, k);
  endif

endfunction

%!assert (kinterval (magic (3))(end) == 2);
%!assert (kinterval (magic (3))(end, 2) == 9);
%!assert (kinterval (magic (3))(2, end) == 7);
%!assert (kinterval ([1 2; 3 4; 5 6])(end:-1:1, :) == [5 6; 3 4; 1 2]);
%!assert (reshape (kinterval (1:24), 2, 3, 4)(end, end) == 24)
