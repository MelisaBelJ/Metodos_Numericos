%Resolución de sistemas A*u=b mediante el método Cholesky

A=input('Introducir matriz simétrica y definida positiva ');
n=length(A);
for i=2:n
    B(1,1)=sqrt(A(1,1));
    B(i,1)=A(1,i)/B(1,1);
end
for i=2:n
    for j=i:n
       B(i,i)=sqrt(A(i,i)-B(i,1:i-1)*B(i,1:i-1)');
       B(j,i)=(A(i,j)-B(i,1:i-1)*B(j,1:i-1)')/B(i,i);
    end
end
disp('B = ')
disp(B)
C=B';
resp=1;
while resp == 1
b=input('Introducir b ');
w(1)=b(1)/B(1,1);
for i=2:n
   w(i)=(b(i)-B(i,1:i-1)*w(1:i-1)')/B(i,i);
end
u(n)=w(n)/C(n,n);
for i=n-1:-1:1
   u(i)=(w(i)-C(i,i+1:n)*u(i+1:n)')/C(i,i);
end
disp('u = ')
disp(u)
resp=input('Si desea resolver otro sistema para esa matriz, pulsar 1 + enter, si desea salir, puslar otro numero + enter');
end
