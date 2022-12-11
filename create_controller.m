function C = create_controller(type, config)
%
%
%
Kp = 0.1;
Ki = 0.5;

alpha = config.alpha;

if strcmp(type, 'PI')
    C.x = 0;
    C.y = 0;
    C.f = @(x,e) x + e;
    C.g = @(x,e) Kp*e + Ki*x;
elseif strcmp(type, 'lag')
    C.x = 0;
    C.y = 0;
    C.f = @(x,e) alpha*x + e;
    C.g = @(x,e) Kp*e + Ki*x;
end
end