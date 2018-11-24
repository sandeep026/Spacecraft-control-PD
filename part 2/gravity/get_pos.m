function [ra] = get_pos(dt)
R = 6371+650;
incl = 6*pi/180;
nu = 398600;
T = 2*pi*sqrt(R^3/nu); 
t = 0:dt:T;
theta = 2*pi*t/T; 
ra = [R*cos(theta); R*sin(theta)*cos(incl) ; R*sin(theta)*sin(incl);];
ra = ra'*1e3;
end

