function diff_im = Semi_ImplicitPM(Im, k, num_iter,delta_t,option, sigma)

diff_im = double(Im);

for i=1:num_iter   
    
    g_taps = g(diff_im, k, option,sigma); 
    diff_im = aosiso(diff_im , g_taps, delta_t);

end

    figure('Name','Semi-Implicit Perona-Malik');
    imshow(uint8(diff_im));