s = size(x, 2); % Numero de columnas de la matriz x
color = ['r','g','b'];
figure(1)
for i = 1 : s
    subplot(s, 1, i)
    plot(t, x(:, i), color(i))
    title(sprintf('Coordenada %d de la solucion', i))
end
if (s > 1)
    pause(3)
    figure(2)
    if (s == 2)
        plot(x(:, 1), x(:, 2), 'r')
    else
        plot3(x(:, 1), x(:, 2), x(:, 3), 'r')
    end
    title('Trayectoria de la solucion')
end