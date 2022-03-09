## Copyright 2014-2016 Oliver Heimlich
## Copyright 2017 Joel Dahne
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
## @defmethod {@@kinterval} subset (@var{A}, @var{B})
##
## Evaluate subset comparison on Kaucher intervals.
##
## True, if all numbers from @var{A} are also contained in @var{B}.
## False, if @var{A} contains a number which is not a member in @var{B}.
##
## Evaluated on Kaucher interval arrays, this functions is applied
## element-wise.
##
## @seealso{@@kinterval/eq, @@kinterval/in}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: interval
## Created: 2020-10-24

function result = subset (a, b)

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

  result = (b.inf <= a.inf & a.sup <= b.sup);

endfunction

%!assert (subset (kinterval (1, 2), kinterval (1, 3)));

%!shared testdata
%! # Load compiled test data (from src/test/*.itl)
%! testdata = load (file_in_loadpath ("test/itl.mat"));

%!test
%! # Scalar evaluation
%! testcases = testdata.NoSignal.kinterval.subset;
%! for testcase = [testcases]'
%!   assert (isequaln (...
%!     subset (testcase.in{1}, testcase.in{2}), ...
%!     testcase.out));
%! endfor

%!test
%! # Vector evaluation
%! testcases = testdata.NoSignal.kinterval.subset;
%! in1 = vertcat (vertcat (testcases.in){:, 1});
%! in2 = vertcat (vertcat (testcases.in){:, 2});
%! out = vertcat (testcases.out);
%! assert (isequaln (subset (in1, in2), out));

%!test
%! # N-dimensional array evaluation
%! testcases = testdata.NoSignal.kintervalOA.subset;
%! in1 = vertcat (vertcat (testcases.in){:, 1});
%! in2 = vertcat (vertcat (testcases.in){:, 2});
%! out = vertcat (testcases.out);
%! # Reshape data
%! i = -1;
%! do
%!   i = i + 1;
%!   testsize = factor (numel (in1) + i);
%! until (numel (testsize) > 2)
%! in1 = reshape ([in1; in1(1:i)], testsize);
%! in2 = reshape ([in2; in2(1:i)], testsize);
%! out = reshape ([out; out(1:i)], testsize);
%! assert (isequaln (subset (in1, in2), out));
