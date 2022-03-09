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
## @defmethod {@@kinterval} isinzero (@var{X})
##
## Return true if zero contains Kaucher interval @var{X}.
##
## @seealso{@@kinterval/iszeroin, @@kinterval/isnegative, @@kinterval/ispositive}
## @end defmethod

## Author: Sergei Zhilin
## Keywords: Kaucher interval
## Created: 2020-10-23

function result = isinzero(x)
  if (not (isa (x, "kinterval")))
    x = kinterval (x);
  endif
  result = iszeroin(dual(x));
endfunction