% Aaron Ma
% 20091536
% March 14th, 2017
% EESM5700 HW 1 - Problem 1
% -------------------------------------------------------------------------

% Define a white canvas with dimensions 270x50
clc; clear;
my_studentID = 255 * uint8(ones(50, 270));

% -------------------------------------------------------------------------

% Change image coordinates to black to draw numbers
% Number 2
my_studentID(5, 30:50) = 0;
my_studentID(5:25, 50) = 0;
my_studentID(25, 30:50) = 0;
my_studentID(25:45, 30) = 0;
my_studentID(45, 30:50) = 0;

% Number 0
my_studentID(5, 60:80) = 0;
my_studentID(5:45, 80) = 0;
my_studentID(45, 60:80) = 0;
my_studentID(5:45, 60) = 0;

% Number 0
my_studentID(5, 90:110) = 0;
my_studentID(5:45, 110) = 0;
my_studentID(45, 90:110) = 0;
my_studentID(5:45, 90) = 0;

% Number 9
my_studentID(5, 120:140) = 0;
my_studentID(5:45, 140) = 0;
my_studentID(45, 120:140) = 0;
my_studentID(5:25, 120) = 0;
my_studentID(25, 120:140) = 0;

% Number 1
my_studentID(5:45, 150) = 0;

% Number 5
my_studentID(5, 160:180) = 0;
my_studentID(5:25, 160) = 0;
my_studentID(25, 160:180) = 0;
my_studentID(25:45, 180) = 0;
my_studentID(45, 160:180) = 0;

% Number 3
my_studentID(5, 190:210) = 0;
my_studentID(5:45, 210) = 0;
my_studentID(25, 190:210) = 0;
my_studentID(45, 190:210) = 0;

% Number 6
my_studentID(5, 220:240) = 0;
my_studentID(5:45, 220) = 0;
my_studentID(25, 220:240) = 0;
my_studentID(25:45, 240) = 0;
my_studentID(45, 220:240) = 0;

% -------------------------------------------------------------------------

% Display and save the image as "MyStudentID_AaronMa.bmp"
imshow(my_studentID);
imwrite(my_studentID, 'MyStudentID_AaronMa.bmp','bmp');

% -------------------------------------------------------------------------