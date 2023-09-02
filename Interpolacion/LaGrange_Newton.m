string_input_by_user = input("Función (string) ", 's');
f = str2func(['@(x)', string_input_by_user]);
x = input("Puntos ");
n = length(x);
h = [0 1];
M =zeros(n,n+1);
M(:,1) = x;
for i = 1 : n
    M(i,2) = f(x(i));
end

p = [0 M(1, 2)];

for i = 2 : n
    for j = i : n
        M(j,i+1) = (M(j,i)-M(j-1,i))/(x(j)-x(j-i+1));
    end
    h = conv(h, [1, -x(i - 1)]);
    p = [0 p] + M(i, i+1)*h;
end

xD = [min(x):0.1:max(x)];
fplot(f,[min(x) max(x)]);
hold on
plot(xD, polyval(p, xD));

resp = input("Añadir un punto? (S: 1/N: 0)");
if resp == 1
    n = n + 1;
    punto = input("Punto ");
    x = [x punto];
    M =zeros(n,n+1);
    M(:,1) = x;
    for i = 1 : n
        M(i,2) = f(x(i));
    end
    for i = 2 : n
        for j = i : n
            M(j,i+1) = (M(j,i)-M(j-1,i))/(x(j)-x(j-i+1));
        end
    end
    h = conv(h, [1, -x(n - 1)]);
    p = [0 p] + M(i,i+1)*h;
    xD = [min(x):0.1:max(x)];
    fplot(f,[min(x) max(x)]);
    hold on
    plot(xD, polyval(p, xD));
end