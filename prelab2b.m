kp1=150;
kp2=150;
kp3=150;
kd1=1;
kd2=1;
kd3=1;
f=0.9;
delta_t=5e-1;
A=0.1/delta_t;

%x,y path
figure(2)
num=50;
h=0;
k=0.6096;
t=linspace(-pi/2,pi/2,num);
a=0.3048;
b=0.6096;
x=h+a*cos(t);
y=k+b*sin(t);
plot(x,y);
axis([0 0.9144 0 1.2192]);
title('desired trejactory and target location')
axis equal
hold on

%theta_b
target=[0.9144 0.6096];
plot(target(1),target(2),'*')
legend('trajectory','target');
text(0.68,0.57,{'target \rightarrow ';'(0.9144,0.6069)'});
theta=atan((0.6096-y)./(0.9144-x));
% theta_b=[theta(1:25) theta(26:50)*0.8];
theta_b=theta;

%difference of x and y
xdot=diff(x)/delta_t;
ydot=diff(y)/delta_t;
phidot=diff(theta_b)/delta_t;
traj_dot=[xdot;ydot;phidot];

%find motor velocity
for i=1:49
    F=function_F(theta_b(i));
    qdot(:,i)=F*traj_dot(:,i);
end
%get joints
joint_traj=cumsum(qdot,2)*delta_t;
figure
subplot(2,1,2)
time=linspace(0,10,length(joint_traj));
plot(time,joint_traj(1,:))
hold on 
plot(time,joint_traj(2,:))
plot(time,joint_traj(3,:))
legend('motor 1','motor 2','motor 3');
title('desired motor angles')
xlabel('Time (s)'); ylabel('Angle(radians)')

%plot x(t),y(t)
subplot(2,1,1)
time2=linspace(0,10,length(x));
yyaxis left
plot(time2,x)
hold on
plot(time2,y)
ylabel('Distance(meters)')
yyaxis right
plot(time2,theta_b)
ylabel('Angle(radians)')
legend('x(t)','y(t)','theta b')
title('path of x,y,theta b')
xlabel('Time (s)'); 

