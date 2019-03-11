function Dm = Dmoins(U)
    N = size(U,1);
    Dm = zeros(N,1);
    Dm(2:N-1) = U(2:N-1) - U(1:N-2);
end