% gets the gains for the controller from performance requirements
% Argument order
% 1.Constant assocoated with system
% 2. Mp- max. % overshoot
% 3. ts- settling time
% 4. tr- Rise time

K=[];

% fi
[kp,kd]=gains_return(5.67e-4,0.15,12,1.5);
K=[K;[kp 0 kd]];
% theta
[kp,kd]=gains_return(6.29e-4,0.15,12,1.5);
K=[K;[kp 0 kd]];
% si
[kp,kd]=gains_return(8.44e-4,0.15,12,1.5);
K=[K;[kp 0 kd]]