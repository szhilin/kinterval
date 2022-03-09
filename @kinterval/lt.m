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
## @defop Method {@@kinterval} lt (@var{A}, @var{B})
## @defopx Operator {@@kinterval} {@var{A} < @var{B}}
##
## Compare intervals @var{A} and @var{B} for strictly less.
##
## Evaluated on interval arrays, this functions is applied element-wise.
##
## @seealso{@@kinterval/eq, @@kinterval/le, @@kinterval/gt, @@kinterval/subset, @@kinterval/interior, @@kinterval/disjoint}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-29

function result = lt (a, b)

  if (nargin ~= 2)
    print_usage ();
    return
  endif
  if (not (isa (a, "kinterval")))
    a = kinterval (a);
  endif
  if (not (isa (b, "kinterval")))
    b = kinterval (b);
  endif

  result = a.inf < b.inf & a.sup < b.sup;

endfunction

%!assert (not (lt (kinterval (1, 3), kinterval (3))));
%!assert (lt (kinterval (1, 3), kinterval (3.1)));
%!assert (lt (kinterval (1, 2), kinterval (5, 3)));
%!assert (not (lt (kinterval (1, 2), kinterval (5, 2))));

