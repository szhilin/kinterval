Octave Package for Kaucher Interval Arithmetic
===============================================

 Kaucher interval arithmetic extends and completes the classical interval arithmetic 
 by adding improper intervals [a,b] a >= b to the set of proper intervals [a,b] a <= b. 
 (Kaucher E., 1980: Interval analysis in the extended interval space // Computing. 
 Supplementum, 2, 33-49).

 The code of the kinterval package is based on [GNU Octave interval package](https://octave.sourceforge.io/interval/) implementing 
 the classical interval arithmetic (by Oliver Heimlich et al.). The signatures of kinterval 
 functions are compatible with ones from Octave interval package when possible.

 CAUTION. Unlike interval package kinterval does not implement rigorous
 rounding policy (at least in its early versions).

What is new
-----------
Latest release is 0.0.2. You can see the full list of changes [here](NEWS)

How to install
--------------
No compilation or explicit installation is needed. Just specify the search path for kinterval package and its subfolders in Ocatve command line using `addpath(genpath(KINTERVAL_ROOT)` where `KINTERVAL_ROOT` is a string with the path to root folder of kinterval. You may also call `savepath` after that to make search path permanent.

How to cite
-----------
To cite this particular version of the kinterval package in publications use:

     @software{octave-kinterval,
       author  = {Sergei I. Zhilin},
       title   = {GNU Octave Package for Kaucher Interval Arithmetic},
       url     = {https://github.com/szhilin/kinterval/},
       version = {0.0.2},
       date    = {2022-03-10},
     }

License
-------
The kinterval package is free software and can be used under the terms of
the GNU General Public License Version 3 (GPLv3+) or at your option any later
version. 

Dependencies
------------
You need Octave version >= 4.4.2.

Maintainer
----------
Sergei I. Zhilin <szhilin@gmail.com>
