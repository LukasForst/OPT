data = load('test_data.mat');
Qs = data.Qs;
as = data.as;
xs = data.xs;

i = 8;
j = 10;

x = point_quadric(Qs{i,j}, as{i,j});
my = norm(x - as{i,j}, 'fro');
their = norm(xs{i,j} - as{i,j}, 'fro');

disp(my);
disp(their);
disp(my - their);
disp(x' * Qs{i,j} * x);
