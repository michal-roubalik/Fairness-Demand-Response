function A = create_accumulator
% accumulates number of running agents

A.y = 0;
A.f = @(x) sum(x);
end