clear all;
close all;
clf;
pkg load signal;

# to argv() eina eidiko function tou octave gia na pernas arguments
i = argv();
# epanalipsi apo 1 mexri ton arithmo twn arguments pou dothikan
for a = 1:nargin
filename = i{a,1};
# diabazei ta dedomena tou arxeiou kai to sampling rate tou 
[y,fs]=audioread(i{a,1});

# pername prwta to low-pass filtro
file = fir1(10,0.2,"low");

finalfile = filter(file,1,y);

# kai edw to high-pass
file= fir1(74,0.10,"high");
# ta enwnoume
finalfile=filter(file,1,finalfile);
# dimiougoume ena neo onoma gia to arxeio
name = strjoin({'neo',filename}, '_')
# kai to apothikeuoume 
audiowrite(name,finalfile*3,fs);
endfor
