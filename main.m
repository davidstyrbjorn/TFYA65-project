clear all;
%samplingsfrekvensen
fs = 44400;
%kalla p� funktionen med bildens filv�g, minsta och st�rsta frekvensv�rdet
%och samplingsfrekvensen
yA = image_converter("triangle.png", 10, 669, fs);

%spela upp listan av ljuden med samplingsfrekvensen fs.
%soundsc(yA, fs);


%%

imshow(bild);