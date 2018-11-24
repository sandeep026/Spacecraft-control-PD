function [Tg] = vis_gravity(ang,pos)
% compute gravity torque
fi=ang(1);
th=ang(2);
si=ang(3);
x=pos(1);
y=pos(2);
z=pos(3);
I=diag([1763 1591 1185]);
mu=3.987e14;
r0=6371e3+650e3;


R=[ cos(si)*cos(th) sin(si)*cos(th) -sin(th)
    (cos(si)*sin(th)*sin(fi)-sin(si)*cos(fi) ) (sin(si)*sin(th)*sin(fi)+cos(si)*cos(fi) )  (cos(th)*cos(fi))
    (cos(si)*sin(th)*cos(fi)+sin(si)*sin(fi))  (sin(si)*sin(th)*cos(fi)-cos(si)*sin(fi))  (cos(th)*cos(fi)) ] ;

rb=R*[x y z].';
rbc=[0   -rb(3) rb(2) 
     rb(3) 0   -rb(1)
    -rb(2) rb(1) 0  ];

Tg=3*mu/(r0)^5*rbc*I*rb;



 
end



