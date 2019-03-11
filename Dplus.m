function Dp = Dplus(U)
    N = size(U,1);
    Dp = zeros(N,1);
    Dp(2:N-1) = U(3:N) - U(2:N-1);
end