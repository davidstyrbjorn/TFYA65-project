clear all;

bild = imread("pixel_heart.png");
gray_img = rgb2gray(bild)/255;

img_size = size(gray_img);

min = 10;
max = 350;

freq_list = zeros(1, img_size(1));

width = img_size(2);
height = img_size(1);

for x = 1:width
   total_freq = 0;
   for y = 1:height
       t = 1-(y-1)/(height-1);
       total_freq = total_freq + (min+(max-min)*t) * double(gray_img(y,x));
   end
   freq_list(1, x) = (total_freq);
end

clear total_freq;

%% 

fs = 44100;
duration = 0.5;
t = [0 : 1/fs : duration];

yA = [];
for i = 1:size(freq_list, 2)
    yi = sin(2*pi*freq_list(i)*t);
    temp = cat(2, yA, yi);
    yA = temp;
end

soundsc(yA, fs);


%%

imshow(bild);