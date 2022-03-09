## kinterval simple demo

# Elementary computations

x = kinterval(10,6)
y = kinterval(-2,1)

z1 = x + y
z2 = x - y
z3 = x * y
z4 = y / x
z5 = x / y


# Matrix and vector operators

M = [x y; 2*x y/2]

M1 = M * M
M2 = M .* M'
M3 = pro(M) * dual(M)
M4 = M(:,2) * M(1,:) 
v1 = M(:,1)
v2 = M * v1
