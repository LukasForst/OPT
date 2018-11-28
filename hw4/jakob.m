function J = jakob(x,y,a)
[~,n] = size(a);

dx = -((a(1, :) - x)./sqrt((a(1, :) - x).^2 + (a(2, :) - y).^2))';
dy = -((a(2, :) - y)./sqrt((a(1, :) - x).^2 + (a(2, :) - y).^2))';
dr = -1 * ones(n, 1);

J = [dx, dy, dr];
end
