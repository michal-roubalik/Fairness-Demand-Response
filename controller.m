function C = controller(C,e)
    C.x = C.f(C.x,e);
    C.y = C.g(C.x,e);
end