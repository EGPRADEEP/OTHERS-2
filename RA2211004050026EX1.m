close all 
clear all 
clc
fs=7000;
fm=10;
fc=200;
Am=1;
Ac=1;
t=[0:0.1*fs]/fs;
m=Am*cos(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
ka=0.5;
u=ka*Am;
s1=Ac*(1+u*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(4,3,1:3);
plot(t,m);
title('message signal(fc=10Hz)');
subplot(4,3,4:6);
plot(t,c);
title('carrier signal(fc=200Hz)');
subplot(4,3,7);
plot(t,s1);
title('Under Modulated signal(Ka.Am=0.5)');
ka1=1;
u1=ka1*Am;
s2=Ac*(1+u1*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(4,3,8);
plot(t,s2);
title('Exact  Modulated signal(Ka.Am=1)');
ka2=2;
u3=ka2*Am;
s3=Ac*(1+u3*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(4,3,9);
plot(t,s3);
title('Over  Modulated signal(Ka.Am=1)');
r1=s1.*c;
r2=s2.*c;
r3=s3.*c;
[b,a]=butter(1,0.01);
mr1=filter(b,a,r1);
mr2=filter(b,a,r2);
mr3=filter(b,a,r3);
subplot(4,3,10);
plot(t,mr1);
title('Demodulated signal(U)')
subplot(4,3,11);
plot(t,mr2);
title('Demodulated signal(E)')
subplot(4,3,12);
plot(t,mr3);
title('Demodulated signal(O)')