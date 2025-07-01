function X = myFFT(x)
    x = x(:);
    N = length(x);

    if N == 1
        X = x;
        return;
    end

    even_part = myFFT(x(1:2:end));  
    odd_part  = myFFT(x(2:2:end));
    
    % Compute FFT using twiddle factors
    X = zeros(N, 1);
    W_N = exp(-2j * pi * (0:N/2-1)' / N);
    X(1:N/2)     = even_part + W_N .* odd_part;
    X(N/2+1:N)   = even_part - W_N .* odd_part;
end