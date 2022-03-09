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
## @defop Method {@@kinterval} subsref (@var{A}, @var{IDX})
## @defopx Operator {@@kinterval} {@var{A}(@var{I})}
## @defopx Operator {@@kinterval} {@var{A}(@var{I1}, @var{I2})}
## @defopx Operator {@@kinterval} {@var{A}.@var{P}}
##
## Select property @var{P} or elements @var{I} from Kaucher interval array @var{A}.
##
## The index @var{I} may be either @code{:} or an index array.
## @comment DO NOT SYNCHRONIZE DOCUMENTATION STRING
## The property @var{P} may correspond to any unary method of the kinterval's
## class, but usually is either @code{inf} or @code{sup}.
##
## @example
## @group
## x = kinterval (magic (3), magic (3) + 1);
## x (1)
##   @result{} ans = [8,9]
## x (:, 2)
##   @result{} ans = 
##       [1,2]
##       [5,6]
##       [9,10]
## x.inf
##   @result{} ans =
##      8   1   6
##      3   5   7
##      4   9   2
## @end group
## @end example
## @seealso{@@kinterval/subsasgn, @@kinterval/end}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-25

function A = subsref (A, S)

  if (nargin ~= 2)
    print_usage ();
    return
  endif

  switch S(1).type
    case "()"
      A.inf = subsref (A.inf, S(1));
      A.sup = subsref (A.sup, S(1));
    case "{}"
      error ("kinterval cannot be indexed with {}")
    case "."
      if (not (any (strcmp (S(1).subs, methods (A)))))
        error (["kinterval property ‘", S(1).subs, "’ is unknown"])
      endif
      functionname = ["@kinterval", filesep(), S(1).subs];
      if (nargin (functionname) ~= 1)
        error (["‘", S(1).subs, "’ is not a valid kinterval property"])
      endif
      A = feval (S(1).subs, A);
    otherwise
      error ("invalid subscript type")
  endswitch

  if (numel (S) > 1)
    A = subsref (A, S(2 : end));
  endif

endfunction

%!assert (kinterval (magic (3))([1, 2, 3]) == kinterval ( magic (3)([1, 2, 3])));

%!# from the documentation string
%!test
%! x = kinterval (magic (3), magic (3) + 1);
%! assert (x(1) == kinterval (8, 9));
%! assert (x(:, 2) == kinterval ([1; 5; 9], [2; 6; 10]));
%! assert (x.inf, magic (3));

%!assert (reshape (kinterval (1:16), 2, 2, 2, 2)(2, 7) == kinterval (14))
