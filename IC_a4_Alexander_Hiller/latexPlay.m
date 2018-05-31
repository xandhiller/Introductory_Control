Gp_tf = 0.233/((s^2 + 0.676*s + 0.233)*(1+0.4*s));
[Gp_tf_num, Gp_tf_den] = tfdata(Gp_tf, 'v');
clear s
syms s
Gp_sym = poly2sym(Gp_tf_num,s)/poly2sym(Gp_tf_den,s);
l = latex(Gp_sym);
doc latex
figure (1)
a = gca;
a.TickLabelInterpreter = 'latex';
a.Box = 'on';
a.BoxStyle = 'full';
title(['$' l '$'], 'Interpreter', 'latex')