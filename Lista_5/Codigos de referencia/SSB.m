clear; clf;

ts=1.e-4;
t=-0.04:ts:0.04;
fc=300;
%m_sig=triangl((t+0.01)/0.01)-triangl((t-0.01)/0.01); %Sinal modulante triangular
m_sig=sinc(t/0.01); %Sinal modulante sinc
%figure
%plot(t,m_sig)
Lm_sig=length(m_sig);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);
M_fre=fftshift(fft(m_sig,Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqm,abs(M_fre));
B_m=150; %Assume-se como banda essencial do sinal o valor de B_m Hz.
h=fir1(40,B_m*(2*ts)); %Filtro passa-baixa FIR projetado pelo método da janela (Hamming) com freq de corte B_m Hz e ordem 40.
%plot(freqm,abs(fftshift(fft(h,Lfft))))

s_dsb=m_sig.*cos(2*pi*fc*t);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);
S_dsb=fftshift(fft(s_dsb,Lfft));

%%%Filtro passa-alta ideal
%L_lsb=floor(fc*ts*Lfft); %O índice na freq que corresponde ao valor da freq da portadora, já que: k*f0=fc (logo k=fc*N/fs).
%SSBfilt=ones(1,Lfft);
%SSBfilt(Lfft/2-L_lsb+1:Lfft/2+L_lsb)=zeros(1,2*L_lsb); %O indice Lfft/2 vai ser posicionado no índice 0 quando o gráfico for traçado.
%freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqs,SSBfilt)
%%%%%%%%%%%%

%%%Filtro passa-alta com freq de corte fc
h_hp=fir1(40,fc*(2*ts),'high');
H_hp=fftshift(fft(h_hp,Lfft));
SSBfilt=H_hp;
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqs,abs(H_hp))

S_ssb=S_dsb.*SSBfilt; %Filtragem no domínio da freq. resultando no espectro USB.
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
%plot(freqs,abs(S_ssb));
s_ssb=real(ifft(fftshift(S_ssb)));
s_ssb=s_ssb(1:Lm_sig);
%plot(t,s_ssb)

%Demodulação coerente
s_dem=s_ssb.*cos(2*pi*fc*t)*2;
%plot(t,s_dem)
S_dem=fftshift(fft(s_dem,Lfft));
%plot(freqs,abs(S_dem))

%Sinal recuperado por meio de um filtro passa-baixa freq de corte 150 Hz
s_rec=filter(h,1,s_dem);
%figure;
%plot(t,s_rec);
S_rec=fftshift(fft(s_rec,Lfft));
%plot(freqs,abs(S_rec))
