function [] = visdat2(t,xn,un,mar1,x,u,mar2)
xl='t (s)';
yls={'\phi','\theta','\psi','p','q','r'};
ylc={'T_{cx}','T_{cy}','T_{cz}'};
Ns=6;
Nc=3;

for i=1:Ns
    figure
    plot(t,xn(i,:),mar1)
    hold on
    plot(t,x(i,:),mar2)
    xlabel(xl)
    ylabel(yls{i})
end


for i=1:Nc
    figure
    plot(t,un(i,:),mar1)
    hold on
    plot(t,u(i,:),mar2)
    xlabel(xl)
    ylabel(ylc{i})
end


end

