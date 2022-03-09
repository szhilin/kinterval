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
## @defop Method {@@kinterval} rdivide (@var{X}, @var{Y})
## @defopx Operator {@@kintreval} {@var{X} ./ @var{Y}}
##
## Multiply Kaucher interval @var{X} by reciprocal for Kaucher interval 
## @var{Y}.
##
## @example
## @group
## x = kinterval (2, 3);
## y = kinterval (1, 2);
## x ./ y
##   @result{} ans = [1, 3]
## @end group
## @end example
## @seealso{@@kinterval/times, @@kinterval/recip, @@kinterval/innerrdivide}
## @end defop

## Author: Sergei Zhilin
## Keywords: interval
## Created: 2020-10-25

function result = rdivide(x,y)
    if (not (isa (x, "kinterval")))
	x = kinterval (x);
    endif
    if (not (isa (y, "kinterval")))
	y = kinterval (y);
    endif

    if isscalar(x) && ~isscalar(y)
       x = x .* ones(size(y));
    endif
    if ~isscalar(x) && isscalar(y)
       y = y .* ones(size(x));
    endif
    if ~all(size(x.inf) == size(y.inf))
      error("wrong dimensions");
    endif

    if iszeroin(pro(y))
        error ('wrong division, pro(denominator) contains zero');
    endif
    result = x .* recip(y);
endfunction
