%% Assignment 3, Question 2, part 2

%% Manual attempt at converting of SS to discrete time
disp('Manual attempt at converting of State Space to discrete time:')
A = [0 1; -4 -4]
B = [0;7]
C = [1 0]
D = [0]
T = 0.1
G = exp(A*T)
func = @(t) exp(A*t)
H = (integral(func, 0, T, 'ArrayValued', 1))*B

%% Using built-in MATLAB functions to convert SS to discrete time
disp('Built in MATLAB functions:')
sys = ss(A,B,C,D)
sysd = c2d(sys, T)

%% Controllability
Co = ctrb(sysd)
length(sysd.A) - rank(Co)
unco = length(sysd.A) - rank(Co)
if unco == 0
    disp('System is controllable!')
else
    disp('System is not controllable.')
end

%% Observability
ob = obsv(sys)
unob = length(sysd.A) - rank(ob)
if unob == 0
    disp('System is observable!')
else
    disp('System is not observable.')
end