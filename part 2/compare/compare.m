clear
close all
load('non')
xn=Xsim;
un=Usim;
load('lin')
x=Xsim;
u=Usim;
visdat2(time,xn,un,'--d',x,u,'-')
