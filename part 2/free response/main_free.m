close all
% plot free response of open loop system in absence of controller 


s=tf('s');

a=[5.67 6.29 8.44]*1e-4;

mar={'-d', '-s', '-o'}
tit={'\phi','\theta','\psi'};

for i=1:3
Gp=a(i)/s^2
Gc=1;
Gcl=(Gp*Gc);
figure
step(Gcl)
title(tit{i})
grid on
print(['open' num2str(i)],'-depsc')
end



% K=1e3*[ 1.455 0 1.293
%         1.311 0 1.166
%         0.977 0 0.868];

% K=[238e-1 0 1272e-1
%     214e-1 0 1146e-1
%     159e-1 0 854e-1];