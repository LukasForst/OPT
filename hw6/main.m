C = [1 1; 0 0.95];
d = [0;0.1];
N = 20;
x0 = [0; 0];
x_des = [10; 0];

[F, u, x1, x2] = lp_solve(C, d, N, x0, x_des);
display(F);

plot(0:N-1, u);
hold on;
legend('u(t)'); 
hold off;

figure();
plot(0:N, x1);
hold on;
legend('x1(t)');
hold off;

figure();
plot(0:N, x2);
hold on;legend('x2(t)');
hold off;