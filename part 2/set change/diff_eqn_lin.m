function [xd] = diff_eqn_lin(t,x,u,rb)
% linearised equation of motion
A=[zeros(3) eye(3)
    zeros(3) zeros(3) ];
B=[zeros(3)
    diag([5.67 6.29 8.44]*1e-4) ];

xd=A*x+B*u ;

end

