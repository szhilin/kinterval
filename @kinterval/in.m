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
## @defmethod Method {@@kinterval} in (@var{X}, @var{Y})
## 
## Returns true (1) if kaucher interval X belongs to kaucher interval Y 
## else returns false (0). For vector and matrix X and Y the method works 
## element-wise.
## 
## @example
## @group
## x = kinterval(1,-1);
## y = kinterval(0);
## z = kinterval(-2,2);
## in(x,y)
##   @result{} ans = 1
## in(y,x)
##   @result{} ans = 0
## in(y,z)
##   @result{} ans = 0
## @end group
## @end example
## @seealso{@@kinterval/subset, @@kinterval/iszeroin}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

function result = in(x, y)
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
      relust = x.inf >= y.inf & x.sup <= y.sup;
endfunction
