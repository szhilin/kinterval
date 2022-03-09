## Copyright 2014-2016 Oliver Heimlich
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
## @deftypemethod {@@kinterval} {@var{SZ} =} size (@var{A})
## @deftypemethodx {@@kinterval} {@var{DIM_SZ} =} size (@var{A}, @var{DIM})
## @deftypemethodx {@@kinterval} {[@var{ROWS, COLS, ..., DIM_N_SZ}] =} size (...)
## 
## Return a row vector with the size (number of elements) of each
## dimension for the Kaucher interval array @var{A}.
## 
## When given a second argument, @var{DIM}, return the size of the
## corresponding dimension.
## 
## With a single output argument, @command{size} returns a row vector.  When
## called with multiple output arguments, @command{size} returns the size of
## dimension N in the Nth argument.  The number of rows, dimension 1,
## is returned in the first argument, the number of columns, dimension
## 2, is returned in the second argument, etc.  If there are more
## dimensions in A then there are output arguments, @command{size} returns the
## total number of elements in the remaining dimensions in the final
## output argument.
## 
## @seealso{@@infsup/length, @@kinterval/numel, @@kinterval/rows, @@kinterval/columns, @@kinterval/end}
## @end deftypemethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2014-10-25

function varargout = size (a, dim)

  if (nargin == 0 || nargin > 2)
    print_usage ();
    return
  endif

  if (nargin == 1)
     varargout = cell (1, max (1, nargout));
     [varargout{:}] = size (a.inf);
  else
     if (nargout > 1)
       print_usage ();
       return
     endif
     varargout{1} = size (a.inf, dim);
  endif

endfunction

%!assert (size (kinterval (zeros (3, 4))), [3 4]);
%!assert (size (kinterval (zeros (2, 3, 4))), [2, 3, 4]);
%!test
%! [x y z] = size (kinterval (magic (3)));
%! assert (x, 3);
%! assert (y, 3);
%! assert (z, 1);
