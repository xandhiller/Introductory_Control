%% Setup
clc
clear all
close all
% Number of poles
np = 4;
% Recording Outputs
diary('TF_Outputs')
diary off

%% From ScopeexpTestX_3
%% Set up data: Scope3
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope3=csvread('expTestX_3.csv',2,0);
% Time data is in the 1st column
timeScope3=dataScope3(:,1);
% Input data is in the 2nd column
uScope3=dataScope3(:,2);
% Y-data is in 3rd column
yScope3=dataScope3(:,3);
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


%% From ScopeexpTestY_1
%% Set up data: Scope1
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataScope1=csvread('expTestY_1.csv',2,0);
% Time data is in the 1st column
timeScope1=dataScope1(:,1);
% Input data is in the 2nd column
uScope1=dataScope1(:,2);
% Y-data is in 3rd column
yScope1=dataScope1(:,3);
% X-data is in 4th column
xScope1=dataScope1(:,4);
% Sample period
TsScope1_1=timeScope1(2)-timeScope1(1);

%% Clean data for Transfer Function Estimation -> Time series format
ydataScope1 = iddata(yScope1,uScope1,TsScope1_1);       % Data format required by tfest;
xdataScope1 = iddata(xScope1,uScope1,TsScope1_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
% XsysScope1 = tfest(xdataScope1,np); 
YsysScope1 = tfest(ydataScope1,np); 

%% Graphical sanity check on data
figure(2)

subplot(311)
plot(timeScope1,uScope1)
ylabel('Input, u (V)')
xlabel('Time (sec)')
title('Sanity Check: Dataset 2 (scope-1)')

subplot(312)
plot(timeScope1, xScope1)
ylabel('X-displacement Output (V)')
xlabel('Time (sec)')

subplot(313)
plot(timeScope1, yScope1)
ylabel('Y-displacement Output (V)')
xlabel('Time (sec)')

savefig('Sanity Check -- Scope1')

%% Show Models
diary on
% display('Y-Model from Scope4:')
% display('System from delta-X and u')
% display(XsysScope4)
display('System from delta-Y and u')
display(YsysScope1)
diary off

%% From Scope6
%% Set up data: Scope6
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
%dataScope6=csvread('scope_6.csv',2,0);
% Time data is in the 1st column
%timeScope6=dataScope6(:,1);
% Y-motor data is in the 2nd column
%yScope6=dataScope6(:,2);
% Input data is in 3rd column
%uScope6=dataScope6(:,3);
% X-data is in 4th column
%xScope6=dataScope6(:,4);
% Sample period
%TsScope6_1=timeScope6(2)-timeScope6(1);

%% Clean data for Transfer Function Estimation -> Time series format
%ydataScope6 = iddata(yScope6,uScope6,TsScope6_1);       % Data format required by tfest;
%xdataScope6 = iddata(xScope6,uScope6,TsScope6_1);       % Data format required by tfest;

%% Do Transfer Function Estimation
%XsysScope6 = tfest(xdataScope6,np); 
%YsysScope6 = tfest(ydataScope6,np); 

%% Graphical sanity check on data
%figure(3)

%subplot(311)
%plot(timeScope6,uScope6)
%ylabel('Input, u (V)')
%xlabel('Time (sec)')
%title('Sanity Check: Dataset 2 (scope-6)')

%subplot(312)
%plot(timeScope6, xScope6)
%ylabel('X-displacement Output (V)')
%xlabel('Time (sec)')

%subplot(313)
%plot(timeScope6, yScope6)
%ylabel('Y-displacement Output (V)')
%xlabel('Time (sec)')

%savefig('Sanity Check -- Scope6')

%% Show Models
%diary on
% display('Models from Scope6:')
% display('System from delta-X and u')
% display(XsysScope6)
%display('System from delta-Y and u')
%display(YsysScope6)
diary off


modelEvaluation
