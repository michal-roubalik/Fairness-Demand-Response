function F = create_filter
%
% filter averages two consecutive inputs
%

F.ord = 2;
F.x = [0 0];
F.f = @(x) 0.5*x(1) + 0.5*x(2);
F.y = 0;
end