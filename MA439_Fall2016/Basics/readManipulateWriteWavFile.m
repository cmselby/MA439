%How to load .wav file:
[y, Fs]=audioread('handel.wav');
%y is the signal, Fs is the sample rate (in Hertz-that is samples per second)

%Play the .wav file:
sound(y, Fs);

%Need to make a pause so that the following statements will not immediately execute
%The duration here is the number of samples/Hertz = seconds.
duration = numel(y)/Fs;
pause = duration +2 ;  %Add on 2 extra seconds so there is a pause


%Now to make an audio file.
%Will make a file with just part of the preceding file.
%Since there are Fs samples per second, the following gives us the number of
%samples in the first two seconds:
nsamples=2*Fs;
%Will read only the first 2 seconds:
[y2, Fs] = audioread('handel.wav', [1,nsamples]);
sound(y2, Fs);
%Will create a file with just the first two seconds:
audiowrite('ResultFiles/handel2sec.wav',y2, Fs);
