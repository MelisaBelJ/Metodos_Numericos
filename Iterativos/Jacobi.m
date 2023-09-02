%Resolución de sistemas A*u=b mediante método Jacobi

A=input(' Introducir matriz ');
n=length(A);
D=diag(diag(A));
I=eye(n);
J=I-inv(D)*A;
e=eig(J);
if max(e)>= 1
    disp('El método de Jacobi asociado a la matriz A no converge')
else
    b=input('Introducir segundo miembro ');
    b=b';
    k=input('Introducir numero de iteraciones ');
    err=input('Introducir la precision ');
    u=input('Introducir vector inicial aleatorio ');
    u=u';
    j=0;
    r = b;
    while j<k && (norm(r)/norm(b))>=err
        for i=1:n
            r(i)=b(i)-A(i,1:n)*u(1:n);
            u(i)=u(i)+r(i)/A(i,i);
        end
        j=j+1;
    end
    disp('u = ')
    disp(u)
end