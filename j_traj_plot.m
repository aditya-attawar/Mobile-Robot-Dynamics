figure(10)
plot(my_data.time,my_data.signals.values(:,1))
hold on
plot(my_data1.time,my_data1.signals.values(:,1))
plot(my_data2.time,my_data2.signals.values(:,1))

plot(my_data.time,my_data.signals.values(:,4),'--')
plot(my_data1.time,my_data1.signals.values(:,4),'--')
plot(my_data2.time,my_data2.signals.values(:,4),'--')

legend('1p','2p','3p','1t','2t','3t');