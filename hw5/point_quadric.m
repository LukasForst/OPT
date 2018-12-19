function x = point_quadric(Q,a)
iterations = 100;
[V,D] = eig(Q);
eig_vals = diag(D);
b = V' * a;
g_up = eig_vals.*(b.^2);
gd_up = -2.*eig_vals.*g_up;

best_dist = inf;
x = b;
for assumption = [-1 0 1]
    l = iterate(assumption);
    [x, best_dist] = get_better(get_x(l), x, best_dist);
end
    function [x_best, best_dist] = get_better(x_curr, x_best, best_dist)
        dist = norm(x_curr - a, 'fro');
        if dist < best_dist
            best_dist = dist;
            x_best = x_curr;
        end
    end

    function x = get_x(l)
        y = b./(1 + l*eig_vals);
        x = V * y;
    end

    function l = iterate(l)
        for i = 1:iterations
            l = newton_iter(l);
        end
    end

    function l = newton_iter(l)
        g = sum(g_up ./ ((l*eig_vals + 1).^2)) - 1;
        gd = sum(gd_up ./ ((l*eig_vals + 1).^3));
        l = l - g/gd;
    end
end