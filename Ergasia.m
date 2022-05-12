clear all;
close all;
clf;
pkg load signal;

i = argv();
for a = 1:nargin
filename = i{a,1};
[y,fs]=audioread(i{a,1});


b = fir1(10,0.2,"low");

ff = filter(b,1,y);

b= fir1(74,0.10,"high");
ff=filter(b,1,ff);
name = strjoin({'neo',filename}, '_')
audiowrite(name,ff*3,fs);
endfor
