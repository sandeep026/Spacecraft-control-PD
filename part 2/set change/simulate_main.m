% Main simulation file 
% Calls plant and controller and performs closed loop control
% Results plotted via visdat

clear
clc
close all

% K=[ 402 23.31 1740.35
%     363.12 21.012 1562.81
%     270.6 15.65 1169.17];
% K=[238e-1 0 1272e-1
%     214e-1 0 1146e-1
%     159e-1 0 854e-1];

% K=1*[ 887.349 0 1293.4
%     799.88 0 1165.9
%     596.1225 0 868.87];

% K=1e3*[ 1.455 0 1.293
%         1.311 0 1.166
%         0.977 0 0.868];

% use this for preliminary
% K=[244 0 776
%     220 0 699.5
%     164 0 521.3];

% after root locus refinement
K=1*[0.3144*1881.7 0 1811.7
    0.3145*1614.4 0 1614.4
    0.3146*1188.4 0 1188.4];

% orbit period
Tf=5.8473e3;

% time step
dt=1;


time=0;

% get all position coordinates for one period
rb=get_pos(dt);
rb=rb';
% i=17 my eqn point

Xref=[];
% reference point
Xref=zeros(3,1);
Xsim=[];
%Simulated data
Xsim=zeros(6,1)+1*[5*pi/180 0*pi/180 0*pi/180 0 0 0]';
Usim=[];
% trim conditions for control
trimc=[-0.0019 -0.0002 -0.0017]';
Usim=trimc;
% for state
trims=zeros(6,1);



i=1;
op=2;

% op--->1  linear model
% op--->2  non linear



while time(end) < Tf
    
    % get control input from controller
    if i==1
        con=controller_sc(time,Xsim,Xref,(op-1)*trimc,K,rb(:,i),trims,trimc,op);
    else
        con=controller_sc(time,Xsim,Xref,Usim,K,rb(:,i),trims,trimc,op);
    end
    
    Usim=[Usim con];
    
    % give it plant and get next state
    Xp=plant_sc(time,dt,Xsim,Usim,rb(:,i),op,trims,trimc);
    
    % store it
    Xref=[Xref zeros(3,1)];
    
    
    Xsim=[Xsim Xp] ;
    
    
    time=[time time(end)+dt];
    i=i+1;
end

% plot simulated data
visdat(time,Xsim,Usim,'--')

