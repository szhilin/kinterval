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
## @defmethod {@@kinterval} display (@var{X})
## 
## Display the value of Kaucher interval @var{X} (scalar or matrix).
## 
## @example
## @group
## display (kaucher (3,2));
##   @result{} [3,2]
## @end group
## @end example
## @example
## @group
## x = kinterval (3,2); display (x);
##   @result{} x = 
##   [3,2]
## @end group
## @end example
## @example
## @group
## z = kinterval (magic (2)); display (z);
##   @result{} z = 
##      [4,4]  [3,3]
##      [1,1]  [2,2]
## @end group
## @end example
## @example
## @group
## x = kinterval (1/2,1/3); display (x);
##   @result{} x = 
##   [0.5,0.33333]
## @end group
## @group
## format long
## display (x);
##   @result{} x = 
##   [0.5,0.333333333333333]
## @end group
## @end example
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-11-22
	
function display (k)
   if (~strcmp (class (k), "kinterval"))
       disp(k)';
       return;
   endif
     
   kinf =  k.inf;
  [rows,cols] = size(kinf);
  
  isnameempty = isempty (inputname (1));
  if (not (isnameempty))
    printf ("%s = ", inputname (1));
  endif

  prec = output_precision();

  if rows*cols == 1
    if (not (isnameempty))
      printf ("\n");
    endif
    printf("[%.*g,%.*g]\n", prec, k.inf, prec, k.sup);
  else
    data = zeros(2*cols, rows);
    data(1:2:end,:) = k.inf';
    data(2:2:end,:) = k.sup';

    printf ("\n");
    for i = 1:rows
        for j = 1:cols            
            printf(" [%.*g,%.*g]", prec, k.inf(i,j), prec, k.sup(i,j));
        endfor        
        printf ("\n");
    endfor
  endif
endfunction

%!test
%! str = evalc ("display (kinterval(3))");
%! assert (str, "[3,3]\n");
%!test
%! str = evalc ("x = kinterval(1.1, 2.2); display (x)");
%! assert (str, "x = \n[1.1,2.2]\n");

## Test input validation
%!error display ()
%!error display (1,2)
