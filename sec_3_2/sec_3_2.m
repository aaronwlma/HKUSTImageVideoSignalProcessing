% Aaron Ma
% 20091536
% April 7th, 2017
% EESM5700 HW 2 - Problem 3.b
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

% Display final images
subplot(2,5,1);
imshow(normGRAY);
title('Gray Image (Spatial)');

subplot(2,5,6);
imshow(spectral,[]);
title('Gray Image (Frequency)');

subplot(2,5,2);
imshow(blurredGRAY);
title('Blurred Gray Image (Spatial)');

subplot(2,5,7);
imshow(blurredspectral, []);
title('Blurred Gray Image (Frequency)');

subplot(2,5,3);
imshow(R1);
title('Mean and Variance = (0,0.001) (Spatial)');

subplot(2,5,8);
imshow(R1spectral, []);
title('Mean and Variance = (0,0.001) (Frequency)');

subplot(2,5,4);
imshow(R2);
title('Mean and Variance = (0,0.01) (Spatial)');

subplot(2,5,9);
imshow(R2spectral, []);
title('Mean and Variance = (0,0.01) (Frequency)');

subplot(2,5,5);
imshow(R3);
title('Mean and Variance = (0,0.1) (Spatial)');

subplot(2,5,10);
imshow(R3spectral, []);
title('Mean and Variance = (0,0.1) (Frequency)');

% -------------------------------------------------------------------------

