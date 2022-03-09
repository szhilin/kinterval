## Copyright 2015-2016 Oliver Heimlich
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
## @defmethod {@@kinterval} cat (@var{DIM}, @var{ARRAY1}, @var{ARRAY2}, @dots{})
##
## Return the concatenation of N-D interval arrays @var{ARRAY1}, @var{ARRAY2},
## … along dimension @var{DIM}.
##
## @example
## @group
## cat (2, kinterval (magic (3)), kinterval (pascal (3)))
##   @result{} 3×6 Kaucher interval matrix
##
##      [8]   [1]   [6]   [1]   [1]   [1]
##      [3]   [5]   [7]   [1]   [2]   [3]
##      [4]   [9]   [2]   [1]   [3]   [6]
## @end group
## @end example
## @seealso{@@kinterval/horzcat, @@kinterval/vertcat}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-28

function result = cat (dim, varargin)

  if (isa (dim, "kinterval"))
    print_usage ();
    return
  endif

  ## Conversion of non-interval parameters to intervals
  interval_idx = cellfun ("isclass", varargin, "kinterval");
  to_convert_idx = not (interval_idx);
  varargin(to_convert_idx) = cellfun (@kinterval, ...
                                      varargin(to_convert_idx), ...
                                      "UniformOutput", false);

  ## Stack intervals along dimension dim
  s = cellfun ("struct", varargin); # struct array
  result = kinterval ();
  result.inf = cat (dim, s.inf);
  result.sup = cat (dim, s.sup);

endfunction

%!assert (size (cat (1, kinterval ([]), kinterval ([]))), [0 0]);
%!assert (cat (1, kinterval (1), kinterval (2)) == kinterval (cat (1, 1, 2)));
%!assert (cat (2, kinterval (1), kinterval (2)) == kinterval (cat (2, 1, 2)));
%!assert (cat (5, kinterval (1), kinterval (2)) == kinterval (cat (5, 1, 2)));
%!assert (cat (1, kinterval (zeros (2, 2, 2)), kinterval (ones (2, 2, 2))) == kinterval (cat (1, zeros (2, 2, 2), ones (2, 2, 2))));
