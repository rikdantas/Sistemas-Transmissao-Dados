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
figure(2), plotspec(sldevice,Ts);

% Filtro passa banda centrado no fm
b = remez(500,[0 0.17 0.18 0.22 0.23 1],[0 0 1 1 0 0]);     % Especifica o filtro passa banda
x = filter(b,1,sldevice);
figure(3), plotspec(x,Ts);




