function [y] = generate_vector(A, r)
[An, n] = get_linear(A);
[U,S,V] = compress_svd(An,r);

A_approx = U*S*V';
A_approx = A_approx' + n;

y = zeros(r, size(A_approx, 1));
for i = 1 : size(A_approx, 1)
    y(:,i) = U(:,1:r) \ A_approx(i,:)';
end
end