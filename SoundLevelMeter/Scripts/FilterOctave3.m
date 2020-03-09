function H = FilterOctave3(f,fc)
% H = FilterOctave3(f,fc)
% Return the filter of a given 1/3-octave band.
% fc-band: [2^(-1/6)*fc ; 2^(1/6)*fc].
%
% INPUT
%---- f  : row-vector, sampling of frequencies [Hz]
%---- fc : scalar, mid-band frequency [Hz]
%
% OUTPUT
%---- H : row-vector (complex numbers), filter for the frequencies f

% Low and high cut frequencies
f1 = 2^(-1/6)*fc;
f2 = 2^(1/6)*fc;
% Bandwidth
Br = f2 - f1;
% Reference ratio
Qr = fc/Br;
% Order of the filter
nordre = 3;
% Design ratio, better for Butterworth filter (cf normes ANSI)
Qd = pi/(2*nordre)*1/sin(pi/(2*nordre))*Qr;

% Order 3 Butterworth filter: low-pass filter, variable change p = i*f/fc
HB3 = @(p) 1./((1 + p).*(1 + p + p.^2));
% Variable change for a band-pass filter
pband = 1i*Qd*(f/fc - fc./f);

H = HB3(pband);

end