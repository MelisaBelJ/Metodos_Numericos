function [B] = factorizacionCh(A)

[n,m]=size(A);
B = zeros(n,m);

if n == m 
    for i = 1 : n
        %La diagonal
        B(i,i) = A(i,i);
        for k = 1 : (i-1)
            B(i,i)= B(i,i) - B(i,k)*B(i,k);
        end
        if(B(i,i)<0)
            fprintf("No es definida positiva \n");
            return
        end
        B(i,i) = sqrt(B(i,i));
        
        %Debajo de la diagonal
        for j = (i+1) : n
            B(j,i)= A(i,j);
            for k = 1 : (i-1)
                B(j,i) = B(j,i) - B(i,k)*B(j,k);
            end
            B(j,i) = B(j,i)/B(i,i);
        end
    end
else
    fprintf("No se puede hacer \n");
end
end