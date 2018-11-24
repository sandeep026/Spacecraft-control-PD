% script to plot variation of gravity over an orbit
r=get_pos(100);
r=r';
Tg=zeros(3,length(r));

for i=1:length(r)
Tg(:,i)=vis_gravity(zeros(3,1),r(:,i));
end

t=linspace(0,5.8548e+03,length(r));

figure 
hold on
plot(t,Tg(1,:),'-o')
plot(t,Tg(2,:),'-d')
plot(t,Tg(3,:),'-s')
legend({'Tg_{x}','Tg_{y}','Tg_{z}'})
ylabel('Gravity gradient torque')
xlabel('time (s)')
grid on

print('gravity','-depsc')

