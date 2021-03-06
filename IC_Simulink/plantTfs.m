%% Plant TF for IC Project 

%% Setup
T1_num = [0.795];
T1_den = [1 0.068 0];
T2_num = [-5*9.8];
T2_den = [7 0 0];
T3_num = [5.43];
T3_den = [1];

%% Tf objects of transfer functions
T1_tf = tf( T1_num, T1_den);
T2_tf = tf(T2_num, T2_den);
T3_tf = tf(T3_num, T3_den);

%% Sym objects of transfer functions
T1_sym = poly2sym(T1_num) /poly2sym(T1_den);
T2_sym = poly2sym(T2_num) /poly2sym(T2_den);
T3_sym = poly2sym(T3_num) /poly2sym(T3_den);

%% Coefficients for Phase-lead Controllers Gc1 and Gc2
syms z_gc1 p_gc1 K_gc1 % Controller 1 (Gc1)
syms z_gc2 p_gc2 K_gc2 % Controller 2 (Gc2)

%% System roots based on PO = 10%, ts = 10
ts = 10;
PO = 0.1;
tao = ts/5;

%% Obtain zeta and wn
% � roots of zeta
zeta_pos = (log(PO))/(sqrt( pi^2 + (log(PO))^2 ));
zeta_neg = -(log(PO))/(sqrt( pi^2 + (log(PO))^2 ));
wn_pos = 1/(tao*zeta_pos);
wn_neg = 1/(tao*zeta_neg);
zeta = [zeta_pos, zeta_neg];

%% n = index of zeta to use for calculations. n=1 -> pos-root, n=1 -> neg root
n=2;

%% Obtain system roots
pos_system_root = -zeta(n)*wn+(wn*sqrt(1-(zeta(n))^2))*1i;
neg_system_root = -zeta(n)*wn-(wn*sqrt(1-(zeta(n))^2))*1i;
system_root = [pos_system_root, neg_system_root];

%% Matching T1 Poles to Gc1 Zero
T1_poles = pole(T1_tf);
z_gc1 = subs(z_gc1, T1_poles(2));

%% Removing one pole at 0 on T2 
z_gc2 = subs(z_gc2, 0);

%% Set gains to unity 
% The aim is to tune the gains later in Simulink
K_gc1 = subs(K_gc1, 1);
K_gc2 = subs(K_gc2, 1);

%% Set the poles based on system roots, nb: T1_n = T1_numeric
% nb: T1_n = T1_numeric, meaning that a value has been substituted into the
% equation.
T1_n = [    subs(T1_sym, system_root(1)), 
            subs(T1_sym, system_root(2))
        ];
        
T2_n = [    subs(T2_sym, system_root(1)), 
            subs(T2_sym, system_root(2))
       ];
        
T3_n = [    subs(T3_sym, system_root(1)), 
            subs(T3_sym, system_root(2))
       ];

%% Symbolic objects for controllers Gc1 and Gc2
syms s
Gc1_sym = K_gc1*(s-z_gc1)/(s-p_gc1);
Gc2_sym = K_gc2*(s-z_gc2)/(s-p_gc2);

%% Substitute system poles into Gc1 and Gc2
Gc1_n = [   subs(Gc1_sym, s, system_root(1)), 
            subs(Gc1_sym, s, system_root(2))
        ];
        
Gc2_n = [   subs(Gc2_sym, s, system_root(1)), 
            subs(Gc2_sym, s, system_root(2))
         ];

%% Solve equations for poles p_gc1 and p_gc2
% Numeric characteristic equations, with pos and neg system_root,
% respectively
CE_eqns = [ 1+T1_n(1)*Gc1_n(1)+T1_n(1)*T2_n(1)*T3_n(1)*Gc2_n(1), 
            1+T1_n(2)*Gc1_n(2)+T1_n(2)*T2_n(2)*T3_n(2)*Gc2_n(2) 
          ];

S = solve([CE_eqns(1) == 0, CE_eqns(2) == 0]);

%% Solutions to poles in the controllers
round(S.p_gc1)
round(S.p_gc2)

%% Save Workspace
save plantTfs.mat