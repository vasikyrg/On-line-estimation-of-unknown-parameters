clear all
clc
format longG
global g am a b
g=40;
am=5;
a=2;
b=1;
T = 0:0.01:30;
arxikes_times = [0 0 0 0 0];

[t, x] = ode45(@odefun, T, arxikes_times);
figure
plot(t,am-x(:,2))
ylabel('προσεγγιστικό a')
xlabel('Time [s]')
title('Παράμετρος α');
figure
plot(t,x(:,3))
ylabel('προσεγγιστικό b')
xlabel('Time [s]')
title('Παράμετρος b');
figure
plot(t,x(:,1))
ylabel('x hat')
xlabel('Time [s]')
title('Γραφική παράσταση του x καπελάκι');
%Synartisi odefun gia thn dimioyrgia ths diaforikis twn proseggistikwn timwn
function dydt = odefun(t,x)
    global g am a b
    u=5*sin(3*t);
    dy_1=-a*x(1)+b*u;
    dy_2=g*(x(1)-(x(2)*x(4)+x(3)*x(5)))*x(4);
    dy_3=g*(x(1)-(x(2)*x(4)+x(3)*x(5)))*x(5);
    dy_4=-am*x(4)+x(1);
    dy_5=-am*x(5)+u;
    dydt = [dy_1; dy_2; dy_3; dy_4; dy_5];
end
