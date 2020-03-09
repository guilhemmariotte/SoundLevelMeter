function [Lp, Lmin, Lmax] = calcLp(p,Fs,pref,Tint)
% [Lp, Lmin, Lmax] = calcLp(p,Fs,pref,Tint)
% Return the Sound Pressure Level (SPL) of a signal.
%
% INPUT
%---- p    : row-vector, acoustic signal [Pa]
%---- Fs   : scalar, sampling frequency [Hz]
%---- pref : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%---- Tint : scalar, intagration constant [s]: 1 (Slow), 0.125 (Fast), 0.035 (Impulse)
%
% OUTPUT
%---- Lp   : row-vector, instantaneous SPL
%---- Lmin : scalar, min SPL
%---- Lmax : scalar, max SPL


% Number of samples
N = length(p);
% Sampling period [s]
Ts = 1/Fs;
% Start and end times [s]
t0 = 0;
tf = t0 + N/Fs;
% Sample time [s]
t = t0:Ts:(tf-Ts);

% Effective square pressure
p2eff = zeros(1,N);
pk = 0;
for k = 1:N
    pk = pk + p(k)^2*exp(t(k)/Tint);
    p2eff(k) = Ts/Tint*exp(-t(k)/Tint)*pk;
end

% Lp calculation
if Tint == 0.035 % Impulse mode
    fpeak = peakdetector(p2eff,Fs,1.5); % peak detector with a time constant of 1.5 s
    Lp = 10*log10(fpeak/pref^2);
    Lmin = min(Lp);
    Lmax = max(Lp);
else % Fast or Slow modes
    Lp = 10*log10(p2eff/pref^2);
    Lmin = min(Lp);
    Lmax = max(Lp);
end

end