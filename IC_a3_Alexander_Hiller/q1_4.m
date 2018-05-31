clear all
close all
clc

%% Coefficients
pl = -0.5+(sqrt(2)/8)*i;

T = 0.25;
m = 850;
b =85;
zd = -0.1;
syms pd K

a4 = (T/2)
a3 = (1+T*b/(2*m)-T*pd/2)
a2 = b/m -pd - T*b*pd/(m*2)
a1 = b*K/m - b*pd/m
a0 = -b*K/m

%% Values of s with pole substituted in
s = pl
s2 = pl*pl
s3 = pl*pl*pl
s4 = pl*pl*pl*pl

%% Characteristic Equation (CE) with pole inserted
CE = a4*s4+a3*s3+a2*s2+a1*s+a0;

%% Solve Equations
S = solve([imag(CE) == 0, real(CE) == 0], [K, pd]);
disp('K is:')
S.K
disp('pd is:')
S.pd
