rw = 0.032; 
L = 0.101; 
% theta_b=-rw/(3*L)*(my_data.signals.values(:,1)+my_data1.signals.values(:,1)+my_data2.signals.values(:,1));
theta1dot=diff(my_data.signals.values(:,1));
theta2dot=diff(my_data1.signals.values(:,1));
theta3dot=diff(my_data2.signals.values(:,1));
theta_bdot=-rw/(3*L)*(theta1dot+theta2dot+theta3dot);
theta_b=cumsum(theta_bdot,2);
for i=1:length(theta_b)-1
    J_b1=function_J(theta_b(i));
    xdot(i)=J_b1(1,1:3)*[theta1dot(i);theta2dot(i);theta2dot(i)];
    ydot(i)=J_b1(2,1:3)*[theta1dot(i);theta2dot(i);theta2dot(i)];
end
xfinal=cumsum(xdot,2);
yfinal=cumsum(ydot,2);
figure
plot(theta_b)
figure
plot(xfinal,yfinal)
