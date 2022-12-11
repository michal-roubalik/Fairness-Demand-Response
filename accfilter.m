function F = accfilter(F,A)
    for i = F.ord:-1:2
        F.x(:,i) = F.x(:,i-1);
    end
    F.x(:,1) = A.y;
    F.y = F.f(F.x);
end