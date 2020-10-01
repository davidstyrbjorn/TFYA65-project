clear all;
%samplingsfrekvensen
fs = 44400;
%kalla på funktionen med bildens filväg, minsta och största frekvensvärdet
%och samplingsfrekvensen
yA = image_converter("triangle.png", 150, 300, fs);

%spela upp listan av ljuden med samplingsfrekvensen fs.
soundsc(yA, fs);

%%

image = imread("image.jpg");
gray_img = rgb2gray(image);

threshold = graythresh(gray_img);
BW=imbinarize(gray_img,threshold);

%imshowpair(gray_img, BW, 'montage');

test = uint8(BW);


imshow(BW);