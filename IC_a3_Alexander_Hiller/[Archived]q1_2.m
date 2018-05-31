%% Setup
clear all;
clc;
close all;

%% System Parameters and Plant TF
s = tf([1 0],[1]);
m = 850;            % Mass of 850kg
b = 85;             % Friction coefficient of 85kg/s
T = 0.25;           % Period of sampling
G = 1/((s)*(m*s+b));

%% Z-transform
% Tustin
GD1 = c2d(G,T,'tustin');
% Step-invariance (zero-order-hold)
GD2 = c2d(G,T,'zoh');
% Matched pole-zero mapping method
GD3 = c2d(G,T,'matched');

%% System TFs
% System Transfer Functions
SysG    = G/(1+G);
SysGD1  = GD1/(1+GD1);
SysGD2  = GD2/(1+GD2);
SysGD3  = GD3/(1+GD3);

%% Step responses of the different uncontrolled closed-loop system models
% Plot them
figure(1);
step(SysG)
hold on;
step(SysGD1)
step(SysGD2)
step(SysGD3)
hold off
grid on

%% Bode Plots of the different uncontrolled closed-loop system models
% % Gives some strange results
% figure(2);
% bode(SysG)
% hold on;
% bode(SysGD1)
% bode(SysGD2)
% bode(SysGD3)
% hold off
% grid on

