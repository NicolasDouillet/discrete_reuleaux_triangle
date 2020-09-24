function [I] = discrete_reuleaux_triangle(H, W, option_display)
%% discrete_reuleaux_triangle : function to compute, display
% and record a discrete Reuleaux triangle on a binary image.
%
% Author & support : nicolas.douillet (at) free.fr, 2020.
%
%
% Syntax
%
% discrete_reuleaux_triangle(H, W);
% discrete_reuleaux_triangle(H, W, option_display);
% I = discrete_reuleaux_triangle(H, W, option_display);
%
%
% Description
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
% See also : BWMORPH, IMROTATE, IM2UINT8
%
%
% Input arguments
%
% - H : positive integer scalar, the height in pixels of the desired image. Image vertical resolution.
% - W : positive integer scalar, the width  in pixels of the desired image. Image horizontal resolution.
% - option_display : either logical *true/false or numeric *1/0.
%
%
% Output argument
%
% - I : logical / binary matrix, the resulting image. 
%
%
% Example #1
%
% I = discrete_reuleaux_triangle(256); % square image by default if one argument only
%
%
% Example #2
%
% I = discrete_reuleaux_triangle(450,800,true);


%% Input parsing
assert(nargin > 0,'Not enough input argument.');
assert(nargin < 4,'Too many input arguments.');
assert(isnumeric(H) && H == floor(H) && H > 0,'H parameter value must be numeric positive integer.');


if nargin > 1
    
    assert(isnumeric(W) && W == floor(W) && W > 0,'W parameter value must be numeric positive integer.');
    
    if nargin > 2
        
        assert(islogical(option_display) || isnumeric(option_display),'option_display parameter type must be either logical or numeric.');
        
    else % if nargin  == 2
        
        option_display = true;
        
    end
    
else % if nargin == 1
    
    W = H; % square image created for minimum 1 input
    option_display = true;
    
end


%% Body
I = zeros(H,W);

% Reuleaux parameters
img_centre = 0.5*[H,W];
radius = 0.4*min(H,W);
[V1,Xinit1,V2,Xinit2,V3,Xinit3] = reuleaux(img_centre,radius);

radius = norm(V1-Xinit1);

for i = 1:H
    
    for j = 1:W
        
        X = [i,j];
        
        if (norm(X-V1) < radius && dot(X-V1,Xinit1-V1) > 0.5*sqrt(3)*norm(X-V1)*radius) || ...
           (norm(X-V2) < radius && dot(X-V2,Xinit2-V2) > 0.5*sqrt(3)*norm(X-V2)*radius) || ...
           (norm(X-V3) < radius && dot(X-V3,Xinit3-V3) > 0.5*sqrt(3)*norm(X-V3)*radius)
            
            I(i,j) = 1;
        
        end
        
    end
    
end

if option_display
    
    figure;
    imshow(I);
    
end


end % discrete_reuleaux_triangle


%% Reuleaux triangle parameters computation subfunction
function [V1, Xinit1, V2, Xinit2, V3, Xinit3] = reuleaux(C, radius)


% Computes (V1,V2,V3), triangle summits
V1 = C + [0,0.5*radius];

length = 0.5*radius;
height = 0.5*sqrt(3)*radius;

V2 = V1 - [length,height];
V3 = V1 - [-length,height];

% Computes arch middles
Xinit1 = V1 - [0,radius];

H = 0.5*(V1+V3);
H = H - V2;
Xinit2 = V2 + radius*H/norm(H);

H = 0.5*(V1+V2);
H = H - V3;
Xinit3 = V3 + radius*H/norm(H);


end % Reuleaux