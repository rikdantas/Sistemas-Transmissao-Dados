% Antes de tudo executar comando "pkg load signal" para carregar funcaoo firpm

audio = 'exemplo.wav';  % Audio original
[sample, fs] = audioread(audio);

% fs = 44100
% fs/2 = 22050

N = length(sample);
Ts = 1/fs;      % Periodo de amostragem
t =  Ts * (1:N); % Vetor tempo

vetor_audio = transpose(sample);  % Transpose foi usado para virar um vetor linha

eq_ruido = cos(2*pi*2300*t) + cos(2*pi*2600*t); % Parametros dados no projeto
y = vetor_audio + eq_ruido; % Contaminando audio

audiowrite('exemplo_contaminado.wav', y, fs); % Escrevendo audio contaminado

figure(1),plotspec(sample,Ts);  % Sinal original
figure(2),plotspec(y,Ts); % Sinal contaminado

b = firpm(1000,[0 0.0907 0.0952 0.1270 0.1315 1],[1 1 0 0 1 1]);     % Especifica o filtro rejeita-faixa

% fp1 (Hz) = 2000 => fp1 (D) = 0.0907
% fr1 (Hz) = 2100 => fr1 (D) = 0.0952
% fr2 (Hz) = 2800 => fr2 (D) = 0.1270
% fr2 (Hz) = 2900 => fp2 (D) = 0.1315

y_filtrado = filter(b,1,y); % Filtrando o audio
audiowrite('exemplo_filtrado.wav', y_filtrado, fs); % Escrevendo audio filtrado

figure(3),plotspec(y_filtrado,Ts); % Sinal filtrado

figure(4), subplot(2,1,1), plot(t,vetor_audio); % Plotando os sinais original e filtrado para melhor visualização.
xlabel('Sinal original');
subplot(2,1,2), plot(t,y_filtrado);
xlabel('Sinal filtrado');

figure(5), freqz(b);
