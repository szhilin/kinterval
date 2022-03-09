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
## @defop Method {@@kinterval} gt (@var{A}, @var{B})
## @defopx Operator {@@kinterval} {@var{A} > @var{B}}
##
## Compare intervals @var{A} and @var{B} for strict greater.
##
## Evaluated on interval arrays, this functions is applied element-wise.
##
## @seealso{@@kinterval/eq, @@kinterval/lt, @@kinterval/ge}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-29

function result = gt (a, b)

  if (nargin ~= 2)
    print_usage ();
    return
  endif

  result = lt (b, a);

endfunction

%!assert (not (gt (kinterval (2, 3), kinterval (1, 3))));
%!assert (gt (kinterval (2, 3.1), kinterval (1, 3)));
%!assert (gt (kinterval (5, 3), kinterval (1, 2)));
