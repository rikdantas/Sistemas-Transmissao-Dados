% Se fs = 10000, fs/2 = 5000
% Com base nisso � poss�vel fazer uma regra de 3 para achar as Frequ�ncias
% digitais equivalentes a 3000 Hz

time=3;                                 % length of time 
Ts=1/10000;                             % time interval between samples
x=randn(1,time/Ts);                     % generate noise signal
figure(1),plotspec(x,Ts);               % draw spectrum of input

% A FD equivalente a 3000 Hz � 0.6, mas tamb�m � importante que se d� uma
% faixa de transi��o, pois o filtro n�o � perfeito. A faixa escolhida foi
% de 100 Hz.

b=remez(100,[0 0.6 0.62 1],[1 1 0 0]);  % specify the LP filter
ylp=filter(b,1,x);                      % do the filtering                   
figure(2),plotspec(ylp,Ts)              % plot the output spectrum

N=length(x);                            % length of the signal x
t=Ts*(1:N);                             % define a time vector 
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector 

fylp=fftshift(fft(ylp(1:N)));                
figure(3), plot(ssf,abs(fylp));
xlabel('Espectro de magnitude da sa�da do filtro');