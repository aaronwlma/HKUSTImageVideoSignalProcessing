% Aaron Ma
% 20091536
% March 14th, 2017
% EESM5700 HW 1 - Problem 3.1
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the target image
I = imread('image_problem3.png', 'png');

% -------------------------------------------------------------------------

% Filtering with a Gaussian filter, standard deviation of 2
tic
Istd2 = imgaussfilt(I, 2);
t_Istd2 = toc;

% -------------------------------------------------------------------------

% Filtering with a Gaussian filter, standard deviation of 4
tic
Istd4 = imgaussfilt(I, 4);
t_Istd4 = toc;

% -------------------------------------------------------------------------

% Filtering with a Gaussian filter, standard deviation of 6
tic
Istd6 = imgaussfilt(I, 6);
t_Istd6 = toc;

% -------------------------------------------------------------------------

% Output delay times for each filter
fprintf(1, 'Delay Time for Sigma = 2: %f\n', t_Istd2);
fprintf(1, 'Delay Time for Sigma = 4: %f\n', t_Istd4);
fprintf(1, 'Delay Time for Sigma = 6: %f\n', t_Istd6);

% -------------------------------------------------------------------------

% Display original with all three results
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,2);
imshow(Istd2);
title('Gaussian Filtered Image (\sigma = 2)');
subplot(2,2,3);
imshow(Istd4);
title('Gaussian Filtered Image (\sigma = 4)');
subplot(2,2,4);
imshow(Istd6);
title('Gaussian Filtered Image (\sigma = 6)');

% -------------------------------------------------------------------------

