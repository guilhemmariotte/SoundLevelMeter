function pdB = todB(p,pref)
% pdB = todB(p,pref)
% Convert the signal p in dB units.
%
% INPUTS
%---- p    : vector, acoustic signal [units]
%---- pref : scalar, reference signal value for the dB conversion [units]
%
% OUTPUTS
%---- pdB : vector, same size as p, converted signal [dB]

pdB = ((p > 0).*10.*log10(p.^2/pref^2) - (p < 0).*10.*log10(p.^2/pref^2)).*(abs(p) > pref);

end