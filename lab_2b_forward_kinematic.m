rw = 0.032; 
L = 0.101; 
dt=5e-3;

% theta_b=-rw/(3*L)*(my_data.signals.values(:,1)+my_data1.signals.values(:,1)+my_data2.signals.values(:,1));
theta1=my_data.signals.values(:,1);
theta2=my_data1.signals.values(:,1);
theta3=my_data2.signals.values(:,1);

theta_dot=zeros(3,length(theta1)-1);
theta_dot(1,:)=diff(theta1)./dt;
theta_dot(2,:)=diff(theta2)./dt;
theta_dot(3,:)=diff(theta3)./dt;


theta_bdot=-(rw/(3*L))*[1 1 1]*theta_dot;
theta_b=(cumsum(theta_bdot))*dt + atan(0.6096./0.9144);

for i=1:length(theta_b)
    J_b1=function_J(theta_b(i));
    xi_dot(:,i)=J_b1*theta_dot(:,i);
end
x_dot=xi_dot(1,:);
y_dot=xi_dot(2,:);

xfinal=cumsum(x_dot)*dt;
yfinal=cumsum(y_dot)*dt;

plot(theta_b)
title('real theta_b(t)')
figure
plot(xfinal)
title('real x(t)')
figure
plot(yfinal)
title('real y(t)')
figure
axis equal
hold on
plot(xfinal,yfinal)
title('real path')