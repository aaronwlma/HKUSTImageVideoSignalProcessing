% Aaron Ma
% 20091536
% April 7th, 2017
% EESM5700 HW 2 - Problem 3.c
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the RGB image
RGB = imread('BerkeleyTower.png');

% -------------------------------------------------------------------------

% Create the blurred image g
GRAY = rgb2gray(RGB);
normGRAY = double(GRAY) / 255;
freqGRAY = fft2(normGRAY);
spectral = fftshift(log(1+abs(freqGRAY)));

T = 1;
a = 0.1;
b = 0.1;
[M, N] = size(normGRAY);
[V, U] = meshgrid(1:N, 1:M);
Ub = U - floor(M/2);
Vb = V - floor(N/2);

H = (T./(pi*(Ub*a+Vb*b))).*(sin(pi*(Ub*a + Vb*b))).*(exp(-1j*pi.*(Ub*a + Vb*b)));
H = ifftshift(H);
Hb = (T./(pi*(U*a+V*b))).*(sin(pi*(U*a + V*b))).*(exp(-1j*pi.*(U*a + V*b)));
G = H .* freqGRAY;
Gb = Hb .* freqGRAY;

blurredGRAY = real(ifft2(Gb));
blurredspectral = ifftshift(log(1+abs(G)));

% -------------------------------------------------------------------------

% Add gaussian noise to the blurred images
R1 = imnoise(blurredGRAY,'gaussian',0,0.001);
normR1 = mat2gray(R1);
freqR1 = fft2(normR1);
R1spectral = fftshift(log(1+abs(freqR1)));

R2 = imnoise(blurredGRAY,'gaussian',0,0.01);
normR2 = mat2gray(R2);
freqR2 = fft2(normR2);
R2spectral = fftshift(log(1+abs(freqR2)));

R3 = imnoise(blurredGRAY,'gaussian',0,0.1);
normR3 = mat2gray(R3);
freqR3 = fft2(normR3);
R3spectral = fftshift(log(1+abs(freqR3)));

% -------------------------------------------------------------------------

% Inverse filtering of the degraded image r
invR1 = real(ifft2((abs(Hb) > 0.1).*fft2(R1)./Hb));
invR2 = real(ifft2((abs(Hb) > 0.1).*fft2(R2)./Hb));
invR3 = real(ifft2((abs(Hb) > 0.1).*fft2(R3)./Hb));
% Note that we include the condition of abs(H) > 0.1 to deal with the fact
% that we would be dividing by the additive noise, which would make our
% image extremely noisy.

% -------------------------------------------------------------------------

% Wiener filtering of the degraded image r
wienerR1 = wiener2(R1);
wienerR2 = wiener2(R2);
wienerR3 = wiener2(R3);

% -------------------------------------------------------------------------

% Display final images
subplot(3,3,1);
imshow(R1);
title('Mean and Variance = (0,0.001) (Spatial)');

subplot(3,3,2);
imshow(invR1);
title('Mean and Variance = (0,0.001) (Inverse)');

subplot(3,3,3);
imshow(wienerR1);
title('Mean and Variance = (0,0.001) (Wiener)');

subplot(3,3,4);
imshow(R2);
title('Mean and Variance = (0,0.01) (Spatial)');

subplot(3,3,5);
imshow(invR2);
title('Mean and Variance = (0,0.01) (Inverse)');

subplot(3,3,6);
imshow(wienerR2);
title('Mean and Variance = (0,0.01) (Wiener)');

subplot(3,3,7);
imshow(R3);
title('Mean and Variance = (0,0.1) (Spatial)');

subplot(3,3,8);
imshow(invR3);
title('Mean and Variance = (0,0.1) (Inverse)');

subplot(3,3,9);
imshow(wienerR3);
title('Mean and Variance = (0,0.1) (Wiener)');

% -------------------------------------------------------------------------

