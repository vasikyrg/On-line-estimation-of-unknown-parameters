clear all
clc
format longG
global g1 g2 a b n0 f
a=2;
b=1;
g1=7;
g2=1;
n0 =1.2;
f=25;
T = 0:0.01:20;
arxikes_times = [0 0 0 0];
%PARALILLI TOPOLOGIA
%Ode gia xwris thorivo
[t, x] = ode45(@odefun_paralili_xwris_thorivo, T, arxikes_times);

subplot(2,2,1)
plot(t,x(:,1))
title('Γραφική Παράσταση της x');
 
subplot(2,2,2)
plot(t,x(:,4))
title('Γραφική παράσταση του x καπελάκι');

subplot(2,2,[3,4])
plot(t,x(:,4))
hold on
plot(t,x(:,1))
legend({'x_h_a_t', 'x'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση γραφικών παραστάσεων x και x_h_a_t');
hold off

%Ode gia me thorivo
[t, y] = ode45(@odefun_paralili_me_thorivo, T, arxikes_times);

%Sygkriseis metaksi twn a kai b me kai xwris thorivo

subplot(2,2,1)
plot(t,x(:,2))
title('Παράμετρος α χωρίς θόρυβο');

subplot(2,2,2)
plot(t,y(:,2))
title('Παράμετρος α με θόρυβο');

subplot(2,2,[3,4])
plot(t,x(:,2))
hold on
plot(t,y(:,2))
legend({'α χωρίς θόρυβο', 'α με θόρυβο'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση της παραμέτρου α με και χωρίς θόρυβο');
hold off

figure
subplot(2,2,1)
plot(t,x(:,3))
title('Παράμετρος b χωρίς θόρυβο');

subplot(2,2,2)
plot(t,y(:,3))
title('Παράμετρος b με θόρυβο');

subplot(2,2,[3,4])
plot(t,x(:,3))
hold on
plot(t,y(:,3))
legend({'b χωρίς θόρυβο', 'b με θόρυβο'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση της παραμέτρου b με και χωρίς θόρυβο');
hold off

%MIKTI TOPOLOGIA
%Ode gia xwris thorivo
[t, ym1] = ode45(@odefun_mikti_xwris_thorivo, T, arxikes_times);
subplot(2,2,1)
plot(t,ym1(:,1))
title('Γραφική Παράσταση της x');
 
subplot(2,2,2)
plot(t,ym1(:,4))
title('Γραφική παράσταση του x καπελάκι');

subplot(2,2,[3,4])
plot(t,ym1(:,4))
hold on
plot(t,ym1(:,1))
legend({'x_h_a_t', 'x'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση γραφικών παραστάσεων x και x_h_a_t');
hold off
[t, ym2] = ode45(@odefun_mikti_me_thorivo, T, arxikes_times);

%Sygkriseis metaksi twn a kai b me kai xwris thorivo
figure
subplot(2,2,1)
plot(t,ym1(:,2))
title('Παράμετρος α χωρίς θόρυβο');

subplot(2,2,2)
plot(t,ym2(:,2))
title('Παράμετρος α με θόρυβο');

subplot(2,2,[3,4])
plot(t,ym1(:,2))
hold on
plot(t,ym2(:,2))
legend({'α χωρίς θόρυβο', 'α με θόρυβο'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση της παραμέτρου α με και χωρίς θόρυβο');
hold off

figure
subplot(2,2,1)
plot(t,ym1(:,3))
title('Παράμετρος b χωρίς θόρυβο');

subplot(2,2,2)
plot(t,ym2(:,3))
title('Παράμετρος b με θόρυβο');

subplot(2,2,[3,4])
plot(t,ym1(:,3))
hold on
plot(t,ym2(:,3))
legend({'b χωρίς θόρυβο', 'b με θόρυβο'});
ylabel('')
xlabel('Time [s]')
title('Σύγκριση της παραμέτρου b με και χωρίς θόρυβο');
hold off

%Synartisi odefun gia thn dimioyrgia ths diaforikis Gia parallili
%topologia xwris thorivo
function dydt = odefun_paralili_xwris_thorivo(t,x)
    global g1 g2 a b 
    u=5*sin(3*t);
    dy_1=-a*x(1)+b*u;
    dy_2=-g1*(x(1)-x(4))*x(4);
    dy_3=g2*(x(1)-x(4))*u;
    dy_4=-x(2)*x(4)+x(3)*u;
    dydt = [dy_1; dy_2; dy_3; dy_4];
end
%Synartisi odefun gia thn dimioyrgia ths diaforikis Gia parallili
%topologia me thorivo
function dydt = odefun_paralili_me_thorivo(t,x)
    global g1 g2 a b n0 f
    u=5*sin(3*t);
    n=n0*sin(2*pi*f*t);
    dy_1=-a*x(1)+b*u;
    dy_2=-g1*(x(1)+n-x(4))*x(4);
    dy_3=g2*(x(1)+n-x(4))*u;
    dy_4=-x(2)*x(4)+x(3)*u;
    dydt = [dy_1; dy_2; dy_3; dy_4];
end
%Synartisi odefun gia thn dimioyrgia ths diaforikis Gia mikti
%topologia xwris thorivo
function dydt = odefun_mikti_xwris_thorivo(t,x)
    global g1 g2 a b 
    u=5*sin(3*t);
    dy_1=-a*x(1)+b*u;
    dy_2=-g1*(x(1)-x(4))*x(1);
    dy_3=g2*(x(1)-x(4))*u;
    dy_4=-x(2)*x(4)+x(3)*u;
    dydt = [dy_1; dy_2; dy_3; dy_4];
end
%Synartisi odefun gia thn dimioyrgia ths diaforikis Gia mikti
%topologia me thorivo
function dydt = odefun_mikti_me_thorivo(t,x)
    global g1 g2 a b n0 f
    u=5*sin(3*t);
    n=n0*sin(2*pi*f*t);
    dy_1=-a*x(1)+b*u;
    dy_2=-g1*(x(1)+n-x(4))*(x(1)+n);
    dy_3=g2*(x(1)+n-x(4))*u;
    dy_4=-x(2)*x(4)+x(3)*u;
    dydt = [dy_1; dy_2; dy_3; dy_4];
end