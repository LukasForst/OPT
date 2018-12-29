function [F, u, x1, x2] = lp_solve(C, d, N, x0, x_des)
    dim = length(C);

    sl_count = 4;
    sl_start = N+1;
    sl_end = 5*N;
    
    u_start = sl_end+1;
    u_end = sl_end+2*N;
    
    x_start = u_end+1;
    x_end = u_end+(N-1)*dim*2;
    
    A = [get_ZS(); get_UX()];
    c = [ones(N, 1); zeros(x_end-sl_start+1, 1)];
    b = [repmat([0 0 -1 -1], 1, N), (C*x0)', zeros(1, (N-2)*dim), -x_des(1), -x_des(2)]';
    X = sedumi(A, b, c);

    F = sum(X(1:N));
    u = X(u_start:2:u_end) - X(u_start+1:2:u_end);
    x1 = [x0(1); X(x_start:sl_count:x_end)-X(x_start+1:sl_count:x_end); x_des(1)];
    x2 = [x0(2); X(x_start+2:sl_count:x_end)-X(x_start+3:sl_count:x_end); x_des(2)];

    % bottom part of A matrix, contains u and x variables
    function UX = get_UX()
        ones_p1 = [-1 1];
        ones_p2 = [1 -1];
        ds_pattern = [-d d];
        hidden_block = zeros(dim, sl_end);

        UX = zeros(2*N, x_end);
        UX(1:dim, :) = [hidden_block, ds_pattern, zeros(dim, u_end-u_start-1), kron(eye(dim), ones_p2), zeros(dim, x_end-x_start+1-2*dim)];
        
        for m = 1:(N-2)
            zeros_p1 = [hidden_block, zeros(dim, 2*m)];
            zeros_p3 = zeros(dim, u_end-u_start-3+dim*(m-1));
            zeros_p5 = zeros(dim, x_end-x_start-2*(m+1)*dim+1);
            ones_p4 = [kron(C, ones_p1), kron(eye(dim), ones_p2)];
            UX(m*dim+(1:dim), :) = [zeros_p1, ds_pattern, zeros_p3, ones_p4, zeros_p5];
        end
        
        UX((N-1)*dim+(1:dim), :) = [hidden_block, zeros(dim, u_end-u_start-1), ds_pattern,  zeros(dim, x_end-x_start+1-2*dim), kron(C, ones_p1)];
    end
    
    % upper part of A matrix - contains z and slack variables
    function ZS = get_ZS()
        ZS = zeros(sl_count*N, x_end);
        for t = 0:(N-1)
            curr_sl_p = sl_start+sl_count*t;
            uhps = uhp(t);
            [u_plus_vp, u_minus_vp]  = vup(t);
            ZS(uhps, t+1)=1;
            ZS(uhps, curr_sl_p:curr_sl_p+sl_count-1)=-eye(sl_count);
            ZS(uhps(1):uhps(4), u_plus_vp:u_minus_vp) = [-1 1; 1 -1; -2 2; 2 -2];
        end
    end

    % vertical u+- position
    function [u_plus_vp, u_minus_vp] = vup(t)
        u_plus_vp = u_start+2*t;
        u_minus_vp = u_start+2*t+1;
    end

    % horizontal us position
    function uhps = uhp(t)
        uhps = [sl_count*t+1 sl_count*t+2 sl_count*t+3 sl_count*t+4];
    end
end