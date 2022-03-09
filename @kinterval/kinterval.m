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
## @deftypefn  {} {} kinterval ()
## @deftypefnx {} {} kinterval (@var{a}, @var{b})
##
## Create Kaucher interval object from bounds a and b.
##
## @example
## @group
## x = kinterval(1,-1)
##   @result{} x = [1, -1]
## @end group
## @end example
##
## @seealso{@@kinterval/ki,@@kinterval/kintval}
## @end deftypefn

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-17

function z = kinterval(varargin)

  if (nargin == 0)
    z.inf = 0;
    z.sup = 0;
    z = class (z, "kinterval");
  else
   if nargin == 1
    x = varargin{1}; 
    if (strcmp (class (x), "kinterval"))
      z = x;
    elseif isreal (x)
      z.inf = x;  
      z.sup = x;  
      z = class (z, "kinterval");
    else
        error ("@kinterval: A must be a real numbers");
    endif 
   elseif  nargin == 2 
      x = varargin{1}; 
      y = varargin{2}; 
      if isreal (x) && isreal (y)
        if ~all(size (x) == size (y))
          error("wrong dimensions");
        endif
        z.inf = x;
        z.sup = y;
        z = class (z, "kinterval");
      else
        error ("@kinterval: A and B must be real numbers");
      endif
    else 
      error ("@kinterval: Wrong number of arguments");
    endif
  endif

endfunction
