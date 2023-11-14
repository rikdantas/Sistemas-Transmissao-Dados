% Se fs = 10000, fs/2 = 5000
% Com base nisso é possível fazer uma regra de 3 para achar as Frequências
% digitais equivalentes a 500 Hz

time=3;                                 % length of time 
Ts=1/10000;                             % time interval between samples
x=randn(1,time/Ts);                     % generate noise signal
figure(1),plotspec(x,Ts);               % draw spectrum of input

% A FD equivalente a 500 Hz é 0.1, mas também é importante que se dê uma
% faixa de transição, pois o filtro não é perfeito. A faixa escolhida foi
% de 50 Hz.

b=remez(100,[0 0.09 0.1 1],[0 0 1 1]);  % specify the HP filter
yhp=filter(b,1,x);                      % do the filtering                   
figure(2),plotspec(yhp,Ts);              % plot the output spectrum

N=length(x);                            % length of the signal x
t=Ts*(1:N);                             % define a time vector 
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector 

fyhp=fftshift(fft(yhp(1:N)));                
figure(3), plot(ssf,abs(fyhp));
xlabel('Espectro de magnitude da saída do filtro');