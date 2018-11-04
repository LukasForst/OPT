data = load('mzdy.txt', '-ascii');
t = data(:, 1); % years
M = data(:, 2); % wages
x = wages_fit_model(t, M);

[1, 2009.25]*x
% hold on
% scatter(t,M);
% plot(t,[ones(size(t)), t]*x); 
% hold off;
