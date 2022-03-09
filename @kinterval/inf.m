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
## @defmethod {@@kinterval} inf (@var{X})
##
## Get the left bound of Kaucher interval @var{X}.
##
## @example
## @group
## inf (kinterval (3.5, 2.5))
##   @result{} ans = 3.5000
## @end group
## @end example
## @seealso{@@kinterval/sup, @@kinterval/mid}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: interval
## Created: 2020-10-17

function result = inf (x)

  if (nargin ~= 1)
    print_usage ();
    return
  endif

  result = x.inf;

endfunction
