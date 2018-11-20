switch 2
    case 1
        A = load('makarena1.txt','-ASCII');
    case 2
        A = load('walk1.txt','-ASCII');
end
rs = [15 10 5 2 1];
[An, n] = get_linear(A);
[U,S,V] = svd(An',0);
for r = rs
    for i = r + 1 : min(size(S))
        S(i,i) = 0;
    end

    A_approx = U*S*V';
    A_approx = A_approx' + n;
    dist = norm(A - A_approx,'fro')^2;
    fprintf('r: %d -> dist: %d\n', r, dist);
end
