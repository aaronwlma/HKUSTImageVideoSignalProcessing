% Aaron Ma
% 20091536
% March 14th, 2017
% EESM5700 HW 1 - Problem 3.3
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Read the target image
I = imread('image_problem3.png', 'png');

% -------------------------------------------------------------------------

% Filtering with a median filter, matrix of [3 3]
Imed3 = medfilt2(I, [3 3]);

% -------------------------------------------------------------------------

% Histogram equalization to improve visibility
% Create blank image with same dimensions as the original
I_m = size(Imed3,1);
I_n = size(Imed3,2);
Ihist=uint8(zeros(I_m,I_n));

% Define variables for creating intensity distribution table
r_k=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cum=zeros(256,1);
out=zeros(256,1);
sum=0;
intensity=255;

% For statement that sweeps image and creates list of PDF values
% Note that we add one to value because intensity starts from 0
for i = 1:I_m
    for j = 1:I_n
        value = Imed3(i,j);
        r_k(value+1) = r_k(value+1) + 1;
        pdf(value+1) = r_k(value+1) / (I_m*I_n);
    end
end

% For statement that sweeps image and creates list of CDF values
for i = 1:size(pdf)
   sum = sum + r_k(i);
   cum(i) = sum;
   cdf(i) = cum(i) / (I_m*I_n);
   out(i) = round(cdf(i) * intensity);
end

% For statement that creates the histogram equalized image by using the CDF
% for statement above
for i = 1:I_m
    for j = 1:I_n
            Ihist(i,j) = out(Imed3(i,j) + 1);
    end
end

% -------------------------------------------------------------------------

% MATLAB histogram equalization for verification
Imatlab = histeq(Imed3);

% -------------------------------------------------------------------------

% Display original with all three results
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,2);
imshow(Imed3);
title('Image without Histogram Equalization');
subplot(2,2,3);
imshow(Ihist);
title('Image with Custom Histogram Equalization');
subplot(2,2,4);
imshow(Imatlab);
title('Image with MATLAB Histogram Equalization');

% -------------------------------------------------------------------------

