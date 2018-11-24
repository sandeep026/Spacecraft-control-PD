function [xd] = diff_eqn(t,x,u,pos)
% states
fi=x(1);
th=x(2);
si=x(3);
p=x(4);
q=x(5);
r=x(6);
% control
m1=u(1);
m2=u(2);
m3=u(3);
% position
x=pos(1);
y=pos(2);
z=pos(3);
%moment of ineria
% I=diag([1763 1591 1185]);
I=[1763 -52 -16;-52 1591 25;-16 25 1185];
mu=3.987e14;
r0=6371e3+650e3;

R1=[ 1 tan(th)*sin(fi) tan(th)*cos(fi)
    0 cos(fi) -sin(fi)
    0 sec(th)*sin(fi) sec(th)*cos(fi) ];
angdot=R1*[p q r].';
% rotation matrix
R=[ cos(si)*cos(th) sin(si)*cos(th) -sin(th)
    (cos(si)*sin(th)*sin(fi)-sin(si)*cos(fi) ) (sin(si)*sin(th)*sin(fi)+cos(si)*cos(fi) )  (cos(th)*cos(fi))
    (cos(si)*sin(th)*cos(fi)+sin(si)*sin(fi))  (sin(si)*sin(th)*cos(fi)-cos(si)*sin(fi))  (cos(th)*cos(fi)) ] ;

rb=R*[x y z].';
rbc=[0   -rb(3) rb(2) 
     rb(3) 0   -rb(1)
    -rb(2) rb(1) 0  ];
% gravity gradient
Tg=3*mu/(r0)^5*rbc*I*rb;
% disturbance torque
Td=[2e-3 1e-4 2e-3].';
% moment from controller
Tc=[m1 m2 m3].';

angveldot=inv(I)*(Tc+Td+Tg-cross([p q r].',I*[p q r].'));

xd=[ angdot
     angveldot ];
 
end



