close all
% plot and analyse closed loop performance after gain selction
% K=[244 0 776
%     220 0 699.5
%     164 0 521.3];
% after root locus refinement
K=[0.3144*1881.7 0 1811.7
   0.3145*1614.4 0 1614.4
   0.3146*1188.4 0 1188.4];


s=tf('s');

a=[5.67 6.29 8.44]*1e-4;

mar={'-d', '-s', '-o'}
tit={'\phi','\theta','\psi'};

for i=1:3
Gp=a(i)/s^2
Gc=K(i,:)*[1 ;1/s; s];
Gcl=feedback(Gp*Gc,1);
figure
step(Gcl,mar{i})
title(tit{i})
grid on
print(['rloc' num2str(i)],'-depsc')
end



% K=1e3*[ 1.455 0 1.293
%         1.311 0 1.166
%         0.977 0 0.868];

% K=[238e-1 0 1272e-1
%     214e-1 0 1146e-1
%     159e-1 0 854e-1];