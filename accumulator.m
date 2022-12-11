function A = accumulator(A,S)
    N = numel(S);
    q = size(S{1}.y,1);
    vec = zeros(q,N);
    for i = 1:N
        vec(:,i) = S{i}.y;
    end
    A.y = A.f(vec);
end