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
## @defop Method {@@kinterval} ge (@var{A}, @var{B})
## @defopx Operator {@@kinterval} {@var{A} >= @var{B}}
##
## Compare intervals @var{A} and @var{B} for weakly greater.
##
## Evaluated on interval arrays, this functions is applied element-wise.
##
## @seealso{@@kinterval/eq, @@kinterval/le, @@kinterval/gt}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-29

function result = ge(x, y)

  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif
  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  result = x.inf >= y.inf & x.sup >= y.sup;

endfunction

%!assert (ge (kinterval (3, 2), kinterval (1, 2)));

