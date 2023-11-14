% AM.m suppressed carrier AM with freq and phase offset
time=.5; Ts=1/10000;                        % sampling interval and time base
t=Ts:Ts:time; lent=length(t);               % define a "time" vector 

% Criando a mensagem w(t)
% Ruido branco
noise=randn(1,time/Ts);                     % generate noise signal

% Filtrando o ruido
b = remez(500,[0 0.02 0.024 1],[1 1 0 0]);     % Especifica o filtro passa baixa
w=filter(b,1,noise);                      % Filtra o sinal                   
plotspec(w,Ts)