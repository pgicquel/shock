% Flou et filtrage de Lenna : 
% FORMULE 3.7
function s2=shock2dbis(I,iteration)
I = double(I);
dt = 0.2;
h = 1;
s2 = I;
for i=1:iteration
      m1 = max(0, Dplusx2(s2)).^2 + min(0,Dmoinsx2(s2)).^2 + max(0, Dplusy2(s2)).^2 + min(0, Dplusy2(s2)).^2 ;
      m2 = min(0, Dplusx2(s2)).^2 + max(0,Dmoinsx2(s2)).^2 + min(0, Dplusy2(s2)).^2 + max(0, Dplusy2(s2)).^2 ;
      F = sign(L(s2));
      s2=s2-(dt/h).*sqrt(m1).*min(0,F)-(dt/h).*sqrt(m2).*max(0,F) ;
end
end