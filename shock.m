function s = shock(U0,Dt,h)
  %Dt = Delta t
  N = size (U0,1); 
  U = zeros(N,1); %stocker discrétisation 
  
  for i=1:N-1
     root1 = sqrt(Xplus(Dplus(U0)).^2 + Xmoins(Dmoins(U0)).^2);
     root2 = sqrt(Xmoins(Dplus(U0)).^2 + Xplus(Dmoins(U0)).^2);
     F0 = X(Dplus(Dmoins(U0./(h^2))))
     
     U = U0 - (Dt/h)*root1*Xmoins(F0) - (Dt/h)*root2*Xplus(F0)
     U0 = U;
  end
  
  s = U; %on renvoie le résultat
end

