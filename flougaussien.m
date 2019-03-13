i=imread('LENNA.JPG');

% Flou gaussien avec fft :
% s=5;        %sigma
% h=fspecial('gaussian',512,s);
% H=fft2(h);
% I=fft2(fftshift(i));
% O=H.*I;
% o=ifft2(O);
% imshow(o,[]);

% Flou avec filtre gaussien :
iflou=imgaussfilt(i,5);        %sigma=5
imshow(iflou)

