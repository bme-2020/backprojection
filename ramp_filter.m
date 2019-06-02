function filter = ramp_filter(length,include_hamming)
% RAMP_FILTER Creates a ramp filter of length length multiplied by a
% Hamming window if include_hamming.

    freq = linspace(-length/2,length/2,length)';
    filter = abs(freq);
    if include_hamming
        filter = filter.*hamming(length);
    end
end