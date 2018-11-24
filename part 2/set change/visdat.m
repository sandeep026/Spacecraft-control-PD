function [] = visdat(t,x,u,mar)
xl='t (s)';
yls={'\phi','\theta','\psi','p','q','r'};
ylc={'T_{cx}','T_{cy}','T_{cz}'};
Ns=6;
Nc=3;
figure
for i=1:Ns
    subplot(2,3,i)
    plot(t,x(i,:),mar)
    xlabel(xl)
    ylabel(yls{i})
    grid on
end
figure
for i=1:Nc
    subplot(3,1,i)
    plot(t,u(i,:),mar)
    xlabel(xl)
    ylabel(ylc{i})
    grid on
end


end

