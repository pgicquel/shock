%%%%%%%%%%%%%%%%%%%%% 1D %%%%%%%%%%%%%%%%%%%%%

close all

%heaviside function
n=10;
figure
h=zeros(1,2*n+1);
h(n+1)=1/2;
h(n+2:2*n+1)=1;
subplot(1,3,1)
hflou=imgaussfilt(h,5);
plot(h);
title('Heaviside Function');
subplot(1,3,2)
plot(hflou)
title('Heaviside blurred by gaussian filter');
subplot(1,3,3)
plot(shock1(hflou',0.01,0.02,30))
title('Heaviside blurred filter by Shocks ');

%line of pixel of an image
figure
A=imread('lena512.bmp'); 
L=A(1,:);
L=double(L);

Lflou=imgaussfilt(L,2); 
subplot(2,3,2) 
plot(L)
title('First line of pixel');

%Affichage première ligne floue
subplot(2,3,3) 
plot(Lflou)
title('Blurred line with gaussian filter');

%Affichage première ligne floue +shock
subplot(2,3,4) 
plot(shock1(double(Lflou),0.01,0.02,5))
title('Blurred line filter by Shocks');
xlabel('5 iterations')

%Affichage première ligne floue +shock
subplot(2,3,5) 
plot(shock1(double(Lflou),0.01,0.02,10))
title('Blurred line filter by Shocks');
xlabel('10 iterations')

%Affichage première ligne floue +shock
subplot(2,3,6) 
plot(shock1(double(Lflou),0.01,0.02,20))
title('Blurred line filter by Shocks');
xlabel('20 iterations')

% %Affichage première ligne floue +shock
% subplot(1,4,4) 
% plot(shock216(double(Lflou),0.01,0.02,10))
% title('Blurred line filter by Shocks revised');
%cas 1D
figure
Dt = 0.1;
h = 0.1;
X = -10:h:10;
U0 = cos(X);
s = shock1(U0,Dt,h,10);

subplot(2,1,1);
plot(X,U0);
title('cos');
subplot(2,1,2);
plot(X,s);
title('cos with shock');

%cas 2D
RGB=imread('lena512color.tiff');
I=rgb2gray(RGB);
I = double(I);

%lenna
sigm = 3;
Iflou = imgaussfilt(I,sigm);
figure
subplot(2,3,1)
imshow(uint8(I));
title('original picture');

subplot(2,3,2)
imshow(uint8(Iflou));
title('blurred picture sigma=3');

SL = shock2d(Iflou,3);
subplot(2,3,3)
imshow(uint8(SL));
title('Filtered by shock with L (3 iterations)');

Slap = shock2dlap(Iflou,3);
subplot(2,3,4)
imshow(uint8(Slap));
title('Filtered by shock filter with Laplacian (3 iterations)');

%scheme 2
SRev = shock2dbis(Iflou,5);
subplot(2,3,5)
imshow(uint8(SRev));
title('Filtered by revised shock filter with L (5 iterations)');

%error calulus
erreur_flou_lenna = norm(I-Iflou,'fro')/norm(I,'fro');
erreur_SL_lenna = norm(I-SL,'fro')/norm(I,'fro');
erreur_Slap_lenna = norm(I-Slap,'fro')/norm(I,'fro');
erreur_SRev_lenna = norm(I-SRev,'fro')/norm(I,'fro');

%rectangles picture
figure

I=imread('gray.tiff');

I = double(I);
Iflou = imgaussfilt(I,4);

subplot(1,3,1)
imshow(uint8(I));
title('original picture');

subplot(1,3,2)
imshow(uint8(Iflou));
title('blurred picture sigma = 4');

subplot(1,3,3)
S = shock2d(Iflou,14);
imshow(uint8(S));
title('Shocked whith L and 14 iterations');

erreur_flou_carre = norm(Iflou-I,'fro')/norm(I,'fro');
erreur_s_carre = norm(I-S,'fro')/norm(I,'fro');

fprintf('relative error between the transformed picture (T) and the original one (O) (||T-O||/||O|| where || || is the Frobenius norm):\n\n');
fprintf('blurred lena (gaussian blur sigma = 3): %2.3f%%    blurred lena shocked with L formula: %2.3f%%\nblurred lena shocked with Laplacian: %2.3f%%    blurred lena shocked with revised scheme: %2.3f%%\n\n', erreur_flou_lenna*100, erreur_SL_lenna*100, erreur_Slap_lenna*100, erreur_SRev_lenna*100);
fprintf('blurred rectangles (gaussian blur sigma = 4): %2.3f%%    blurred rectangles shocked with L formula: %2.3f%%\n', erreur_flou_carre*100, erreur_s_carre*100);