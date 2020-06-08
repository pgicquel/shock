function M = Dmoinsx2(I)
[m,n]=size(I);
M=zeros(m,n);

M(2:m,1:n)=-I(1:m-1,:)+I(2:m,:);
M(1,1:n)=zeros(1,n);
end
