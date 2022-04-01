clear all;
close all;
clf;
pkg load signal;

i = argv();
for a = 1:nargin
filename = i{1,a};
[y,fs]=audioread(i{1,a});


b = fir1(500,0.2,"low");

ff = filter(b,1,y);

b= fir1(501,0.10,"high");
ff=filter(b,1,ff);
audiowrite('t1_',filename,ff*3,fs);
endfor
