% AM.m suppressed carrier AM with freq and phase offset
time=.5; Ts=1/10000;                        % sampling interval and time base
t=Ts:Ts:time; lent=length(t);               % define a "time" vector 

% Criando a mensagem w(t)
% Ruido branco
noise=randn(1,time/Ts);                     % generate noise signal

% Filtrando o ruido
b = remez(500,[0 0.02 0.024 1],[1 1 0 0]);     % Especifica o filtro passa baixa
w=filter(b,1,noise);                      % Filtra o sinal                   
figure(1),plotspec(w,Ts);

% Adição
fm = 1000;
add = w + cos(2*pi*fm*t);

% Square-law device
sldevice = add.^2;

% Filtro passa banda centrado no fm
b = remez(500,[0 0.17 0.18 0.22 0.23 1],[0 0 1 1 0 0]);     % Especifica o filtro passa banda
v = filter(b,1,sldevice);
% Demodulando
x = v.*cos(2*pi*fm*t);

% Aplicando filtro passa-baixa
b = remez(500,[0 0.02 0.024 1],[1 1 0 0]);     % Especifica o filtro passa baixa
m=2*filter(b,1,x);                          % LPF the demodulated signal
figure(2), plotspec(m,Ts);

% Plotando figura igual ao do arquivo am.m
figure(3),subplot(4,1,1), plot(t,w)
ylabel('amplitude'); title('(a) message signal');
subplot(4,1,2), plot(t,v)
ylabel('amplitude'); title('(b) message after modulation');
subplot(4,1,3), plot(t,x)
ylabel('amplitude'); title('(c) demodulated signal');
subplot(4,1,4), plot(t,m)
ylabel('amplitude'); title('(d) recovered message is a LPF applied to (c)');

