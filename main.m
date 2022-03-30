clear; clc; close all;

visualization = true;

T = 10;
theta1_initial = 200;
theta2_initial = 125;


y0 = [deg2rad(theta1_initial), deg2rad(theta2_initial) 0, 0];

[t,y] = ode45(@ode_rrbot,[0,T],y0);



%% visualization 
if(visualization)

    l1 = 1;
    l2 = 1;
    
    x1_pos= l1*sin(y(:,1));
    x2_pos= l1*sin(y(:,1)) + l2*sin(y(:,1)+y(:,2));
    y1_pos= l1*cos(y(:,1));
    y2_pos= l1*cos(y(:,1)) + l2*cos(y(:,1)+y(:,2));
    for i=1:size(y)
        plot([0 x1_pos(i) x2_pos(i)],[0 y1_pos(i) y2_pos(i)])
        xlim([-2 2])
        ylim([-2 0])
        pause(0.05)
    end
end


figure(2)
hold on
subplot(2,2,1)
plot(t,y(:,1))
xlabel('Time step')
ylabel('rad')
title('theta1')

subplot(2,2,2)
plot(t,y(:,2))
xlabel('Time step')
ylabel('rad')
title('theta2')

subplot(2,2,3)
plot(t,y(:,3))
xlabel('Time step')
ylabel('rad/s')
title('theta1-dot')

subplot(2,2,4)
plot(t,y(:,4))
xlabel('Time step')
ylabel('rad/s')
title('theta2-dot')


