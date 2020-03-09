function [f, PSD] = DensitySp(p,Fs,wname)
% [f, PSD] = DensitySp(p,Fs,wname)
% Return the Power Spectral Density (PSD) of an acoustic signal.
%
% INPUT
%---- p     : row-vector, acoustic signal [units]
%---- Fs    : scalar, sampling frequency [Hz]
%---- wname : window function handle: @rectwin, @hann, @hamming, @blackman
%
% OUTPUT
%---- f   : row-vector, same size as p, sampling of frequencies [Hz]
%---- PSD : row-vector, same size as p, power spectral density [units^2/Hz]

% Number of samples
N = length(p);

% Window
w = window(wname,N)';
% Windowed signal
signalw = p.*w;

% Signal FFT
fftSW = fft(signalw);

% Frequency sampling
f = (1:N).*Fs/N;

% Power spectral density [units^2/Hz]
PSD = 2*N/Fs*abs(fftSW).^2/(N*sum(w.^2));

end