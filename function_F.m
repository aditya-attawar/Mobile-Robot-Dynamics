function F = get_F(th_b) 
rw = 0.032; 
L = 0.101;  % Note: Check value of L in lab! TA-built omnibots can vary each year. 
a = (2*pi/3)*[-1 0 1]; % alpha angles, of wheels, wrt body frame
F=[sin(th_b+a(1))/rw -cos(th_b+a(1))/rw -L/rw;
    sin(th_b+a(2))/rw -cos(th_b+a(2))/rw -L/rw;
    sin(th_b+a(3))/rw -cos(th_b+a(3))/rw -L/rw];
end