function [tcut, pcut] = CutSignal(p,Fs,t1,t2)
% [tcut, pcut] = CutSignal(p,Fs,t1,t2)
% Return a signal cut to a given time window [t1, t2].
%
% INPUT
%---- p  : row-vector, acoustic signal [units]
%---- Fs : scalar, sampling frequency [Hz]
%---- t1 : scalar, start time [s],  t1 >= 0
%---- t2 : scalar, end time [s], t2 <= length(p)/Fs
%
% OUTPUT
%---- tcut : row-vector, sample time on [t1, t2]
%---- pcut : row-vector, acoustic signal on [t1, t2]


% Number of samples
N = length(p);
% Start and end time of the signal [s]
t0 = 0;
tf = t0 + N/Fs;
% Sampling period [s]
Ts = 1/Fs;
% Sample time [s]
t = t0:Ts:(tf-Ts);

t1bool = (t1 <= t);
n1 = N - sum(t1bool) + 1; % index corresponding to t1
t2bool = (t <= t2-Ts);
n2 = sum(t2bool); % index corresponding to t2

tcut = t(n1:n2);
pcut = p(n1:n2);

end