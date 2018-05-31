%% Assignment 3, Question 2, Part 3

%% Step 1: Continuous Model & Step 2: Discrete Model
load 'a3_q2.mat'

%% Step 3: Poles in s-domain
% Time constant
Tc = 0.5;
% Damping ratio
zeta = 0.707;
% Natural Frequency
wn = 1/(zeta*Tc)
% Poles
p1 = -zeta*wn+wn*sqrt(1-(zeta)^2)*i
p2 = -zeta*wn-wn*sqrt(1-(zeta)^2)*i

%% Step 4: Poles in the z-domain
% Nb: T = sampling time.
z1 = exp(T*p1)
z2 = exp(T*p2)

%% Step 5: Characteristic Equation
% Obtain K via the Ackerman Method
G = sysd.A;
H = sysd.B;
J = [z1 z2];
% Acker method assumes that the system is controllable, which we already
% know from a3_q2_2
k = acker(G,H,J)
% Characteristic Equation:
CE = abs(z1*eye(2,2)-G+H*k)

%% I can't follow the steps in Lecture Slides or the Subject Lecture Notes, the method is very unclear.
