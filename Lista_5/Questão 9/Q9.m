% AM.m suppressed carrier AM with freq and phase offset
time=.3; Ts=1/10000;                        % sampling interval and time base
t=Ts:Ts:time; lent=length(t);               % define a "time" vector 
fc=1000; c=cos(2*pi*fc*t);                  % define the carrier at freq fc
fm=20; w=5/lent*(1:lent)+cos(2*pi*fm*t);    % create "message" 
v=c.*w;                                     % modulate with carrier
% Para gamma = 0.01
gamma=0.01; phi=0;                          % freq & phase offset
c2=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c2;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m=2*filter(b,1,x);                          % LPF the demodulated signal

% Para gamma = 0.1
gamma=0.1; phi=0;                          % freq & phase offset
c2=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c2;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m2=2*filter(b,1,x);                          % LPF the demodulated signal

% Para gamma = 1
gamma=1; phi=0;                          % freq & phase offset
c2=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c2;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m3=2*filter(b,1,x);                          % LPF the demodulated signal

% Para gamma = 10
gamma=10; phi=0;                          % freq & phase offset
c2=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c2;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m4=2*filter(b,1,x);                          % LPF the demodulated signal

% Mensagem original e mensagens recuperadas
figure(1), subplot(5,1,1), plot(t,w)
axis([0,0.1, -1,3])
ylabel('amplitude'); title('(a) mensagem original');
subplot(5,1,2), plot(t,m)
axis([0,0.1, -2.5,2.5])
ylabel('amplitude'); title('(b) mensagem recuperada para gamma = 0.01');
subplot(5,1,3), plot(t,m2)
axis([0,0.1, -1,3])
ylabel('amplitude'); title('(c) mensagem recuperada para gamma = 0.1');
subplot(5,1,4), plot(t,m3)
axis([0,0.1, -1,3])
ylabel('amplitude'); title('(d) mensagem recuperada para gamma = 1');
subplot(5,1,5), plot(t,m4)
axis([0,0.1, -1,3])
ylabel('amplitude'); title('(e) mensagem recuperada para gamma = 10)');

% Espectros de magnitude de cada m(t)
N=length(x);                            % length of the signal x
%t=Ts*(1:N);                             % define a time vector 
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector

figure(2)
fw=fftshift(fft(w(1:N)));
subplot(5,1,1), plot(ssf,abs(fw));
axis([-100,100, 0,8000])
title('w(t)');
fm=fftshift(fft(m(1:N)));
subplot(5,1,2), plot(ssf,abs(fm));
axis([-100,100, 0,8000])
title('m(t)');
fm2=fftshift(fft(m2(1:N)));
subplot(5,1,3), plot(ssf,abs(fm2));
axis([-100,100, 0,8000])
title('m2(t)');
fm3=fftshift(fft(m3(1:N)));
subplot(5,1,4), plot(ssf,abs(fm3));
axis([-100,100, 0,8000])
title('m3(t)');
fm4=fftshift(fft(m4(1:N)));
subplot(5,1,5), plot(ssf,abs(fm4));
axis([-100,100, 0,8000])
title('m4(t)');

