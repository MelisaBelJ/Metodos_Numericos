%Resolución del sistema A*u=b mediante factorización LU

A=input('Introducir matriz ');
n=length(A);
if det(A)== 0
    disp(' La matriz no es inversible ')
else
    L = zeros(n, n);
    U = zeros(n, n);
    for i=1:n
        U(1,i)=A(1,i);
        L(i,1)=A(i,1)/U(1,1);
    end
    for i=2:n
        for j=i:n
            U(i,j)=A(i,j)-L(i,1:i-1)*U(1:i-1,j);
            L(j,i)=(A(j,i)-L(j,1:i-1)*U(1:i-1,i))/U(i,i);
        end
        L(i,i)=1;
    end
    disp('L = ')
    disp(L)
    disp('U = ')
    disp(U)
    resp=1;
    while resp == 1
        b=input('Introducir b ');
        w(1)=b(1);
        for i=2:n
            w(i)=(b(i)-L(i,1:i-1)*w(1:i-1)');
        end
        u(n)=w(n)/U(n,n);
        for i = n-1 : -1 : 1
            u(i)=(w(i)-U(i,i+1:n)*u(i+1:n)')/U(i,i);
        end
        disp('u = ')
        disp(u)
        resp=input('Si desea resolver otro sistema para esa matriz, pulsar 1 + enter, si desea salir, puslar otro numero + enter');
    end
end

