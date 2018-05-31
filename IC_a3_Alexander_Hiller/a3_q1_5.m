%% Design controller in the z-domain

%% Setup
clear all;
clc;
close all;
syms pdz Kz

%% Discrete System Requirement Poles
% Positive pole from system requirements (only need one for calculation)
s_pole = -0.5+(sqrt(2)/8)*i;
% Sampling time
T = 0.25;
% Converting to z-domain
dscr_pole = exp(s_pole*T);
% Set the pole
z = dscr_pole;

%% System Parameters and Plant TF
% Discrete plant with hold circuit calcuated in Q1 part 2
Gz = 3.1526e-05*(z+0.9917)/((z-1)*(z-0.9753)*(z-0.1353))


%% Controller Form
% Set the zero as one of the poles of Gz (the discrete plant)
zdz = -0.9753;
% Controller
Dz = Kz*(z+zdz)/(z+pdz)

%% Insert Pole into Characteristic Equation
% Characteristic Equation
CE = 1+Dz*Gz

%% Solve the Real and Imaginary Equations
S = solve([imag(CE) == 0, real(CE) == 0], [pdz, Kz])

%% Solutions to controller pole and controller gain
S.Kz
S.pdz
