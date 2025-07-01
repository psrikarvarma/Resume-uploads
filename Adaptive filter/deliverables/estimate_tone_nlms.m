function [t_hat, w] = estimate_tone_nlms(noise, f0, n, L, w)

    % Tone estimation using NLMS
    
    mu = 0.01; % Step size
    fs = 44100;
    
    % Reference sinusoidal signal
    x = [cos(2*pi*(n:-1:n-L+1)*f0/fs)'; sin(2*pi*(n:-1:n-L+1)*f0/fs)'];
    
    % NLMS adaptation
    t_hat = w' * x;
    e = noise - t_hat;
    norm_factor = (x' * x) + 1e-6;
    
    w = w + (mu / norm_factor) * e * x;
end