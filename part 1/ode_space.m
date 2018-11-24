function [xd] = ode_space(t,x,u,pos)
fi=x(1);
th=x(2);
si=x(3);
p=x(4);
q=x(5);
r=x(6);
m1=u(1);
m2=u(2);
m3=u(3);
x=pos(1);
y=pos(2);
z=pos(3);
I=diag([1763 1591 1185]);
mu=3.987e14;
r0=6371e3+650e3;

R1=[ 1 tan(th)*sin(fi) tan(th)*cos(fi)
    0 cos(fi) -sin(fi)
    0 sec(th)*sin(fi) sec(th)*cos(fi) ];
angdot=R1*[p q r].';

R=[ cos(si)*cos(th) sin(si)*cos(th) -sin(th)
    (cos(si)*sin(th)*sin(fi)-sin(si)*cos(fi) ) (sin(si)*sin(th)*sin(fi)+cos(si)*cos(fi) )  (cos(th)*cos(fi))
    (cos(si)*sin(th)*cos(fi)+sin(si)*sin(fi))  (sin(si)*sin(th)*cos(fi)-cos(si)*sin(fi))  (cos(th)*cos(fi)) ] ;

rb=R*[x y z].';
rbc=[0   -rb(3) rb(2) 
     rb(3) 0   -rb(1)
    -rb(2) rb(1) 0  ];

Tg=3*mu/(r0)^5*rbc*I*rb;

Td=[2e-3 1e-4 2e-3].';

Tc=[m1 m2 m3].';

angveldot=inv(I)*(Tc+Td+Tg-cross([p q r].',I*[p q r].'));

xd=[ angdot
     angveldot ];
 
end



