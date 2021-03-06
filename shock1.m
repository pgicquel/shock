function s = shock1(U0,Dt,h,iteration)
%1D shock approximation, CFL: Dt*F<=1/2*h
    L = size (U0,1);
    if L == 1
        U0 = U0';
    end
    U = zeros(L,1);
    N = uint8(1/Dt);
    
    for i=1:iteration
        Fn = F(Dplus(Dmoins(U0))/h^2);
        m = minmod(Dplus(U0),Dmoins(U0));
        U = U0 - (Dt/h)*abs(m).*Fn;
        U0 = U;
    end
    
    s = U;
end