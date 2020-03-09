function [Bf, AmpBfZ, AmpBfA, AmpBfC] = SpectrumOctave3(p,Fs,pref,mode)
% [Bf, AmpBfZ, AmpBfA, AmpBfC] = SpectrumOctave3(p,Fs,pref,mode)
% Return the frequency spectrum of a signal in Z, A, and C-weighting modes
% in 1/3-octave bands. Each band value corresponcs to the SPL calculation
% (for a given weighting) of the signal filtered in the band.
%
% INPUT
%---- p    : row-vector, acoustic signal [Pa]
%---- Fs   : scalar, sampling frequency [Hz]
%---- pref : scalar, SPL reference pressure [Pa], in general 20 micro Pa
%---- mode : string, SPL mode calculation: 'Fmax','Fmin','Smax','Smin','eq'
%
% OUTPUT
%---- Bf     : row-vector, mid-band frequencies for the 33 1/3-octave bands [Hz]
%---- AmpBfZ : row-vector, same size as Bf, band amplitudes [dB], Z-weighting
%---- AmpBfA : row-vector, same size as Bf, band amplitudes [dB], A-weighting
%---- AmpBfC : row-vector, same size as Bf, band amplitudes [dB], C-weighting


% Normalized mid-band frequencies for 1/3-octave bands
% Bf = [12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];

% Weighting A and C (dB)
pondA = [-63.4 -56.7 -50.5 -44.7 -39.4 -34.6 -30.2 -26.2 -22.5 -19.1 -16.1 -13.4 -10.9 -8.6 -6.6 -4.8 -3.2 -1.9 -0.8 0 0.6 1 1.2 1.3 1.2 1 0.5 -0.1 -1.1 -2.5 -4.3 -6.6 -9.3];
pondC = [-11.2 -8.5 -6.2 -4.4 -3 -2 -1.3 -0.8 -0.5 -0.3 -0.2 -0.1 0 0 0 0 0 0 0 0 0 -0.1 -0.2 -0.3 -0.5 -0.8 -1.3 -2 -3 -4.4 -6.2 -8.5 -11.2];

% Number of bands
NBf = 33;
% Mid-band frequencies
Bf = zeros(1,NBf);
% Bandwidths
AmpBfZ = zeros(1,NBf);

% Band amplitude (dB) of each band
for k = 1:NBf
    Bf(k) = 2^(1/3*(k-1))*12.5; % band k
    pk = FilteringOctave3(p,Fs,Bf(k)); % filtered signal by band k
    if strcmp(mode(1),'F') % mode F
        if Bf(k) > 90
            Tint = 0.125;
        elseif 45 < Bf(k) && Bf(k) < 90
            Tint = 0.25;
        elseif 23 < Bf(k) && Bf(k) < 45
            Tint = 0.5;
        else
            Tint = 1;
        end
        [Lp, Lmin, Lmax] = calcLp(pk,Fs,Tint,pref);
        if strcmp(mode,'Fmax')
            AmpBfZ(k) = Lmax;
        elseif strcmp(mode,'Fmin')
            AmpBfZ(k) = Lmin;
        end
    elseif strcmp(mode(1),'S') % mode S
        Tint = 1;
        [Lp, Lmin, Lmax] = calcLp(pk,Fs,Tint,pref);
        if strcmp(mode,'Smax')
            AmpBfZ(k) = Lmax;
        elseif strcmp(mode,'Smin')
            AmpBfZ(k) = Lmin;
        end
    elseif strcmp(mode,'eq') % mode eq
        AmpBfZ(k) = calcLeq(pk,Fs,pref);
    end
end

AmpBfA = AmpBfZ + pondA;
AmpBfC = AmpBfZ + pondC;

end