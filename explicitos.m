function [t, x] = explicitos(f, intervalo, x0, N, j)
    x(:, 1) = x0(:);
    h = (intervalo(2) - intervalo(1))/N;
    t = intervalo(1) : h : intervalo(2);
    for i = 1 : N
            M = f(t(i), x(:, i)); 
        switch j
            case 1 %Método de Euler (explícito)
                M = f(t(i), x(:, i)); 
            case 2 %Método de Euler (mejorado)
                F1 = f(t(i), x(:, i));
                F2 = f(t(i + 1), x(:, i) + h*F1);
                M = (F1+F2)/2;
            case 3 %Método de Euler (modificado)
                F1 = f(t(i), x(:, i));
                M = f(t(i) + h/2, x(:, i) + F1*h/2);
            case 4 %Método de Runge-Kutta orden 3.
                F1 = f(t(i), x(:, i));
                F2 = f(t(i) + h/2, x(:, i) + F1*h/2);
                F3 = f(t(i) + 3*h/4, x(:, i) + F2*3*h/4);
                M = (2*F1+3*F2+4*F3)/9;
            case 5 %Método de Runge-Kutta orden 4.
                F1 = f(t(i), x(:, i));
                F2 = f(t(i) + h/2, x(:, i) + F1*h/2);
                F3 = f(t(i) + h/2, x(:, i) + F2*h/2);
                F4 = f(t(i) + h, x(:, i) + F3*h);
                M = (F1 + 2*F2 + 2*F3 + F4)/6;
        end
        x(:, i + 1) = x(:, i) + M*h;
    end
    t = t(:);
    x = x.';
end