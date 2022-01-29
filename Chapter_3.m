clear all
clc
format longG
global g1 g2 a11 a12 a21 a22 b1 b2
a11 = -0.25;
a12 = 3;
a21 = -5;
a22 = -1;
b1 = 1;
b2 = 2.2;
g1 = 3;
g2 = 3;
T = 0:0.01:100;
arxikes_times = [0 0 0 0 0 0 0 0 0 0];
[t, y] = ode45(@odefun_paralili_MIMO, T, arxikes_times);

subplot(2,2,1)
plot(t,y(:,3))
title('Παράμετρος α_1_1');

subplot(2,2,2)
plot(t,y(:,4))
title('Παράμετρος α_1_2');

subplot(2,2,3)
plot(t,y(:,5))
title('Παράμετρος α_2_1');
subplot(2,2,4)
plot(t,y(:,6))
title('Παράμετρος α_2_2');

figure
subplot(2,1,1)
plot(t,y(:,7))
title('Παράμετρος b_1');

subplot(2,1,2)
plot(t,y(:,8))
title('Παράμετρος b_2');

figure
subplot(2,2,1)
plot(t,y(:,9))
title('Γραφική παράσταση της x_h_a_t_1');

subplot(2,2,2)
plot(t,y(:,10))
title('Γραφική παράσταση της x_h_a_t_2');

subplot(2,2,3)
plot(t,y(:,1))
title('Γραφική παράσταση της x_1');

subplot(2,2,4)
plot(t,y(:,2))
title('Γραφική παράσταση της x_2');

subplot(2,2,[1,2])
plot(t,y(:,9))
hold on
plot(t,y(:,1))
legend({'x_h_a_t_1', 'x_1'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση γραφικών παραστάσεων x_1 και x_h_a_t_1');
hold off
subplot(2,2,[3,4])
plot(t,y(:,10))
hold on
plot(t,y(:,2))
legend({'x_h_a_t_2', 'x_2'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση γραφικών παραστάσεων x_2 και x_h_a_t_2');
hold off

function dydt = odefun_paralili_MIMO(t,y)
    global g1 g2 a11 a12 a21 a22 b1 b2
    u=10*sin(2*t)+5*sin(7.5*t);
    dy_1=a11*y(1)+a12*y(2)+b1*u;
    dy_2=a21*y(1)+a22*y(2)+b2*u;
    dy_3=g1*(y(1)-y(9))*y(9);
    dy_4=g1*(y(1)-y(9))*y(10);
    dy_5=g1*(y(2)-y(10))*y(9);
    dy_6=g1*(y(2)-y(10))*y(10);
    dy_7=g2*(y(1)-y(9))*u;
    dy_8=g2*(y(2)-y(10))*u;
    dy_9=y(3)*y(9)+y(4)*y(10)+y(7)*u;
    dy_10=y(5)*y(9)+y(6)*y(10)+y(8)*u;
    dydt = [dy_1; dy_2; dy_3; dy_4; dy_5; dy_6; dy_7; dy_8; dy_9; dy_10];
end
