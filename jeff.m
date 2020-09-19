
clear all;
amp=37;
fs=20500;  % sampling frequency
duration=1;
freq=50;
values=0:1/fs:duration;
amp_f= sin(values);
a=amp*sin(2*pi* freq*values);
sound(a);
plot(values,amp_f)
