% Com base nisso é possível fazer uma regra de 3 para achar as Frequências
% digitais equivalentes a 1500 Hz e 2500Hz

time=3;                                 % length of time 
Ts=1/10000;                             % time interval between samples
x=randn(1,time/Ts);                     % generate noise signal
figure(1),plotspec(x,Ts);               % draw spectrum of input

% A FD equivalente a 1500 Hz é 0.3 e a de 2500 é 0.5. Também é importante que se dê uma
% faixa de transição, pois o filtro não é perfeito. A faixa escolhida foi
% de 100 Hz.

b = remez(100,[0 0.3 0.32 0.48 0.5 1],[1 1 0 0 1 1]);     % Especifica o filtro rejeita-faixa
ybr=filter(b,1,x);                      % Filtra o sinal                   
figure(2),plotspec(ybr,Ts)              % plot the output spectrum

N=length(x);                            % length of the signal x
t=Ts*(1:N);                             % define a time vector 
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector 

fybr=fftshift(fft(ybr(1:N)));                
figure(3), plot(ssf,abs(fybr));
xlabel('Espectro de magnitude da saída do filtro');