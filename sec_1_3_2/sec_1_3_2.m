% Aaron Ma
% 20091536
% March 14th, 2017
% EESM5700 HW 1 - Problem 3.2
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the target image
I = imread('image_problem3.png', 'png');

% -------------------------------------------------------------------------

% Filtering with a median filter, matrix of [3 3]
tic
Imed3 = medfilt2(I, [3 3]);
t_Imed3 = toc;

% -------------------------------------------------------------------------

% Filtering with a median filter, matrix of [5 5]
tic
Imed5 = medfilt2(I, [5 5]);
t_Imed5 = toc;

% -------------------------------------------------------------------------

% Filtering with a median filter, matrix of [7 7]
tic
Imed7 = medfilt2(I, [7 7]);
t_Imed7 = toc;

% -------------------------------------------------------------------------

% Output delay times for each filter
fprintf(1, 'Delay Time for Matrix 3x3: %f\n', t_Imed3);
fprintf(1, 'Delay Time for Matrix 5x5: %f\n', t_Imed5);
fprintf(1, 'Delay Time for Matrix 7x7: %f\n', t_Imed7);

% -------------------------------------------------------------------------

% Display original with all three results
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,2);
imshow(Imed3);
title('Median Filtered Image with 3x3 Matrix');
subplot(2,2,3);
imshow(Imed5);
title('Median Filtered Image with 5x5 Matrix');
subplot(2,2,4);
imshow(Imed7);
title('Median Filtered Image with 7x7 Matrix');

% -------------------------------------------------------------------------

