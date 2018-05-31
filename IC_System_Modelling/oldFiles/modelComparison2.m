%% Setup
clc
clear all
close all
% Number of poles
np = 4;
% Recording Outputs
diary('TF_Outputs')
diary off

%%
timeColumn = 1;
yMotorColumn = 3;
xMotorColumn = 4;


%% From expTestY0
%% Set up data: expTestY0
% Go into 'string' csv file and skip the first two rows and skip 0 columns.
dataexpTestY0 = csvread('expTestY0.csv',2,0);
% Time data is in the 1st column
timeexpTestY0 = dataexpTestY0(:,1);
% Y-motor data is in the 2nd column
yexpTestY0 = dataexpTestY0(:,2);
% Input data is in 3rd column
uexpTestY0 = dataexpTestY0(:,3);
% X-data is in 4th column
xexpTestY0 = dataexpTestY0(:,4);
% Sample period
TsexpTestY0 = timeexpTestY0(2)-timeexpTestY0(1);

