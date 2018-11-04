function [a, M, b] = ar_fit_model(y, p)
% function [a, M, b] = ar_fit_model(y)
%
% INPUT:
% y : N-by-1 vector, sound signal
%
% p : required order of AR model
%
% OUTPUT:
% a: (p+1)-by-1 vector, estimated parameters of AR model 
% 
% ordering of vector *a* is such that: 
%   a(1) = a_0 [ from Eq. (2) in this Task description ]
%   a(2) = a_1 [ from Eq. (2) in this Task description ]
%   .
%   .
%   a(p+1) = a_p [ from Eq. (2) in this Task description ]
%
% M, b: matrix and vector as in the Task description, 
%       M*a = b (in LSQ sense) 

% discard the code from here and implement the functionality:


T = length(y);
rows = T - p;
columns = p + 1;

b = y(columns : T);
M = [ones(rows, 1), zeros(rows, columns - 1)];

for i = 2 : columns
    M(: , i) = y(p - i + 2 : T - i + 1);
end

a = M\b;
end


