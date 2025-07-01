clc; clearvars; close all;

s = load('Adarsh A - clean_speech.txt'); % Clean speech
w = load('Adarsh A - external_noise.txt'); % External noise
sv = load('Adarsh A - noisy_speech.txt'); % Noisy speech

% Mode of noise cancellation
mode = 0; % 0 for 'full' and 1 for 'partial'
user_freqs = [1000]; % User supplied frequencies to be retained

fs = 44100; % Sampling frequency
N = length(w); % Total number of samples

L = 10; % Filter length or taps

% RLS init
P_matrix = eye(L) / 1e-6;
w_RLS = zeros(L, 1);
v_hat = zeros(N, 1);

lambda = 0.9999; % Forgetting factor

if (mode)
    % Tone estimation NLMS init
    tonal_est = zeros(length(user_freqs), 1);
    w_tones = zeros(2*L, length(user_freqs));
end

for n = L:N
    if (mode)
        % Tonal estimation
        for i = 1:length(user_freqs)
            [tonal_est(i), w_tones(:,i)] = estimate_tone_nlms(w(n), user_freqs(i), n, L, w_tones(:,i));
            w(n) = w(n) - tonal_est(i);
        end
    end
    
    % RLS adaptation
    x = w(n:-1:n-L+1);
    k = P_matrix * x / (lambda + x' * P_matrix * x);
    e = sv(n) - w_RLS' * x;
    w_RLS = w_RLS + k * e;
    P_matrix = (P_matrix - k * x' * P_matrix) / lambda;
    v_hat(n) = w_RLS' * x;
end

output = sv - v_hat; % Output (Error Signal)
output_noise = output - s; % Output noise (Tonal + Non-tonal)

if (~mode | isempty(user_freqs))

    % SNR calculations (Full suppression metric)
    initial_snr = 10 * log10(sum(s.^2) / sum((sv - s).^2));
    final_snr = 10 * log10(sum(s.^2) / sum((output - s).^2));
    
    disp(['SNR Input: ', num2str(initial_snr), ' dB']);
    disp(['SNR Output: ', num2str(final_snr), ' dB']);
    disp(['SNR Gain: ', num2str(final_snr - initial_snr), ' dB']);
else
    % TNR Gain calculations (Partial suppression metric)
    [tonal_power_in, non_tonal_power_in] = tnr_power(sv-s, user_freqs);
    [tonal_power_out, non_tonal_power_out] = tnr_power(output_noise, user_freqs);
    tonal_power_ratio = zeros(length(user_freqs), 1);
    
    for i = 1:length(user_freqs)
        tonal_power_ratio(i) = tonal_power_out(i)/tonal_power_in(i);
        disp(['Tonal power ratio / retention (', num2str(user_freqs(i)), 'Hz): ', num2str(tonal_power_ratio(i)), ' or ', num2str(tonal_power_ratio(i)*100), '%']);
    end
    tnr_input = 10*log10(sum(tonal_power_in)/non_tonal_power_in);
    tnr_output = 10*log10(sum(tonal_power_out)/non_tonal_power_out);
    norm_tnr_output = 10*log10(sum(tonal_power_out ./ tonal_power_ratio)/non_tonal_power_out);
    
    disp(['TNR Input noise: ', num2str(tnr_input), 'dB']);
    disp(['TNR Output noise: ', num2str(tnr_output), 'dB']);
    disp(['Normalized TNR Gain: ', num2str(norm_tnr_output - tnr_input), 'dB']);
end

% Writing the audio to 'output.wav' file
audiowrite("output.wav", output/max(abs(output)), fs);
disp('Output written to output.wav');