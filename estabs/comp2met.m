function comp2met(alg1,alg2)
    datos
    [t,x1] = alg1(f,intervalo,x0,N);
    if isequal(alg2,"@ode45")
        [~,x2] = alg2(f,t,x0);
    else
        [~,x2] = alg2(f,intervalo,x0,N);
    end
    m = size(x1,2);
    x = (x1-x2);
    
    figure(1)
    for i = 1 : m
        subplot(m, 1, i)
        plot(t, x1(:, i), 'r')
        hold on
        plot(t, x2(:, i), 'g')
        title(sprintf('Coordenada %d de la solucion 1', i))
    end
    pause(3)
    
    figure(2)
    for i = 1 : m
        subplot(m, 1, i)
        plot(t, x(:, i), 'b')
        title('Diferencia entre las soluciones')
    end
    pause(3)
    
    figure(3)
    ninf = max(max(abs(x)));
    s = sprintf('Dferencia entre las soluciones %d \n', ninf);
    fprintf(s);
    plot(t, ones(size(t))*ninf,'b')
    title('Norma infinito de la diferencia entre las soluciones')
    legend(s);
end