a = 0.1;
b = 1;
T = 150;
x0 = 0.1;
v0 = 0.1;

f = @(t,x) [x(2); -a*((x(1)^2)-b)*x(2)-x(1)];
opciones=odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);
[t1, x1] = ode45(f, [0, T], [x0, v0], opciones);
opciones=odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);
[t2, x2] = ode15s(f, [0, T], [x0, v0], opciones);
figure(1)
plot(x1(:, 1), x1(:, 2));
figure(2)
plot(x2(:, 1), x2(:, 2));
figure(3)
plot(t1, 'r')
legend([0,diff(t1)']);
hold on
plot(t2, 'g')