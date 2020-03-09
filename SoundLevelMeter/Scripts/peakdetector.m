function fpeak = peakdetector(p,Fs,Tdecr)
% fpeak = peakdetector(p,Fs,Tdecr)
% Apply a peak detector to a given signal.
%
% INPUT
%---- p     : row-vector, acoustic signal [units]
%---- Fs    : scalar, sampling frequency [Hz]
%---- Tdecr : detector time constant [s]
%
% OUTPUT
%---- fpeak : row-vector, resulting peak detection signal

% Number of samples
N = length(p);
% Sampling period [s]
Ts = 1/Fs;
% Start and end times [s]
t0 = 0;
tf = t0 + N/Fs;
% Sample time [s]
t = t0:Ts:(tf-Ts);

fpeak = zeros(1,N);

fpeak(1) = p(1);
pdecr = p(1);
tdecr = t(1);
for k = 2:N
    if fpeak(k-1) == p(k-1) % if stuck to the signal
        if p(k) >= p(k-1) % still stuck if the signal increases
            fpeak(k) = p(k);
        else % leave the signal with an exponential decay (constant Tdecr) if the signal decreases
            pdecr = p(k-1);
            tdecr = t(k-1);
            fpeak(k) = pdecr*exp(-(t(k)-tdecr)/Tdecr);
        end
    else % if not stuck to the signal, the exponential decay continues
        fpeak(k) = pdecr*exp(-(t(k)-tdecr)/Tdecr);
        if fpeak(k) < p(k) % stuck to the signal as soon as the decay would go below it
            fpeak(k) = p(k);
        end
    end
end

end