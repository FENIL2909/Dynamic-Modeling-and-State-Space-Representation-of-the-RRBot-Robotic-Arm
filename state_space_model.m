%% State Space Model

X = sym('X', [4,1]);
X(1) = theta1;
X(2) = theta2;
X(3) = theta1_dot;
X(4) = theta2_dot;

eq1 = I1*theta1_ddot + I2*theta1_ddot + I2*theta2_ddot + L1^2*M2*theta1_ddot + M1*r1^2*theta1_ddot + M2*r2^2*theta1_ddot + M2*r2^2*theta2_ddot - M2*g*r2*sin(theta1 + theta2) - L1*M2*g*sin(theta1) - M1*g*r1*sin(theta1) - L1*M2*r2*theta2_dot^2*sin(theta2) + 2*L1*M2*r2*theta1_ddot*cos(theta2) + L1*M2*r2*theta2_ddot*cos(theta2) - 2*L1*M2*r2*theta1_dot*theta2_dot*sin(theta2) - tau1;
eq2 = I2*theta1_ddot + I2*theta2_ddot + M2*r2^2*theta1_ddot + M2*r2^2*theta2_ddot - M2*g*r2*sin(theta1 + theta2) + L1*M2*r2*theta1_dot^2*sin(theta2) + L1*M2*r2*theta1_ddot*cos(theta2) - tau2; 
sol = solve([eq1==0, eq2==0],[theta1_ddot,theta2_ddot]);

display(simplify(sol.theta1_ddot))
display(simplify(sol.theta2_ddot))