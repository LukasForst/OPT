function [An, n] = get_linear(A)
avg = sum(A) / size(A,1);
n = avg(ones(size(A,1),1),:);
An = A - n;
end