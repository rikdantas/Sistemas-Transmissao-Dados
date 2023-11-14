% AM.m suppressed carrier AM with freq and phase offset
time=.3; Ts=1/10000;                        % sampling interval and time base
t=Ts:Ts:time; lent=length(t);               % define a "time" vector 
fc=1000; c=cos(2*pi*fc*t);                  % define the carrier at freq fc
fm=20; w=5/lent*(1:lent)+cos(2*pi*fm*t);    % create "message" 
v=c.*w;                                     % modulate with carrier
gamma=0; phi=0;                             % freq & phase offset
c2=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c2;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m=2*filter(b,1,x);                          % LPF the demodulated signal

N=length(x);                            % length of the signal x
ssf=(-N/2:N/2-1)/(Ts*N);                % frequency vector

% Plotando os gráficos de magnitude
figure(1)
fw=fftshift(fft(w(1:N)));
subplot(4,1,1), plot(ssf,abs(fw));
title('w(t)');
fv=fftshift(fft(v(1:N)));
subplot(4,1,2), plot(ssf,abs(fv));
title('v(t)');
fx=fftshift(fft(x(1:N)));
subplot(4,1,3), plot(ssf,abs(fx));
title('x(t)');
fm=fftshift(fft(m(1:N)));
subplot(4,1,4), plot(ssf,abs(fm));
title('m(t)');

% Para phi = -pi
gamma=0; phi=-pi;                          % freq & phase offset
c3=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c3;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m2=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = -pi/2
gamma=0; phi=-pi/2;                          % freq & phase offset
c4=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c4;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m3=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = -pi/3
gamma=0; phi=-pi/3;                          % freq & phase offset
c5=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c5;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m4=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = -pi/6
gamma=0; phi=-pi/6;                          % freq & phase offset
c6=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c6;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m5=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = pi/6
gamma=0; phi=pi/6;                          % freq & phase offset
c7=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c7;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m6=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = pi/3
gamma=0; phi= pi/3;                          % freq & phase offset
c8=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c8;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m7=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = pi/2
gamma=0; phi= pi/2;                          % freq & phase offset
c9=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c9;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m8=2*filter(b,1,x);                          % LPF the demodulated signal

% Para phi = pi
gamma=0; phi= pi;                          % freq & phase offset
c10=cos(2*pi*(fc+gamma)*t+phi);              % create cosine for demod
x=v.*c10;                                    % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design 
b=remez(fl,fbe,damps);                      % impulse response of LPF
m9=2*filter(b,1,x);                          % LPF the demodulated signal

% Mensagens recuperadas para phi negativo
figure(2), subplot(5,1,1), plot(t,m2)
ylabel('amplitude'); title('(a) phi = -pi');
subplot(5,1,2), plot(t,m3)
ylabel('amplitude'); title('(b) phi = -pi/2');
subplot(5,1,3), plot(t,m4)
ylabel('amplitude'); title('(c) phi = -pi/3');
subplot(5,1,4), plot(t,m5)
ylabel('amplitude'); title('(d) phi = -pi/6');
subplot(5,1,5), plot(t,m)
ylabel('amplitude'); title('(e) phi = 0');

% Mensagens recuperadas para phi positivo
figure(3), subplot(5,1,1), plot(t,m)
ylabel('amplitude'); title('(a) phi = 0');
subplot(5,1,2), plot(t,m6)
ylabel('amplitude'); title('(b) phi = pi/6');
subplot(5,1,3), plot(t,m7)
ylabel('amplitude'); title('(c) phi = pi/3');
subplot(5,1,4), plot(t,m8)
ylabel('amplitude'); title('(d) phi = pi/2');
subplot(5,1,5), plot(t,m9)
ylabel('amplitude'); title('(e) phi = pi');

figure(4)
subplot(5,1,1), plot(ssf,abs(fm));
title('m(t), phi = 0');
fm2=fftshift(fft(m2(1:N)));
subplot(5,1,2), plot(ssf,abs(fm2));
title('m2(t), phi = -pi');
fm3=fftshift(fft(m3(1:N)));
subplot(5,1,3), plot(ssf,abs(fm3));
title('m3(t), phi = -pi/2');
fm4=fftshift(fft(m4(1:N)));
subplot(5,1,4), plot(ssf,abs(fm4));
title('m4(t), phi = -pi/3');
fm5=fftshift(fft(m5(1:N)));
subplot(5,1,5), plot(ssf,abs(fm5));
title('m5(t), phi = -pi/6');

figure(5)
fm6=fftshift(fft(m6(1:N)));
subplot(4,1,1), plot(ssf,abs(fm6));
title('m6(t), phi = pi/6');
fm7=fftshift(fft(m7(1:N)));
subplot(4,1,2), plot(ssf,abs(fm7));
title('m7(t), phi = pi/3');
fm8=fftshift(fft(m8(1:N)));
subplot(4,1,3), plot(ssf,abs(fm8));
title('m8(t), phi = pi/2');
fm9=fftshift(fft(m9(1:N)));
subplot(4,1,4), plot(ssf,abs(fm9));
title('m9(t), phi = pi');
