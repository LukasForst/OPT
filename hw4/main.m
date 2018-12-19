
opts.iterN = 10; % change as you like 
opts.VERBOSE = 1; % enable interactive plots 
opts.mu = 1; % for LM 

% these points are for demonstative purposes only. 
% use your own, try different configurations. 
% load my_points_1.mat 
a = [-0.7   0.7 0.7  -0.7
     -0.3  -0.3 0.8   .3]; 

b = [0,0,0;0.2,0.25,.3];
 
x0 = [0.5 0.2, .7]'; 
x01 = [-1 0.25, .5]';
x02 = [1 0.25, .5]';

method = 'A';
%method = 'GN';
%[x, f_history] = fit_circle(x0, a, method, opts);
[x, f_history] = fit_circle(x02, b, method, opts);
figure();
plot(0:10, f_history);
