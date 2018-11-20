load data_A.mat
[An, n] = get_linear(A);
[U,S,V] = svd(An');

Sr = S;
Sr(2,2) = 0;
Ar = (U * Sr * V');
Ar = Ar' + n;

% print blue 
scatter(A(:,1),A(:,2),'b'); 
hold on;

% print red
scatter(Ar(:,1),Ar(:,2),'r');
axis equal;
hold off;

norm(Sr-S, 'fro')^2 % \sum_{i=1}^{m} ||a_i-\tilde{a}_i||^2 = 24.2419
