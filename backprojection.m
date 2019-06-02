function f = backprojection(g,theta,x_lim,y_lim)
% BACKPROJECTION Computes the backprojection of the sinogram data g where
% the columns correspond to the angles in theta [degrees]. x- and y_range
% are the values that x and y will go over in the resulting image f.
    
    % Data and image parameters
    [n_l,n_theta] = size(g);
    l_offset = ceil(n_l/2);
    x_offset = -x_lim(1)+1;
    y_offset = -y_lim(1)+1;
    n_x = x_lim(2)-x_lim(1)+1;
    n_y = y_lim(2)-y_lim(1)+1;
    
    % Compute the back projection f for each x (column) and y (row)
    f = zeros(n_y,n_x);
    for x = x_lim(1):x_lim(2)
        for y = y_lim(1):y_lim(2)
            for i = 1:n_theta
                l = round(x*cosd(theta(i))+y*sind(theta(i)));
                l = l+l_offset;
                f(y+y_offset,x+x_offset) = f(y+y_offset,x+x_offset)+g(l,i);
            end
        end
    end
    
    % Normalize f
    f = pi/(2*n_theta)*f;
end