syms fi th si p q r x y z m1 m2 m3
xd=f([fi th si p q r],[m1 m2 m3],[x,y,z]);
A=jacobian(xd,[fi th si p q r]);
B=jacobian(xd,[m1 m2 m3]);

R = 6371+650;
incl = 6*pi/180;
nu = 398600;
T = 2*pi*sqrt(R^3/nu); % hours
t = 0:T/300:T;
theta = 2*pi*t/T; 
ra = [R*cos(theta); R*sin(theta)*cos(incl) ; R*sin(theta)*sin(incl);];
ra = ra'*1e3;

Utrim=[];
for i=1:length(t)
res=f([0 0 0 0 0 0],[m1 m2 m3],[ra(i,:)]);

Tc_trim=double([vpa(solve(res(4,:)),4) vpa(solve(res(5,:)),4)  vpa(solve(res(6,:)),4) ]');

Utrim=[Utrim Tc_trim];
end

res=f([0 0 0 0 0 0],[m1 m2 m3],[ra(50,:)]);
Tc_trim=double([vpa(solve(res(4,:))) vpa(solve(res(5,:)))  vpa(solve(res(6,:))) ]');


er=[];
for i=1:length(t)
er=[er f(zeros(1,6),Tc_trim,ra(i,:)) ];
end

% validation of eqn point
[t,yint]=ode45(@(t,x,u,pos)ode_space(t,x,Tc_trim,ra(50,:)),[t(1) t(end)],1e-6*[zeros(1,6)]);

A=vpa(subs(A,{fi,th,si,p,q,r,m1,m2,m3,x,y,z},{0,0,0,0,0,0,Tc_trim(1),Tc_trim(2),Tc_trim(3),ra(50,1),ra(50,2),ra(50,3)}),3);

B=vpa(subs(B,{fi,th,si,p,q,r,m1,m2,m3,x,y,z},{0,0,0,0,0,0,Tc_trim(1),Tc_trim(2),Tc_trim(3),ra(50,1),ra(50,2),ra(50,3)}),3);





