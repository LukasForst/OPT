function [U,S,V] = compress_svd(An, r)
[U,S,V] = svd(An');
for i = r + 1 : min(size(S))
    S(i,i) = 0;
end
end