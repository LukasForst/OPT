function [x] = solve_ls(A, b)
% function [x] = solve_ls(A, b)
%
% implements A\b using QR decomposition.
%
% INPUT: 
% A: an M-by-N matrix. It is assumed that that M>=N and 
% that A has full rank (=N). 
%
% b: an M-by-1 vector
%
% OUTPUT: 
% x: an N-by-1 vector, solving Ax=b in LSQ sense.

% discard the code from here and implement the functionality:

[Q,R] = qr(A,0);
[~,n] = size(A);

y = Q.' * b;
x = zeros(n, 1);

x(n) = y(n)/ R(n,n);
for i = n : -1 : 1
    x(i) = (y(i) - R(i,i+1:end) * x(i+1:end)) / R(i,i);
end

end

