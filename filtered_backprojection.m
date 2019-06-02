function f = filtered_backprojection(g,theta,x_lim,y_lim,include_hamming)
% FILTERED_BACKPROJECTION Computes the filtered backprojection of the
% sinogram data g where the columns correspond to the angles in theta
% [degrees]. x- and y_range are the values that x and y will go over in the
% resulting image f. Hamming window included if include_hamming.
    
    % Create filter
    [n_l,n_theta] = size(g);
    filter = ramp_filter(n_l,include_hamming);
    
    % Filter the FT of sinogram, go back to spatial domain
    G = fftshift(fft(g,[],1),1);
    filter = repmat(filter,[1,n_theta]);
    G_filtered = filter.*G;
    g_filtered = ifft(ifftshift(G_filtered,1),[],1);
    g_filtered = real(g_filtered);
    
    % Return backprojection
    f = backprojection(g_filtered,theta,x_lim,y_lim);
end