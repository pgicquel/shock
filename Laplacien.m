function l = Laplacien(U,i,h)
   l = (U(i+1) + U(i-1) - 2*U(i)) *(1/h^2)
end

