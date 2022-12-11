function S = systems(S,s)
    N = numel(S);
    for i = 1:N
        r = rand(1);
        p = S{i}.p(S{i}.x,S{i}.k,S{i}.x0,S{i}.N0,s);
        %p = S{i}.p(s);
        w = (p >= r) + 1;
        S{i}.x = S{i}.f{w}(S{i}.x);
        S{i}.y = S{i}.g{w}(S{i}.x);
    end
end