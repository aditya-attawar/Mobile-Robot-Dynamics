function J = get_J(th_b) 

rw = 0.032; 
L = 0.101;  % Note: Check value of L in lab! TA-built omnibots can vary each year. 
a = (2*pi/3)*[-1 0 1]; % alpha angles, of wheels, wrt body frame
J=[sin(th_b+a(1))*2*rw/3 sin(th_b+a(2))*2*rw/3 sin(th_b+a(3))*2*rw/3;
    -cos(th_b+a(1))*2*rw/3 -cos(th_b+a(2))*2*rw/3 -cos(th_b+a(3))*2*rw/3;
    -rw/(3*L) -rw/(3*L) -rw/(3*L)];
end