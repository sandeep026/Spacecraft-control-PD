function [con] = controller_sc(t,X,Xref,U,K,rb,trims,trimc,op)

% perturbation in control
U=U-trimc;

% error matrix
e_mat=-X(1:3,:)+Xref;

if op==1
temp=diff_eqn_lin(0,X(:,end)-trims,U(:,end)-trimc,rb);
elseif op==2
temp=diff_eqn(0,X(:,end),U(:,end),rb);
end

% derivative of error
edot=-temp(1:3);

% error
e_roll=e_mat(1,end);
e_pitch=e_mat(2,end);
e_yaw=e_mat(3,end);

e_dot_roll=edot(1);
e_dot_pitch=edot(2);
e_dot_yaw=edot(3);

% integral of error
if size(t)==1
    e_int_roll=0;
    e_int_pitch=0;
    e_int_yaw=0;
else
    
    e_int_roll=trapz(t,e_mat(1,:));
    e_int_pitch=trapz(t,e_mat(2,:));
    e_int_yaw=trapz(t,e_mat(3,:));
end


% control calculated
con=[   K(1,:)*[e_roll    e_int_roll   e_dot_roll]'
    K(2,:)*[e_pitch   e_int_pitch  e_dot_pitch]'
    K(3,:)*[e_yaw     e_int_yaw    e_dot_yaw ]'     ] ;

% control to be given to plant (trim + perturbation)
com=con+trimc;

end

