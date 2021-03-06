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
## @defop Method {@@kinterval} subsasgn (@var{A}, @var{IDX}, @var{RHS})
## @defopx Operator {@@kinterval} {@var{A}(@var{SUBS}) = @var{RHS}}
##
## Perform the subscripted assignment operation according to the subscript
## specified by @var{IDX}.
##
## The subscript @var{IDX} is expected to be a structure array with fields
## @code{type} and @code{subs}.  Only valid value for @var{type} is
## @code{"()"}.  The @code{subs} field may be either @code{":"} or a cell array
## of index values.
## @seealso{@@kinterval/subsref, @@kinterval/end}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function A = subsasgn (A, S, B)

  if (nargin ~= 3)
    print_usage ();
    return
  endif
  
  if (not (isa (A, "kinterval")))
    A = kinterval (A);
  endif
  
  if (not (isa (B, "kinterval")))
    B = kinterval (B);
  endif

  assert (strcmp (S.type, "()"), "only subscripts with parenthesis allowed");

  A.inf = subsasgn (A.inf, S, B.inf);
  A.sup = subsasgn (A.sup, S, B.sup);
# A.inf(A.inf == 0) = -0; # any new elements are stored as [-0, +0] internally

endfunction

%!test
%! A = kinterval (magic (3));
%! A(4, 4) = 42;
%! assert (inf (A), [magic(3),[0;0;0];0,0,0,42]);
%! assert (sup (A), [magic(3),[0;0;0];0,0,0,42]);
