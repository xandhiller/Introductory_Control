clear all
close all

% Alexander Hiller 11850637
% Introductory Control, Autumn 2018
% Assignment 2

% Question 1, part (2)

S = tf([1,0],[1]);

Gc = (0.367901)*(S+7.35)/(S+(50/36));

Gp = 9/(S*(S+2)*(S+9));

System = Gc*Gp/(1+Gc*Gp);

% isstable(System); % To check stability
% Outputs 0, logical false. Not sure why. Would love feedback

% Question 2, part (3)
uncontrolledSystem = Gp/(1+Gp);

figure(1);
step(System, 'b')
hold on
step(uncontrolledSystem, 'r')
hold off
legend('Controlled System', 'Uncontrolled System')

