%% System Identification based on input-output information
% Explame for a SISO system with 2 states


%% Clean workspace/windows
clc
clear all
close all

inputFile = ['scope_3.csv','scope_4.csv', 'scope_6.csv','scope_8.csv'];

%% Read data
data=csvread('scope_3.csv', 2, 0);
time=data(:,1);
y=data(:,2);
u=data(:,3);
x=data(:,4);
Ts=time(2)-time(1)

%% Plot data
figure(1)
subplot(311)
plot(time,u)
ylabel('Input data (V)')
xlabel('Time (s)')
subplot(312)
plot(time,x)
ylabel('x-data (V)')
xlabel('Time (s)')
subplot(313)
plot(time,y)
ylabel('y-data (V)')
xlabel('Time (s)')


%% Determine Valid Sample Data
Ts=time(2)-time(1)

%% Plot X-axis
figure(2)
subplot(211)
plot(time,x)
ylabel('Output x (V)')
subplot(212)
plot(time,u)
ylabel('Input u (V)')
xlabel('Time [s]')

%% Plot Y-axis
% figure(3)
% subplot(211)
% plot(time,y)
% ylabel('Output y (V)')
% xlabel('Time [s]')
% subplot(212)
% plot(time,u)
% ylabel('Input u (V)')
% xlabel('Time [s]')

%% Prep Data for TF Estimation
yData = iddata(y,u,Ts);       %data format required by tfest;
xData = iddata(x,u,Ts);       %data format required by tfest;
np=4;                         %Number of poles

%% Get TF from X-data
display('Dataset number:')
display(1)
display('Transfer Function from X Data:')

Xsys = tfest(xData,np)        % Estimated transfer function

%% Get TF from y-data
% display('Transfer Function from Y Data')
% Ysys = tfest(yData,np)        

% zpk(sys)
%% SS Model from TF
% [Am,Bm,Cm,Dm] = tf2ss(sys.Numerator,sys.Denominator) 