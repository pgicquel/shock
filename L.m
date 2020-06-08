function L = L(u)
ux = minmod(Dplusx2(u),Dmoinsx2(u));
uxx = Dplusx2(Dmoinsx2(u));
uy = minmod(Dmoinsy2(u),Dplusy2(u));
uyy = Dplusy2(Dmoinsy2(u));
uxy = (1/2)*(Dmoinsx2(Dmoinsy2(u))+Dplusx2(Dplusy2(u)));
L = uxx.*(ux).^2 + 2*uxy.*ux.*uy+uyy.*(uy).^2;
end