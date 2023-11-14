% AMlarge.m: large carrier AM demodulated with "envelope"
time=.08; Ts=1/10000;                          % sampling interval and time
t=0:Ts:time; lent=length(t);                   % define a "time" vector 
phi = 0;
fc=1000; c=cos(2*pi*fc*t + phi);                     % define carrier at freq fc
fm=20; w=1+cos(2*pi*fm*t);                     % create "message" > -1
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv=(pi/2)*filter(b,1,abs(v));                % find envelope

% Para phi = 0.1
phi = 0.1; c=cos(2*pi*fc*t + phi);
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv2=(pi/2)*filter(b,1,abs(v));                % find envelope

% Para phi = 0.5
phi = 0.5; c=cos(2*pi*fc*t + phi);
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv3=(pi/2)*filter(b,1,abs(v));                % find envelope

% Para phi = pi/3
phi = pi/3; c=cos(2*pi*fc*t + phi);
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv4=(pi/2)*filter(b,1,abs(v));                % find envelope

% Para phi = pi/2
phi = pi/2; c=cos(2*pi*fc*t + phi);
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv5=(pi/2)*filter(b,1,abs(v));                % find envelope

% Para phi = pi
phi = pi; c=cos(2*pi*fc*t + phi);
v=c.*w+c;                                      % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design 
b=remez(fl,fbe,damps);                         % impulse response of LPF
envv6=(pi/2)*filter(b,1,abs(v));                % find envelope




% generate the figure
figure(1)
subplot(6,1,1), plot(t,envv)
ylabel('amplitude'); title('(a) envelope for phi = 0');
axis([0,0.08, -1,4])
subplot(6,1,2), plot(t,envv2)
ylabel('amplitude'); title('(b) envelope for phi = 0.1');
axis([0,0.08, -1,4])
subplot(6,1,3), plot(t,envv3)
ylabel('amplitude'); title('(c) envelope for phi = 0.5');
axis([0,0.08, -3,4])
subplot(6,1,4), plot(t,envv4)
ylabel('amplitude'); title('(d) envelope for phi = pi/3');
axis([0,0.08, -1,4])
subplot(6,1,5), plot(t,envv5)
ylabel('amplitude'); title('(d) envelope for phi = pi/2');
axis([0,0.08, -1,4])
subplot(6,1,6), plot(t,envv6)
ylabel('amplitude'); title('(d) envelope for phi = pi');
axis([0,0.08, -1,4])


