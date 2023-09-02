m = 50;
f = @(t,x) (-m*(x-cos(t)));
g = @(t) ((m^2/(1+m^2))*(cos(t)-exp(-m*t)+sin(t)/m));
x0 = 0;
intervalo=[0;1];

N = 24;

h = (intervalo(2) - intervalo(1))/N;

t = intervalo(1) : h : intervalo(2);

x(:, 1) = x0(:);


for i = 1 : N
    x(:, i + 1) = (x(:, i) + h*m*cos(t(i + 1)))/(1 + m*h);
end


plot(t, x)
hold on
fplot(g, [0, 1])



