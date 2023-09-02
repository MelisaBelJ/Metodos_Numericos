function [t, x] = mmilne4bdf5(f, intervalo, x0, N)
% La función mmilne4bdf5 resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de predicción-corrección con predictor Milne de 4 pasos y corrector BDF de 5 pasos.
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
    [~, x] = rk4(f, [t(1),t(5)], x0, 4); %x1 con runge kutta orden 4
    x = x.';
    y = [f(t(4), x(:, 4)), f(t(3), x(:, 3)), [0;0]];
    for i = 1 : N-4
        y = [f(t(i + 4), x(:, i + 4)), y(:, 1), y(:, 2)];        %f calculado con el x nuevo
        x(:, i + 5) = x(:, i+1) + (4*h/3)*(2*y(:, 1) - y(:, 2) + 2*y(:, 3));  %x(i+5) con milne
        x(:, i + 5) = (12*x(:, i) - 75*x(:, i + 1) + 200*x(:, i + 2) - 300*x(:, i + 3) + 300*x(:, i + 4) + h*60*f(t(i + 5), x(:, i + 5)))/137; %x(i+5) con bdf
    end
    t = t(:);
    x = x.';
end