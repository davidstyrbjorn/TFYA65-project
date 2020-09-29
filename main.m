clear all;
%samplingsfrekvensen
fs = 44400;
%kalla på funktionen med bildens filväg, minsta och största frekvensvärdet
%och samplingsfrekvensen
yA = image_converter("triangle.png", 10, 669, fs);

%spela upp listan av ljuden med samplingsfrekvensen fs.
%soundsc(yA, fs);


%%

imshow(bild);