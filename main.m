clear all;

bild = imread("test_bild2.png");
gray_img = rgb2gray(bild)/255;

img_size = size(gray_img);

min = 10;
max = 1000;

list_freq = zeros(1, img_size(1));

width = img_size(2);
height = img_size(1);

for x = 1:width
   for y = 1:height
       if gray_img(y,x) == 1
           ratio = (height-y)/height;
           if(y == height)
               ratio = 0
           elseif(y == 1)
               ratio = 1
           end
           value = min + (max-min)*ratio;
           list_freq(1,x) = list_freq(1,x) + value;
       end
   end
end


