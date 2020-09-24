%% discrete_reuleaux_triangle
%
% Function to compute, display
% and record a discrete Reuleaux triangle on a binary image.
%
% Author & support : nicolas.douillet (at) free.fr, 2020.
%
%
%% Syntax
%
% discrete_reuleaux_triangle(H, W);
% discrete_reuleaux_triangle(H, W, option_display);
% I = discrete_reuleaux_triangle(H, W, option_display);
%
%
%% Description
% 
% discrete_reuleaux_triangle(H, W) computes and display an H x W
% black (0) image with a discrete Reuleaux traingle (1) in its centre.
%
% discrete_reuleaux_triangle(H, W, option_display) displays it when
% option_display is set to logical *true/1 (default), and doesn't
% when it is set to  logical false/0.
%
% I = discrete_reuleaux_triangle(H, W, option_display) stores the resulting
% image in the matrix I.
%
%
%% Input arguments
%
% - H : positive integer scalar, the height in pixels of the desired image. Image vertical resolution.
% - W : positive integer scalar, the width  in pixels of the desired image. Image horizontal resolution.
% - option_display : either logical *true/false or numeric *1/0.
%
%
%% Output argument
%
% - I : logical / binary matrix, the resulting image. 
%
%
%% Example #1

I = discrete_reuleaux_triangle(256); % square image by default if one argument only

%% Example #2

I = discrete_reuleaux_triangle(450,800,0);