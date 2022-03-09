## Demo for subdiff() function
##
## The function computes a formal solution in Kaucher interval arithmetic for
## interval linear system (ILS) of equations Ax = b using Subdifferential Newton 
## Method

###############################################################
#
# Simple example
#
###############################################################

fprintf("\n\n============= Example 1 =============\n");

# Data for interval matrix and vector
Ainf = [2 -2; -1 2];
Asup = [4 1; 2 4];
binf = [-2; -2];
bsup = [2; 2];

# Construct interval matrix and interval vector for ILS A*x = b
fprintf("\nMatrix and vector of ILS:\n");
A = kinterval(Ainf,Asup)
b = kinterval(binf,bsup)

# A priori known solution of the ILS
fprintf("\nA priori known solution of ILS:\n");
xx = [kinterval(-1/3, 1/3); kinterval(-1/3, 1/3)]

# Check if A * xx == b
fprintf("\nCheck if A * xx == b:\n");
Axx = A * xx

# Compute a solution bu subdiff() 
fprintf("\nComputed solution of ILS:\n");
x = subdiff(A, b)

# Check if A * x == b
fprintf("\nCheck if A * x == b:\n");
Ax = A * x

###############################################################
#
# Run Subdifferential Newton Method stepwise for the same ILS
#
###############################################################

fprintf("\nSolve the same ILS step-by-step:\n");

# Set stepwise mode
opts.stepwise = true;

# First iteration
[x_stepwise, opts] = subdiff(A, b, opts);  
fprintf("-----\niteration: %d\n", opts.status.iteration);
x_stepwise 

# Second and all the rest iterations
while ~opts.finish
    [x_stepwise, opts] = subdiff(opts);
    fprintf("-----\niteration: %d\n", opts.status.iteration);
    x_stepwise 
endwhile


###############################################################
#
# Another example
#
###############################################################

fprintf("\n\n============= Example 2 =============\n");

# Construct interval matrix and vector

fprintf("\Solve ILS A2*x2 = b2:\n");

A2 = [ ...
ki(4, 6)   ki(-9, 0)   ki(0, 12)  ki(2, 3)   ki(5, 9)   ki(-23, -9) ki(15, 23);
ki(0, 1)   ki(6, 10)   ki(-1, 1)  ki(-1, 3)  ki(-5, 1)  ki(1, 15)   ki(-3, -1);
ki(0, 3)   ki(-20, -9) ki(12, 77) ki(-6, 30) ki(0, 3)   ki(-18, 1)  ki(0, 1);
ki(-4, 1)  ki(-1, 1)   ki(-3, 1)  ki(3, 5)   ki(5, 9)   ki(1, 2)    ki(1, 4);
ki(0, 3)   ki(0, 6)    ki(0, 20)  ki(-1, 5)  ki(8, 14)  ki(-6, 1)   ki(10, 17);
ki(-7, -2) ki(1, 2)    ki(7, 14)  ki(-3, 1)  ki(0, 2)   ki(3, 5)    ki(-2, 1);
ki(-1, 5)  ki(-3, 2)   ki(0, 8)   ki(1, 11)  ki(-5, 10) ki(2, 7)    ki(6, 82)]

b2 = [...
ki(-10, 95);
ki( 35, 14);
ki( -6,  2);
ki( 30,  7);
ki(  4, 95);
ki( -6, 46);
ki( -2, 65)
]

# Solve with the higher precision
opts2 = struct("eps",1e-15); # Set precision
fprintf("\nSolution of ILS A2*x2 = b2 with the precision %d\n", opts2.eps);
#format long
x2 = subdiff(A2, b2, opts2)

#format short

# Run Subdifferential Newton Method stepwise with the default precision
fprintf("\nSolve the same ILS in iteration-wise mode with the default precision (opt.eps = 1e-6):\n");

clear opts2
opts2.eps = 1e-06;
opts2.stepwise = 1;

[x2_stepwise, opts2] = subdiff(A2, b2, opts2);
fprintf("\n-----\niteration: %d\n", opts2.status.iteration);
x2_stepwise 

while ~opts2.finish
    [x2_stepwise, opts2] = subdiff(opts2);
    fprintf("-----\niteration: %d\n", opts2.status.iteration);
    x2_stepwise 
endwhile


