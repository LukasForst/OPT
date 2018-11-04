Data = load('teplota.txt', '-ascii'); 
t = Data(:, 1); % days
T = Data(:, 2); % temperature measurements
[x, omega] = temps_fit_model(t, T)
plot(t, T)