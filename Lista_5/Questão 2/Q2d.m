% Se fs = 20000, fs/2 = 10000
% Com base nisso é possível fazer uma regra de 3 para achar as Frequências
% digitais equivalentes a 500 Hz, 1500 Hz, 2500 Hz e 3000 Hz

time=3;                                 % length of time 
Ts=1/20000;                             % time interval between samples
x=randn(1,time/Ts);                     % generate noise signal
figure(1),plotspec(x,Ts);               % draw spectrum of input

N=length(x);                            % length of the signal x
t=Ts*(1:N);                             % define a time vector 
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector 

% Alternativa a
% A FD equivalente a 500 Hz é 0.05, mas também é importante que se dê uma
% faixa de transição, pois o filtro não é perfeito. A faixa escolhida foi
% de 50 Hz.

b=remez(200,[0 0.045 0.05 1],[0 0 1 1]);  % specify the HP filter
yhp=filter(b,1,x);                      % do the filtering                   
figure(2),plotspec(yhp,Ts);              % plot the output spectrum

% Alternativa b
% A FD equivalente a 3000 Hz é 0.3, mas também é importante que se dê uma
% faixa de transição, pois o filtro não é perfeito. A faixa escolhida foi
% de 100 Hz.

b=remez(200,[0 0.29 0.3 1],[1 1 0 0]);  % specify the LP filter
ylp=filter(b,1,x);                      % do the filtering                   
figure(3),plotspec(ylp,Ts)              % plot the output spectrum

% Alternativa c
% A FD equivalente a 1500 Hz é 0.15 e a de 2500 é 0.25. Também é importante que se dê uma
% faixa de transição, pois o filtro não é perfeito. A faixa escolhida foi
% de 100 Hz.

b = remez(200,[0 0.15 0.16 0.24 0.25 1],[1 1 0 0 1 1]);     % Especifica o filtro rejeita-faixa
ybr=filter(b,1,x);                      % Filtra o sinal                   
figure(4),plotspec(ybr,Ts)              % plot the output spectrum

% Plotando os espectros de magnitude
fyhp=fftshift(fft(yhp(1:N)));                
figure(5),subplot(3,1,1), plot(ssf,abs(fyhp))
xlabel('magnitude spectrum at output of high pass filter')
fyl=fftshift(fft(ylp(1:N)));
subplot(3,1,2), plot(ssf,abs(fyl))
xlabel('magnitude spectrum at output of low pass filter')
fybr=fftshift(fft(ybr(1:N)));                
subplot(3,1,3), plot(ssf,abs(fybr))
xlabel('magnitude spectrum at output of band pass filter')

