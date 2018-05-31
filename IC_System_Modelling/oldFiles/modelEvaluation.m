%% MATLAB Setup
% close all

%% Grab data from experimental_data.csv
expDataX = csvread('expTestX_2.csv',2,0);
expDataY = csvread('expTestY_0.csv',2,0);

%% Classify the columns into data arrays, voltage and time

% X
xVolts = expDataX(:,4);
xTime =  expDataX(:,1);
% Y
yVolts =  expDataY(:,3);
yTime =  expDataY(:,1);

%% Rightshift experimental time data for comparison
xTime = xTime + 5;
yTime = yTime + 5;

%% Step Setup
% Step Amplitude specified by ModCon GUI
stepAmp = 4.5;
opt = stepDataOptions('InputOffset', 0, 'StepAmplitude', stepAmp);

%% Step Plot
figure(5)
hold on
step(YsysScope4, opt)
step(YsysScope6, opt)
step(XsysScope8, opt)
% Plot experimental X-data
plot(xTime, xVolts)
% Plot experimental Y-data
plot(yTime, yVolts)
axis([0 5 -1.5 3])

title('Models')
legend('Scope4 (Y-motor test)','Y-Scope6 (Y-motor tets)','X-Scope8 (X-motor test)', 'Experimental X-Output', 'Experimental Y-Output')
hold off

