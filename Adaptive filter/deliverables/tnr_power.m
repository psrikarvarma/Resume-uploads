function [tonal_power, non_tonal_power] = tnr_power(x, freq)

    % Finds the power of tonal and non tonal components of a signal
    fs = 44100;
    N_fft = 2^nextpow2(length(x));
    x_padded = [x(:); zeros(N_fft - length(x), 1)];
    fft_res = myFFT(x_padded);
    fft_out = abs(fft_res(1:N_fft/2)).^2;
    freq_axis = (0:N_fft/2-1) * fs / N_fft;
    
    bw = 10; % Bandwidth around each tone (10 Hz)

    tonal_power = zeros(length(freq), 1);
    mask = false(size(freq_axis));

    for i = 1:length(freq)
        j = find(freq_axis >= freq(i) - bw & freq_axis <= freq(i) + bw);
        tonal_power(i) = tonal_power(i) + (fft_out(j)' * fft_out(j));
        mask(j) = true;
    end

    non_tonal_power = (fft_out(~mask)' * fft_out(~mask));
end