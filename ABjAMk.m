function [t, x] = ABjAMk(f, intervalo, x0, N, j, k)
    h = (intervalo(2) - intervalo(1))/N;
    t = intervalo(1) : h : intervalo(2);
    [~, x] = explicitos(f, [t(1),t(j)], x0, j-1, 3);
    x = x.';
    y = zeros(2, j);
    for i = 1:j-1
        y(:, i) = f(t(j-1), x(:, j-1));
    end
    for i = 1 : N-(j-1)
         y(:, 1) = f(t(i + j-1), x(:, i + j-1));
        for aux = 2:j
            y(:, i) = y(:, aux-1);
        end        
        switch j
            case 5
                M = (1901*y(:, 1) - 2774*y(:, 2)  + 2616*y(:, 3) - 1274*y(:, 4) + 251*y(:, 5))/720;                
            case 4
                M = (55*y(:, 1) - 59*y(:, 2) + 37*y(:, 3) - 9*y(:, 4))/24;
            case 3
                M = (23*y(:, 1) - 16*y(:, 2) + 5*y(:, 3))/12;
            case 2
                M =  (3*y(:, 1) - y(:, 2))/2;
        end
        x(:, i + j) = x(:, i + j-1) + h*M;
        if(k ~= 0) %Metodo corrector P(EC)P
            switch j             
                case 4
                    M = (251*f(t(i + j), x(:, i + j)) + 646*y(:, 1) - 264*y(:, 2) + 106*y(:, 3) - 19*y(:, 4))/720; %x(i+4) con adam-moulton
                case 3
                    M = (9*f(t(i + j), x(:, i + j)) + 19*y(:, 1) - 5*y(:, 2) + y(:, 3))/24; %x(i+3) con adam-moulton                    
                case 2
                    M = (5*f(t(i + j), x(:, i + j)) + 8*y(:, 1) - y(:, 2))/12; %x(i+2) con adam-moulton                    
            end
            x(:, i + j) = x(:, i + j-1) + h*M; 
        end
    end
    t = t(:);
    x = x.';
end