function Leq = calcLeq(p,Fs,pref)
% Leq = calcLeq(p,Fs,pref)
% Return the equivalent Sound Pressure Level (SPL) of a signal.
%
% INPUT
%---- p    : row-vector, acoustic signal [Pa]
%---- Fs   : scalar, sampling frequency [Hz]
%---- pref : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%
% OUTPUT
%---- LIeq : scalar, equivalent SPL


% Number of samples
N = length(p);
% Sampling period [s]
Ts = 1/Fs;
% Start and end times [s]
t0 = 0;
tf = t0 + N/Fs;

pmoy = sqrt(Ts/(tf-t0)*sum(p.^2));
Leq = 20*log10(pmoy/pref);

end