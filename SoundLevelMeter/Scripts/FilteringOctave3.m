function pfilter = FilteringOctave3(p,Fs,fc)
% pfilter = FilteringOctave3(p,Fs,fc)
% Return a signal filtered in a given 1/3-octave band.
%
% INPUT
%---- p  : row-vector, acoustic signal [units]
%---- Fs : scalar, sampling frequency [Hz]
%---- fc : scalar, mid-band frequency [Hz]
%
% OUTPUT
%---- pfilter : row-vector, filtered signal [units]

% Number of samples
N = length(p);

% Frequency sampling and signal FFT
f = (1:N)*Fs/N;
fftp = fft(p);

% Filter for the 1/3-octave band fc
H = FilterOctave3(f,fc);

% Filter application accounting for the symmetrical part of the FFT
fftp1 = fftp(1:floor((N+1)/2)).*H(1:floor((N+1)/2));
fftp2 = zeros(1,N);
fftp2(1:floor((N+1)/2)) = fftp1;
for j = (floor((N+1)/2)+1):N
    fftp2(j) = conj(fftp1(N-j+1));
end

% Filter application without accounting for the symmetrical part of the FFT
fftp2 = fftp.*H;

pfilter = ifft(fftp2,'symmetric');

end