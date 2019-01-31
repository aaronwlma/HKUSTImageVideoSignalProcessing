% Aaron Ma
% 20091536
% April 7th, 2017
% EESM5700 HW 2 - Problem 3.a
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the RGB image
RGB = imread('BerkeleyTower.png');

% -------------------------------------------------------------------------

% Convert RGB image to gray image and normalize to [0 1]
GRAY = rgb2gray(RGB);
normGRAY = mat2gray(GRAY);

% -------------------------------------------------------------------------

% Transform normalized gray image to frequency domain and set up spectral
% graph
freqGRAY = fft2(normGRAY);
spectral = fftshift(log(1+abs(freqGRAY)));

% -------------------------------------------------------------------------

% Apply motion blur H(u,v) to the normalized gray image and set up spectral
% graph

T = 1;
a = 0.1;
b = 0.1;
[M, N] = size(normGRAY);
[V, U] = meshgrid(1:N, 1:M);
Ub = U - floor(M/2);
Vb = V - floor(N/2);

H = (T./(pi*(Ub*a+Vb*b))).*(sin(pi*(Ub*a + Vb*b))).*(exp(-1j*pi.*(Ub*a + Vb*b)));
H = ifftshift(H);
G = H .* freqGRAY;

Hb = (T./(pi*(U*a+V*b))).*(sin(pi*(U*a + V*b))).*(exp(-1j*pi.*(U*a + V*b)));
Gb = Hb .* freqGRAY;

blurredGRAY = real(ifft2(Gb));
blurredspectral = ifftshift(log(1+abs(G)));

% -------------------------------------------------------------------------

% Display final image
subplot(2,2,1);
imshow(normGRAY);
title('Gray Image (Spatial)');

subplot(2,2,2);
imshow(spectral,[]);
title('Gray Image (Frequency)');

subplot(2,2,3);
imshow(blurredGRAY);
title('Blurred Gray Image (Spatial)');

subplot(2,2,4);
imshow(blurredspectral, []);
title('Blurred Gray Image (Frequency)');

% -------------------------------------------------------------------------
