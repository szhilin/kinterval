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
## @defop Method {@@kinterval} horzcat (@var{ARRAY1}, @var{ARRAY2}, @dots{})
## @defopx Operator {@@kinterval} {[@var{ARRAY1}, @var{ARRAY2}, @dots{}]}
## 
## Return the horizontal concatenation of interval array objects along
## dimension 2.
## 
## @example
## @group
## a = kinterval (2, 5);
## [a, a, a]
##   @result{} ans = 1×3 interval vector
##      [2, 5]   [2, 5]   [2, 5]
## @end group
## @end example
## @seealso{@@kinterval/vertcat}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-29

function result = horzcat (varargin)

  result = cat (2, varargin{:});

endfunction

%!assert (horzcat (kinterval (1), kinterval (2)) == kinterval (horzcat (1, 2)));
%!test
%! a = kinterval (2, 5);
%! assert (horzcat (a, a, a) == kinterval ([2, 2, 2], [5, 5, 5]));

