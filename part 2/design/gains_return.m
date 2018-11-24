function [kp, kd] = gains_return(a,Mp,ts,tr)
% returns the gain for given performance requirements

f=@(x)[ Mp-exp( (-pi*x(1))/(sqrt(1-x(1)^2)))
        ts- 4.4/(x(1)*x(2))];



x=fsolve(f,[0.4 0.3]);    

zet=x(1);
om=x(2);   
  
kd=2*zet*om/a;
kp=om^2/a;
end
