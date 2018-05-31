%% Assignment 4, q1, part 2 -- Controller Implementation
% Alexander Hiller (11850637)

%% Setup
load preController.mat

%% From hanf calculations
% Td = controller coefficient, w = angular freq
syms w Td 
a1 = 0.5825;
b1 = Td*w*0.5825;
a2 = (2.5*0.283 - 1.706*(w^2));
b2 = (w*1.923-(w^3));

eqns = [atan(b1/a1)-atan(b2/a2) == pi, sqrt(a1^2 + b1^2)/sqrt(a2^2 + b2^2) == 1/15];
Soln = solve(eqns, [Td, w]);

Soln.Td 
Soln.w