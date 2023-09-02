function [t, x] = ab3(f, intervalo, x0, N)
% La función mpuntomedio resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de Adams-Bashforth de 3 pasos.
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
    [~, x] = meuler(f, [t(1),t(3)], x0, 2);
    x = x.';
    y = [f(t(2), x(:, 2)), f(t(1), x(:, 1)), [0;0]];
    for i = 1 : N-2
        y = [f(t(i + 2), x(:, i + 2)), y(:, 1); y(:, 2)];
        x(:, i + 3) = x(:, i + 2) + (h/12)*(23*y(:, 1) - 16*y(:, 2) + 5*y(:, 3));
    end
    t = t(:);
    x = x.';
end