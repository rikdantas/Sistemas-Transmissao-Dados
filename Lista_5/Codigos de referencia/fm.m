clear; clf;

ts=1.e-4;
t=-0.04:ts:0.04;
fc=500;
m_sig=triangl((t+0.01)/0.01)-triangl((t-0.01)/0.01); %Sinal modulante triangular
%figure
%plot(t,m_sig)
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);
M_fre=fftshift(fft(m_sig,Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqm,abs(M_fre));
B_m=150; %Assume-se como banda essencial do sinal o valor de B_m Hz.
h=fir1(80,B_m*(2*ts)); %Filtro passa-baixa FIR projetado pelo método da janela (Hamming) com freq de corte B_m Hz e ordem 40.
%plot(freqm,abs(fftshift(fft(h,Lfft))))

kf=160*pi;
m_intg=ts*cumsum(m_sig);
s_fm=cos(2*pi*fc*t+kf*m_intg); %Sinal FM
%plot(t,s_fm)
S_fm=fftshift(fft(s_fm,Lfft)); %Espectro do sinal FM
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqs,abs(S_fm)) %Espectro de magnitudes do sinal FM

%Demodulação do sinal FM
s_fmdem=diff([s_fm(1) s_fm])/ts/kf; %Sinal FM derivado (primeiro passo da demodulação)
%plot(t,s_fmdem)
s_fmrec=s_fmdem.*(s_fmdem>0); %Sinal FM derivado e retificado (retificador de meia onda, segundo passo da demodulação)
s_dec=filter(h,1,s_fmrec); %Sinal demodulado após uma filtragem passa baixa (terceiro passo da demodulação)
plot(t,s_dec)
