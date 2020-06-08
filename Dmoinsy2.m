function M = Dmoinsy2(I)
[m,n]=size(I);
M=zeros(m,n);

M(1:m,2:n)=-I(:,1:n-1)+I(:,2:n);
M(1:m,1)=zeros(m,1);

end