% Aaron Ma
% 20091536
% April 7th, 2017
% EESM5700 HW 2 - Problem 2.b
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the RGB image
RGB = imread('BerkeleyTower.png');

% -------------------------------------------------------------------------

% Normalize RGB image to [0 1] range
I = double(RGB) / 255;

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% -------------------------------------------------------------------------

% Convert normalized image to HSI
% Hue
numerator = 1/2 * ((R - G) + (R - B));
denominator = ((R - G).^2 + ((R - B) .* (G - B))).^0.5;

H = acosd(numerator ./ (denominator + 0.00001));
% Note:  In case the demonimator is 0, we add an insignificant value to
% prevent that from happening

% As written in Problem 2.a, if B > G, then H = 360 - Theta
H(B > G) = 360 - H(B > G);

% Normalize HSI Image
H = H / 360;

% Saturation
S = 1 - (3 ./ (sum(I,3) + 0.00001)) .* min(I,[],3);

% Intensity
I = sum(I,3) ./ 3;

% Store HSI values into HSI
HSI = zeros(size(RGB));
HSI(:,:,1) = H;
HSI(:,:,2) = S;
HSI(:,:,3) = I;

% -------------------------------------------------------------------------

% Display final image
subplot(1,2,1);
imshow(RGB);
title('RGB Image');
subplot(1,2,2);
imshow(HSI);
title('HSI Image');

% -------------------------------------------------------------------------
