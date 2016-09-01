function fftLearn_NOCHANGE()
N = 500;                      % Sampling frequency in Hz(samples per second) 
                              % This means we one sample every 1/N seconds                          

T = 1/N;                      % Sample time step (delta t) (seconds)

L = 2;                        % Length of signal (in seconds)

t = (0:T:L-T);                % Time vector (seconds)

npts = N*L;

NF = N/2;                     %The Nyquist frequency.  We are unable to detect frequencies above NF Hz in our signal.

%We consider the sum of a 50 Hz sinusoid and a 100 Hz sinusoid and a
%constant:
%(Note that sin(2*pi*50*t) has period p=1/50; that means the corresponding
%frequency is f=1/p = 50.)

x = .2+0.7*sin(2*pi*50*t) + sin(2*pi*100*t); 

%x = x + 2*randn(size(t));     % Sinusoids plus noise

figure
plot(t, x)
title('Entire signal')
xlabel('time (seconds)') 



%Note that the 50 Hz component will have period 1/50 seconds.  We have N
%samples per second.  Thus, 1/50(seconds) * N (samples/second)  will be the number
%of samples in one period of the sin(2pi50t) component.  Since the period
%of sin(2pi100t) is half of that, we have the period of the signal x is
%N/50 samples or 1/50 seconds.

figure
plot(t(1:N/50),x(1:N/50))
title('One Period of Signal')
xlabel('time (seconds)')


%Must watch out for how Matlab defines the FFT!  
X = fft(x)/npts;

%Read Remark 2.4 in your textbook.  Since our signal x is real, we have
%that X_{NFFT/2-j} = conj(X_{NFFT/2+j}).  This means the magnitudes of
%these two complex numbers are the same!  Let's look at plots to confirm.


%The frequency array is (0:npts-1)*1/L
%Why? The sampling rate is N samples per second so we are looking at the frequencies (k/L),
%since we are considering e^{(2pi i (k/L) t)/N}, t in [0, L).
figure
plot((0:npts-1)*1/(L), abs(X), 'b*')
title('Amplitude Spectrum of x(t)')
xlabel('Frequency (Hz)')
ylabel('Magnitude')


%Let's see that we may consider only half of the frequency space:
f=1/(L)*(0:npts/2-1);
sig = 2*abs(X(1:npts/2));
sig(1) = 1/2*(sig(1));  %0 frequency component should not be multiplied by 2!
% Plot single-sided amplitude spectrum.
figure
plot(f,sig, 'b*') 
title('Single-Sided Amplitude Spectrum of x(t)')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

end