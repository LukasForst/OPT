A = load('makarena1.txt','-ASCII');

r = 2;
y = generate_vector(A, r);
figure();
plot(y(1,:),y(2,:));
title('2D Makarena');

r = 3;
y = generate_vector(A, r);
figure();
plot3(y(1,:), y(2,:), y(3, :));
title('3D Makarena');


A = load('walk1.txt','-ASCII');
r = 2;
y = generate_vector(A, r);
figure();
plot(y(1,:),y(2,:));
title('2D Walk');

r = 3;
y = generate_vector(A, r);
figure();
plot3(y(1,:), y(2,:), y(3, :));
title('3D Walk');
