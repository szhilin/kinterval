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
## @defop Method {@@kinterval} ctranspose (@var{X})
## @defopx Operator {@@kinterval} {@var{X}'}
##
## Return the complex conjugate transpose of @var{X}.
##
## Since Kaucher intervals are only defined for real numbers,
## this function and @code{transpose} are equivalent.
##
## @seealso{@@kinterval/transpose}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function result = ctranspose (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = transpose (x);

endfunction

