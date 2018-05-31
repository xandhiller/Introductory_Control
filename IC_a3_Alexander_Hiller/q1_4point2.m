%% Convert s-domain controller to z-domain

%% Sample time
T = 0.25;
%% S-domain Controller
Gc = zpk(-0.1, -0.75, 0.44)
%% Z-domain controller
Gcd = c2d(Gc, T,'zoh')