function [t, x] = ab2am2(f, intervalo, x0, N)
% La función ab2am2 resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de predicción-corrección con predictor Adams-Bashford de 2 pasos y corrector Adams-Moulton de 2 pasos.
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
    [~, x] = meulermej(f, [t(1);t(2)], x0, 1); %x1 con euler mejorado
    x = x.';
    y = [f(t(2), x(:, 2)), f(t(1), x(:, 1)), [0;0]];
    for i = 1 : N-1
        x(:, i + 2) = x(:, i + 1) + (h/2)*(3*y(:, 1) - y(:, 2)); %x(i+2) con adam-bashford
        x(:, i + 2) = x(:, i + 1) + (h/12)*(5*f(t(i + 2), x(:, i + 2)) + 8*y(:, 1) - y(:, 2)); %x(i+2) con adam-moulton
        y = [f(t(i + 2), x(:, i + 2)), y(:, 1), y(:, 2)];        %f calculado con el x nuevo
    end
    t = t(:);
    x = x.';
end

