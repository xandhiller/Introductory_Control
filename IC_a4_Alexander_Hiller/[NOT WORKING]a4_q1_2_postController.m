%% Assignment 4, q1, part 2 -- Controller Implementation
% Alexander Hiller (11850637)

%% Setup
load preController.mat

%% From hanf calculations
% Td = controller coefficient, w = angular freq
syms w Td 


GcGp_num = (1+Td*w*1i)*(0.233)
GcGp_den = (-1*(w)^2 + 0.676*w*1i + 0.233 + 0.4*w*1i*(-1)*(w)^2 + 0.4*w*1i*0.676*w*1i + 0.4*w*1i*0.233)

a1 = real(GcGp_num)
b1 = imag(GcGp_num)
a2 = real(GcGp_den)
b2 = imag(GcGp_den)

eqns = [atan(b1/a1)-atan(b2/a2) == -pi, sqrt(a1^2 + b1^2)/sqrt(a2^2 + b2^2) > 1/15]
assume(imag(w) == 0)
assume(imag(Td) == 0)
assume(real(w) ~= 0)
assume(real(Td) ~= 0)

Soln = solve(eqns, [Td, w])

Soln.Td 
Soln.w