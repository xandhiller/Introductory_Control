%% Setup
clc
clear all
close all
% Number of poles
np = 4;
% Recording Outputs
diary('TF_Outputs')
diary off

%% From Scope3
%% Set up data: Scope3
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope3=csvread('scope_3.csv',2,0);
% Time data is in the 1st column
timeScope3=dataScope3(:,1);
% Y-motor data is in the 2nd column
yScope3=dataScope3(:,2);
% Input data is in 3rd column
uScope3=dataScope3(:,3);
% X-data is in 4th column
xScope3=dataScope3(:,4);
% Sample period
TsScope3_1=timeScope3(2)-timeScope3(1);

%% Clean data for Transfer Function Estimation -> Time series format
ydataScope3 = iddata(yScope3,uScope3,TsScope3_1);       % Data format required by tfest;
xdataScope3 = iddata(xScope3,uScope3,TsScope3_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
XsysScope3 = tfest(xdataScope3,np); 
YsysScope3 = tfest(ydataScope3,np); 

%% Graphical sanity check on data
figure(1)

subplot(311)
plot(timeScope3,uScope3)
ylabel('Input, u (V)')
xlabel('Time (sec)')
title('Sanity Check: Dataset 2 (scope-3)')

subplot(312)
plot(timeScope3, xScope3)
ylabel('X-displacement Output (V)')
xlabel('Time (sec)')

subplot(313)
plot(timeScope3, yScope3)
ylabel('Y-displacement Output (V)')
xlabel('Time (sec)')

savefig('Sanity Check -- Scope3')

%% Show Models
diary on
display('Models from Scope3:')
display('System from delta-X and u')
display(XsysScope3)
display('System from delta-Y and u')
display(YsysScope3)
diary off


%% From Scope4
%% Set up data: Scope4
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope4=csvread('scope_4.csv',2,0);
% Time data is in the 1st column
timeScope4=dataScope4(:,1);
% Y-motor data is in the 2nd column
yScope4=dataScope4(:,2);
% Input data is in 3rd column
uScope4=dataScope4(:,3);
% X-data is in 4th column
xScope4=dataScope4(:,4);
% Sample period
TsScope4_1=timeScope4(2)-timeScope4(1);

%% Clean data for Transfer Function Estimation -> Time series format
ydataScope4 = iddata(yScope4,uScope4,TsScope4_1);       % Data format required by tfest;
xdataScope4 = iddata(xScope4,uScope4,TsScope4_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
% XsysScope4 = tfest(xdataScope4,np); 
YsysScope4 = tfest(ydataScope4,np); 

%% Graphical sanity check on data
figure(2)

subplot(311)
plot(timeScope4,uScope4)
ylabel('Input, u (V)')
xlabel('Time (sec)')
title('Sanity Check: Dataset 2 (scope-4)')

subplot(312)
plot(timeScope4, xScope4)
ylabel('X-displacement Output (V)')
xlabel('Time (sec)')

subplot(313)
plot(timeScope4, yScope4)
ylabel('Y-displacement Output (V)')
xlabel('Time (sec)')

savefig('Sanity Check -- Scope4')

%% Show Models
diary on
% display('Y-Model from Scope4:')
% display('System from delta-X and u')
% display(XsysScope4)
display('System from delta-Y and u')
display(YsysScope4)
diary off

%% From Scope6
%% Set up data: Scope6
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope6=csvread('scope_6.csv',2,0);
% Time data is in the 1st column
timeScope6=dataScope6(:,1);
% Y-motor data is in the 2nd column
yScope6=dataScope6(:,2);
% Input data is in 3rd column
uScope6=dataScope6(:,3);
% X-data is in 4th column
xScope6=dataScope6(:,4);
% Sample period
TsScope6_1=timeScope6(2)-timeScope6(1);

%% Clean data for Transfer Function Estimation -> Time series format
ydataScope6 = iddata(yScope6,uScope6,TsScope6_1);       % Data format required by tfest;
xdataScope6 = iddata(xScope6,uScope6,TsScope6_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
XsysScope6 = tfest(xdataScope6,np); 
YsysScope6 = tfest(ydataScope6,np); 

%% Graphical sanity check on data
figure(3)

subplot(311)
plot(timeScope6,uScope6)
ylabel('Input, u (V)')
xlabel('Time (sec)')
title('Sanity Check: Dataset 2 (scope-6)')

subplot(312)
plot(timeScope6, xScope6)
ylabel('X-displacement Output (V)')
xlabel('Time (sec)')

subplot(313)
plot(timeScope6, yScope6)
ylabel('Y-displacement Output (V)')
xlabel('Time (sec)')

savefig('Sanity Check -- Scope6')

%% Show Models
diary on
% display('Models from Scope6:')
% display('System from delta-X and u')
% display(XsysScope6)
display('System from delta-Y and u')
display(YsysScope6)
diary off

%% From Scope8
%% Set up data: Scope8
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope8=csvread('scope_8.csv',2,0);
% Time data is in the 1st column
timeScope8=dataScope8(:,1);
% Y-motor data is in the 2nd column
yScope8=dataScope8(:,2);
% Input data is in 3rd column
uScope8=dataScope8(:,3);
% X-data is in 4th column
xScope8=dataScope8(:,4);
% Sample period
TsScope8_1=timeScope8(2)-timeScope8(1);

%% Clean data for Transfer Function Estimation -> Time series format
ydataScope8 = iddata((yScope8),uScope8,TsScope8_1);       % Data format required by tfest;
xdataScope8 = iddata((xScope8),uScope8,TsScope8_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
XsysScope8 = tfest(xdataScope8,np); 
YsysScope8 = tfest(ydataScope8,np); 

%% Graphical sanity check on data
figure(4)

subplot(311)
plot(timeScope8,uScope8)
ylabel('Input, u (V)')
xlabel('Time (sec)')
title('Sanity Check: Dataset 2 (scope-8)')

subplot(312)
plot(timeScope8, xScope8)
ylabel('X-displacement Output (V)')
xlabel('Time (sec)')

subplot(313)
plot(timeScope8, yScope8)
ylabel('Y-displacement Output (V)')
xlabel('Time (sec)')

savefig('Sanity Check -- Scope8')

%% Show Models
diary on
display('Models from Scope8:')
display('System from delta-X and u')
display(XsysScope8)
% display('System from delta-Y and u')
% diary off
% display(YsysScope8)

modelEvaluation
