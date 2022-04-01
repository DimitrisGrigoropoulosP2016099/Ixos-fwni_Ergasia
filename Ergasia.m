clear all;
close all;
clf;
pkg load signal;

[y,fs] = audioread('t1.wav');

b = fir1(500,0.2,"low");

a = filter(b,1,y);

b= fir1(501,0.10,"high");
a=filter(b,1,a);
audiowrite('t1_neo.wav',a*3,fs);
