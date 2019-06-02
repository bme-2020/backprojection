function f = convolution_backprojection(g,theta,x_lim,y_lim,include_hamming)
% CONVOLUTION_BACKPROJECTION Computes the convolution backprojection of the
% sinogram data g where the columns sorrespond to the angles in theta
% [degrees]. x- and y_range are the values that x and y will go over in the
% resulting image f. Hamming window included if include_hamming.

    % Create filter
    n_l = size(g,1);
    filter = ramp_filter(n_l,include_hamming);
    filter = fftshift(filter);
    filter = ifftshift(ifft(filter));

    % Filter g in spatial domain (convolution)
    g_filtered = conv2(g,filter,'same');
    g_filtered = real(g_filtered);
    
    % Return backprojection
    f = backprojection(g_filtered,theta,x_lim,y_lim);
end