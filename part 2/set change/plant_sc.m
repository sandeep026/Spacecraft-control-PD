function [Xp] = plant_sc(t,dt,X,U,rb,op,trims,trimc)
% simulate plant dynamics
if op==1
[z,y]=ode45(@(t,x,u,pos)diff_eqn_lin(t,x,U(:,end)-trimc,rb),[t(end) t(end)+dt],X(:,end)-trims);
elseif op==2
[z,y]=ode45(@(t,x,u,pos)diff_eqn(t,x,U(:,end),rb),[t(end) t(end)+dt],X(:,end));
end

Xp=y(end,:)';

end

