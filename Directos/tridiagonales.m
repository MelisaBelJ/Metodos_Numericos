function [g] = tridiagonales (A, d)

[n, m] = size(A);
if n == m
    m = diag(A);
    g = zeros(n, 1);
    g(1) = d(1)/m(1);
    for i = 2:n
        g(i) = (d(i) - g(i-1)*A(i,i-1))/m(i);
        m(i) = m(i)-(A(i-1,i)/m(i-1))*A(i,i-1);
    end
    for i = n-1:-1:1
        g(i) = g(i) - (A(i, i+1)/m(i))*g(i+1);
    end
else
    fprintf("No se puede hacer \n");
end
disp(g);
end