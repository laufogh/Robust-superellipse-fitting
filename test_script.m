close all
clear
addpath('./src')

% random superellipse
x_gt = [max(rand * 2, 0.01), ...
       (rand - 0.5) * 1 + 2, (rand - 0.5) * 1 + 2, ...
       rand * 2 * pi, (rand - 0.5) * 2, (rand - 0.5) * 2];
   
% points =  uniformSampledSuperellipse(x_gt, 0.2, 0);
load("ellipse_points.mat")

points = [x ; y];

tic
x = EMS2D(points,'OutlierRatio',0,'MaxOptiIterations',1000,'MaxSwitch',10);
toc

disp('Ground truth is ')
disp(x_gt)
disp('Fitting result is ')
disp(x)

figure(1)
showPoints(points)
hold on
showSuperellipse(x, 'Color', 'g')
hold off