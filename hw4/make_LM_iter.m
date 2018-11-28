function [x_new, success] = make_LM_iter(x, a, mu)
% function [x_new, success] = make_LM_iter(x, a, mu)
% 
% makes the Levenberg-Marquardt iteration. 
%
% INPUT:
% x, a   are as usual (see dist.m for explanation) 
% mu is the damping factor (the factor which multiplies the
% regularizing identity matrix)
%
% OUTPUT: 
% success == 1 if the iteration is successful, i.e. 
% value of criterion f is decreased after the update 
% of x. 
% success == 0 in the oposite case. 
%
% x_new is the updated x if success == 1. 
% x_new is set equal to the input x if success == 0. 
    
% discard the code from here and implement the functionality: 
J = jakob(x(1), x(2), a);
[~, n] = size(J);
I = eye(n);
distCurrent = dist(x, a);
x_new_t = x - ((inv(J' * J + mu * I))* J') * distCurrent;

distNew = dist(x_new_t, a);
if sum(distCurrent.^2) < sum(distNew.^2) %denied
    x_new = x;
    success = 0;
else %accepted 
    x_new = x_new_t;
    success = 1;
end

