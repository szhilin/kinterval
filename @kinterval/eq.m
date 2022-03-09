## Copyright 2014-2016 Oliver Heimlich
## Copyright 2020-2022 Sergei Zhilin
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
## @defop Method {@@kinterval} eq (@var{A}, @var{B})
## @defopx Operator {@@kinterval} {@var{A} == @var{B}}
##
## Compare Kaucher intervals @var{A} and @var{B} for equality.
##
## @example
## @group
## x = kinterval (3, 2);
## y = kinterval (1, 2);
## x == y
##   @result{} ans =  0
## @end group
## @end example
## @seealso{@@kinterval/subset, @@kinterval/in}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-12-27

function result = eq (a, b)

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

  result = (a.inf == b.inf & a.sup == b.sup);

endfunction	

%!test "Singleton intervals";
%! assert (eq (kinterval (0), kinterval (1)) == false);
%! assert (eq (kinterval (0), kinterval (0)) == true);
%!test "Bounded intervals";
%! assert (eq (kinterval (1, 2), kinterval (3, 4)) == false);
%! assert (eq (kinterval (1, 2), kinterval (3, 2)) == false);
%! assert (eq (kinterval (1, 2), kinterval (1.5, 2.5)) == false);
%! assert (eq (kinterval (1, 2), kinterval (1, 2)) == true);

