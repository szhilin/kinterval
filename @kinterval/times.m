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
## @defop Method {@@kinterval} times (@var{X}, @var{Y})
## @defopx Operator {@@kinterval} {@var{X} .* @var{Y}}
##
## Multiply Kaucher intervals @var{X} and @var{Y} (using Lakeev's formulas).
##
## @example
## @group
## x = kinterval (-2, 3);
## y = kinterval (5, 2);
## x .* y
##   @result{} ans = [-4,6]
## @end group
## @end example
## @seealso{@@kinterval/rdivide}
## @end defop

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-31

function result = times(x, y)
 
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  if (not (isa (y, "kinterval")))
    y = kinterval (y);
  endif
  
  if isscalar (x) && ~isscalar (y) 
      x.inf = x.inf * ones(size(y.inf));
      x.sup = x.sup * ones(size(y.inf));
  end

  if ~isscalar (x) && isscalar (y) 
      y.inf = y.inf * ones(size(x.inf));
      y.sup = y.sup * ones(size(x.inf));
  end
 
  if ~all(size(x.inf) == size(y.inf))
    error("wrong dimensions");
  endif

  xinfm = max(-x.inf, 0);
  xinfp = max(x.inf, 0);
  yinfm = max(-y.inf, 0);
  yinfp = max(y.inf, 0);

  xsupm = max(-x.sup, 0);
  xsupp = max(x.sup, 0);
  ysupm = max(-y.sup, 0);
  ysupp = max(y.sup, 0);
  
  zinf = max(xinfp .* yinfp, xsupm .* ysupm) - max(xsupp .* yinfm, xinfm .* ysupp);
  zsup = max(xsupp .* ysupp, xinfm .* yinfm) - max(xinfp .* ysupm, xsupm .* yinfp);
  
  result = kinterval(zinf, zsup);
 
endfunction 

%!assert (kinterval (-2, 3) .* kinterval (5, 2) == kinterval (-4, 6));
%!assert (kinterval (2, -3) .* kinterval (5, 2) == kinterval (10, -15));
