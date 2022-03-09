## Copyright 2014-2016 Oliver Heimlich
## Copyright 2017 Joel Dahne
## Copyright 2020-20 Sergei Zhilin
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
## @defmethod {@@kinterval} sum (@var{X})
## @defmethodx {@@kinterval} sum (@var{X}, @var{DIM})
##
## Sum of elements along dimension @var{DIM}.  If @var{DIM} is omitted, it
## defaults to the first non-singleton dimension.
##
## @example
## @group
## sum ([kinterval(1,-1), kinterval(3,4)  -1])
##   @result{} ans = [3,2]
## @end group
## @end example
## @seealso{@@kinterval/plus, @@kinterval/prod}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kacher interval
## Created: 2020-10-18

function result = sum (x, dim)
    
  if (nargin > 2)
    print_usage ();
    return
  endif
  
  if (nargin < 2)
    ## Try to find non-singleton dimension
    dim = find (size (x.inf) ~= 1, 1);
    if (isempty (dim))
      dim = 1;
    endif
  endif

  ## Short-circuit
  if (size (x.inf, dim) == 1)
    result = x;
    return
  endif
  
  zinf = sum (x.inf, dim);
  zsup = sum(x.sup, dim);

  result = kinterval(zinf, zsup);

endfunction
