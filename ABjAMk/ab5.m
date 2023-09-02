function [t, x] = ab5(f, intervalo, x0, N)
% La función mpuntomedio resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de Adams-Bashforth de 5 pasos.
%
% ENTRADA:
% f: nombre de la función (definida en formato anónimo o como fichero de tipo función de Matlab)
% del problema que se quiere resolver, con dos argumentos de entrada: el primero es un
% número real y el segundo es un vector columna de tipo (n,1) o un vector fila de tipo (1,n)
% intervalo: [t0,T], donde está planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: número de subintervalos
%
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la solución de tipo (N+1,1)
% x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)
    h = (intervalo(2) - intervalo(1))/N;
    t = intervalo(1) : h : intervalo(2);
    [~, x] = rk4(f, [t(1),t(5)], x0, 4);
    x = x.';
    y = [f(t(4), x(:, 4)),f(t(3), x(:, 3)), f(t(2), x(:, 2)),  f(t(1), x(:, 1)), [0;0]];
    for i = 1 : N-4
        y = [f(t(i + 4), x(:, i + 4)), y(:, 1), y(:, 2), y(:, 3), y(:, 4)];
        x(:, i + 5) = x(:, i + 4) + (h/720)*(1901*y(:, 1) - 2774*y(:, 2)  + 2616*y(:, 3) - 1274*y(:, 4) + 251*y(:, 5));
    end
    t = t(:);
    x = x.';
end