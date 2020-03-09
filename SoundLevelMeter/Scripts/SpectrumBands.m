function [f, PSDdB, Bf, AmpBfZ, AmpBfA, AmpBfC] = SpectrumBands(p,Fs,pref,wname)
% [f, PSDdB, Bf, AmpBfZ, AmpBfA, AmpBfC] = SpectrumBands(p,Fs,wname,pref)
% Return the frequency spectrum of a signal in Z, A, and C-weighting modes
% in 1/3-octave bands. Each band value corresponcs to the integration of
% the power spectral density of the signal over the bandwidth (for a given
% weighting).
%
% INPUT
%---- p     : row-vector, acoustic signal [Pa]
%---- Fs    : scalar, sampling frequency [Hz]
%---- pref  : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%---- wname : window function handle: @rectwin, @hann, @hamming, @blackman
%
% OUTPUT
%---- f      : row-vector, same size as p, sampling of frequencies [Hz]
%---- PSDdB  : row-vector, same size as p, power spectral density [dB]
%---- Bf     : row-vector, mid-band frequencies for the 33 1/3-octave bands [Hz]
%---- AmpBfZ : row-vector, same size as Bf, band amplitudes [dB], Z-weighting
%---- AmpBfA : row-vector, same size as Bf, band amplitudes [dB], A-weighting
%---- AmpBfC : row-vector, same size as Bf, band amplitudes [dB], C-weighting


% Signal power spectral density
N = length(p);
[f, PSD] = DensitySp(p,Fs,wname);
PSDdB = 10*log10(PSD/pref^2);

% Normalized mid-band frequencies for 1/3-octave bands
% Bf = [12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];

% Weighting A and C (dB)
pondA = [-63.4 -56.7 -50.5 -44.7 -39.4 -34.6 -30.2 -26.2 -22.5 -19.1 -16.1 -13.4 -10.9 -8.6 -6.6 -4.8 -3.2 -1.9 -0.8 0 0.6 1 1.2 1.3 1.2 1 0.5 -0.1 -1.1 -2.5 -4.3 -6.6 -9.3];
pondC = [-11.2 -8.5 -6.2 -4.4 -3 -2 -1.3 -0.8 -0.5 -0.3 -0.2 -0.1 0 0 0 0 0 0 0 0 0 -0.1 -0.2 -0.3 -0.5 -0.8 -1.3 -2 -3 -4.4 -6.2 -8.5 -11.2];

% Int?gration de l'amplitude dans chaque bande
% Number of bands
NBf = 33;
% Mid-band frequencies
Bf = zeros(1,NBf);
% Mean band amplitudes
AmpBfZ = zeros(1,NBf);

Bf(1) = 12.5; % bande 1
Bfkmin = 2^(-1/6)*Bf(1); % lower bound band 1
Bfkmax = 2^(1/6)*Bf(1); % upper bound band 1
Bfkbool = (Bfkmin <= f).*(f < Bfkmax);
PSDk = PSD.*Bfkbool; % PSD of band 1
AmpBfZ(1) = 10*log10(Fs/N*sum(PSDk)/pref^2); % cumul of PSD in this band
for k = 2:NBf
    Bf(k) = 2^(1/3)*Bf(k-1); % band k
    Bfkmin = 2^(1/6)*Bf(k-1); % lower bound band k
    Bfkmax = 2^(1/2)*Bf(k-1); % upper bound band k
    Bfkbool = (Bfkmin <= f).*(f < Bfkmax);
    PSDk = PSD.*Bfkbool; % PSD of band k
    AmpBfZ(k) = 10*log10(Fs/N*sum(PSDk)/pref^2); % cumul of PSD in this band
end

AmpBfA = AmpBfZ + pondA;
AmpBfC = AmpBfZ + pondC;

end
