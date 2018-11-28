function [x_new] = make_GN_iter(x, a)
% function [x_new] = make_GN_iter(x, a)
%
% makes the Gauss-Newton iteration. 
%
% INPUT:
% x, a   are as usual (see dist.m for explanation) 
%
% x_new is the updated x. 
   
 % discard the code from here and implement the functionality: 
J = jakob(x(1), x(2), a);
x_new = x - pinv(J) * dist(x,a);
end
