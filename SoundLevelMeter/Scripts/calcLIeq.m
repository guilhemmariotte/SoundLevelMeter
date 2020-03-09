function LIeq = calcLIeq(p,Fs,pref)
% LIeq = calcLIeq(p,Fs,pref)
% Return the equivalent Sound Pressure Level (SPL) in Impulse mode of a
% signal.
%
% INPUT
%---- p    : row-vector, acoustic signal [Pa]
%---- Fs   : scalar, sampling frequency [Hz]
%---- pref : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%
% OUTPUT
%---- LIeq : scalar, equivalent SPL in Impulse mode


% Number of samples
N = length(p);
% Sampling period [s]
Ts = 1/Fs;
% Start and end times [s]
t0 = 0;
tf = t0 + N/Fs;

% Instantaneous SPL in Impulse mode
LI = calcLp(p,Fs,pref,0.035);

Lmoy = Ts/(tf-t0)*sum(10.^(LI/10));
LIeq = 10*log10(Lmoy);

end