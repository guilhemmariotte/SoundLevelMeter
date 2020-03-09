function Lpeak = calcLpeak(p,pref)
% Lpeak = calcLpeak(p,pref)
% Return the peak level of a signal.
%
% INPUT
%---- p    : row-vector, acoustic signal [Pa]
%---- pref : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%
% OUTPUT
%---- Lpeak : scalar, peak level [dB]

pmax = max(abs(p));
Lpeak = 20*log10(pmax/pref);

end