%% Setup
clear all;
clc;
close all;

%% System Parameters and Plant TF
s = tf([1 0],[1]);
m = 850;                % Mass of 850kg
b = 85;                 % Friction coefficient of 85kg/s
T = 0.25;               % Period of sampling
Gp = 1/((s)*(m*s+b));
Gh = (1/(s*(T/2)+1));   % Approximation of hold circuit tf

Gpz = c2d(Gp,T,'zoh');
Gpz = tf(Gpz)
Ghz = c2d(Gh,T,'zoh');
Ghz = tf(Ghz)

% Step-invariance (zero-order-hold)
disp('Zeros of Gp(z)')
zeros_Gpz = zero(Gpz)
disp('Poles of Gp(z)')
poles_Gpz = pole(Gpz)

disp('Zeros of Gh(z)')
zeros_Ghz = zero(Ghz)
disp('Poles of Gh(z)')
poles_Ghz = pole(Ghz)

Gz = zpk(Ghz*Gpz)