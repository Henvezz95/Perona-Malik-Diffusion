function g_taps = g(im, kappa, type, sigma)

% gaussian smoothing
if sigma>0
    im = imgaussfilt(im,sigma);
end

hX = [0 1 0; 0 0 0; 0 -1 0];
hY = [0 0 0; -1 0 1; 0 0 0];

% Finite differences
nablaX = imfilter(im,hX,'conv');
nablaY = imfilter(im,hY,'conv');   
% Neumann boundary condition: isolated system
nablaX(1,:) = 0;
nablaX(end,:) = 0;
nablaY(1,:) = 0;
nablaY(end,:) = 0;


squared_norm = nablaX.^2+nablaY.^2;

% Diffusion function.
if type == 1
    
    g_taps = exp(-(squared_norm/kappa^2));
    
elseif type == 2
    
    g_taps = 1./(1 + (squared_norm/kappa^2));
    
end   
