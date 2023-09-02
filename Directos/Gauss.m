%Metodo de eliminacion de Gauss con pivote parcial
n = input("Filas/Columnas de A ");

A = zeros(n, n);
for k = 1:n
    A(k, 1:n) =  input(sprintf("Fila %d de A ", k));
end

%Comprobar que A es inversible y que se pueden multiplicar A y b
if (det(A) ~= 0)
    %
    punt = (1:n);
    for i = 1 : (n-1)
        %mayor valor en la columna k
        mayor = abs(A(i, i));
        aux = i;
        for j = (i+1) : n
            if abs(A(punt(j), i)) > mayor
                mayor = abs(A(punt(j), i));
                aux = j;
            end
        end
        %guardar el valor en el puntero
        if aux ~= i
            mayor = punt(i);
            punt(i) = punt(aux);
            punt(aux) = mayor;
        end
        
        %Multiplicador (L)
        for k = (i+1) : n
            A(punt(k), i) = A(punt(k), i) / A(punt(i), i);
            for j = i+1 : n
                A(punt(k), j) = A(punt(k), j) - A(punt(k), i)*A(punt(i),j);
            end
        end
    end
    resp = 1;
     while resp == 1  
        b = input("Vector b ");
        b = b(:);
         if(isequal(size(b), [n,1]))
            % Solucion
            w = zeros(n, 1);
            w(1) = b(punt(1));
            for i = 2 : n
                w(i) = b(punt(i));
                for j = 1 : (i-1)
                    w(i) = w(i) - A(punt(i),j)*w(j);
                end
            end

            u = zeros(n, 1);
            u(n) = w(n)/A(punt(n),n);
            for i = (n-1) : -1 : 1
                u(i) = w(i);
                for j = (i+1) : n
                    u(i) = u(i) - A(punt(i),j)*u(j);
                end
                u(i) = u(i)/A(punt(i),i);
            end
            disp(u)
        resp = input("Otro b? (Si:1  No:0) ");
            
         else
            fprintf("No se puede hacer \n");
         end
     end
else
    fprintf("No se puede hacer \n");
end