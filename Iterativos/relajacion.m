% %Resolución de sistemas A*u=b mediante método Relajación

A = input(' Introducir matriz ');
b = input('Introducir segundo miembro ');
maxIter = input('Introducir numero de iteraciones ');
tolerancia = input('Introducir la precision ');
x = input('Introducir vector inicial aleatorio ');
w = input('Introducir parámetro ');
x = x(:);
aux = b - A*x;
b = w * b;
M = w * tril(A,-1) + diag(diag(A));
N = -w * triu(A,1) + (1.0 - w) * diag(diag(A));
e=eig(N);
if max(e)>= 1
    disp('El método de Jacobi asociado a la matriz A no converge')
else
b = b(:);
while norm(aux)/norm(x)>= tolerancia && maxIter>0
    aux = x;
    x = M \ ( N*x + b);
    maxIter = maxIter - 1;
    aux = x - aux;
end
disp(x)
end