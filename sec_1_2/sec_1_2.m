% Aaron Ma
% 20091536
% March 14th, 2017
% EESM5700 HW 1 - Problem 2
% -------------------------------------------------------------------------

% Clear workspace before starting script
clc; clear;
close all;

% -------------------------------------------------------------------------

% Set matrix dimensions
m = 5000;
n = 5000;

% Create matrix mxn with random numbers
rng('default');
ori = randn(m, n);

% -------------------------------------------------------------------------

% Loop statement that adds 1 to positive values and subtracts 1 from
% negative values

x1 = ori; % Set x1 to the generated random matrix
tic % Start timer

for i = 1:m
    for j = 1:n
        if(x1(i,j) > 0)
            x1(i,j) = x1(i,j) + 1;
        end
        if(x1(i,j) < 0)
            x1(i,j) = x1(i,j) - 1;
        end
    end
end

t1 = toc; % End timer for for loop and set timer to t1

% -------------------------------------------------------------------------

% Matrix operation statement that adds 1 to positive values and subtracts 1
% from negative values

x2 = ori; % Set x2 to the generated random matrix
tic % Start timer

x2 = x2 + double(x2 > 0);
x2 = x2 - double(x2 < 0);

t2 = toc; % End timer and set timer to t2

% -------------------------------------------------------------------------

% Print out delay values for each method
fprintf(1, 'For Loop Delay Time: %f\n', t1);
fprintf(1, 'Matrix Operation Delay Time: %f\n', t2);

% -------------------------------------------------------------------------
