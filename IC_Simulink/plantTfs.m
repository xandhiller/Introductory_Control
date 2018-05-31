%% Plant TF for IC Project 

%% Setup
T1_num = [3.9946];
T1_den = [1 0.068 0 0];
T2_num = [-5*9.8];
T2_den = [7 0 0];
T3_num = [5.43];
T3_den = [1];
T1 = tf(T1_num, T1_den);
T2 = tf(T2_num, T2_den);
T3 = tf(T3_num, T3_den);
pole(T1);
pole(T2);
pole(T3);

%% Coefficients for Controllers Gc1 and Gc2
z_gc1 = 0;
p_gc1 = 0;
z_gc2 = 0;
p_gc2 = 0;
K_gc1 = 0;
K_gc2 = 0;

%% System roots based on PO = 10%, ts = 10
ts = 10;
PO = 0.1;
tao = ts/5;
zeta = (log(PO))/(sqrt( pi^2 + (log(PO))^2 ));
wn = 1/(tao*zeta);
pos_system_root = -zeta*wn+(wn*sqrt(1-zeta^2))*1i;
neg_system_root = -zeta*wn-(wn*sqrt(1-zeta^2))*1i;

%% Matching T1 Poles to Gc1 Zero
z_gc1 = pole(T1);
z_gc1 = z_gc1(3);

%% Removing one pole at 0 on T2 
z_gc2 = 0;

%% Set gains to unity (will tune in Simulink)
K_gc1 = 1;
K_gc2 = 1;

%% Set the poles based on 

%% Save Workspace
save plantTfs.mat