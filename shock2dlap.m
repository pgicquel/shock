function U=shock2dlap(I,iteration)
I=double(I);
dt = 0.5;
h = 1;
U=I;
for i=1:iteration
      m1 = minmod(Dplusx2(U),Dmoinsx2(U));
      m2 = minmod(Dplusy2(U),Dmoinsy2(U));
      F = sign(del2(U));
      U = U-(dt/h).*sqrt(m1.^2+m2.^2).*F;
end
end