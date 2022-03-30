%%% RRBot problem (2 distributed mass link system)

%% Dynamic Equations
syms theta1 theta2 theta1_dot theta2_dot theta1_ddot theta2_ddot tau1 tau2 g 'real'
syms M1 M2 I1 I2 L1 L2 r1 r2 'real'
syms x1_dot y1_dot x2_dot y2_dot

x1_dot = (theta1_dot)*(r1)*(cos(theta1));
y1_dot = -(theta1_dot)*(r1)*(sin(theta1));

x2_dot = (theta1_dot)*(L1)*(cos(theta1)) + (theta1_dot + theta2_dot)*(r2)*(cos(theta1 + theta2));
y2_dot = -(theta1_dot)*(L1)*(sin(theta1)) - (theta1_dot + theta2_dot)*(r2)*(sin(theta1 + theta2));

K1 = (1/2)*(I1)*(theta1_dot*theta1_dot) + (1/2)*(M1)*((x1_dot*x1_dot) + (y1_dot*y1_dot));
K2 = (1/2)*(I2)*((theta2_dot + theta1_dot)*(theta2_dot + theta1_dot)) + (1/2)*(M2)*((x2_dot*x2_dot) + (y2_dot*y2_dot));

P1 = M1*g*r1*cos(theta1);
P2 = M2*g*(L1*(cos(theta1)) + r2*(cos(theta1 + theta2)));
L = K1 + K2 - P1 - P2;

q = [theta1;theta2];
dq = [theta1_dot; theta2_dot];
ddq = [theta1_ddot; theta2_ddot];

DL_Dq = gradient(L,q);  % used gradient instead of jacobian to keep matrix size consistent
DL_Ddq = gradient(L,dq); % used gradient instead of jacobian to keep matrix size consistent
dDL_dtDdq = jacobian(DL_Ddq,[q;dq])*[dq;ddq];

EOM = simplify(dDL_dtDdq - DL_Dq)






    