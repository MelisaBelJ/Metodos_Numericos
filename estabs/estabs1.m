m = 50;
f = @(t,x) (-m*(x-cos(t)));
g = @(t) ((m^2/(1+m^2))*(cos(t)-exp(-m*t)+sin(t)/m));
x0 = 0;
intervalo=[0;1];

N1 = 24;
N2 = 26;

h1 = (intervalo(2) - intervalo(1))/N1;
h2 = (intervalo(2) - intervalo(1))/N2;

t1 = intervalo(1) : h1 : intervalo(2);
t2 = intervalo(1) : h2 : intervalo(2);

x1(:, 1) = x0(:);
x2(:, 1) = x0(:);


for i = 1 : N1
    x1(:, i + 1) = x1(:, i) + h1*f(t1(i), x1(:, i));
end

for i=1:N2
    x2(:, i + 1) = x2(:, i) + h2*f(t2(i), x2(:, i));
end


plot(t1, x1)
hold on
plot(t2, x2)
fplot(g, [0, 1])



