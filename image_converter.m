function yA = image_converter(filePath, min_freq, max_freq, sampling_freq)

% L�ser in bilden
bild = imread(filePath);
%Omvandlar bilden till en bin�r bild.
gray_img = rgb2gray(bild);
threshold = graythresh(gray_img);
BW = imbinarize(gray_img,threshold);

img_size = size(gray_img);

% fyller en lista av storleken 1 x bilden storlek, med nollor. 
freq_list = zeros(1, img_size(1));

% Width �r bildens kolumner och height bildens rader
width = img_size(2);
height = img_size(1);

% loopar igenom alla kolumner
for x = 1:width
   total_freq = 0;
   %loopar igenom alla rader
   for y = 1:height
       % t �r tiden fr�n f�rsta raden till den sista
       t = 1-(y-1)/(height-1);
       %den totala frekvensen  adderas med den mista frekvensen plus
       %distansen mellan min och max g�nger tiden (linear interpolation)
       %f�r varje cell av bilden
       total_freq = total_freq + (min_freq+(max_freq-min_freq)*t) * double(BW(y,x));
   end
   %fyller kolumnerna med den totala frekvensen s� att vi kan spela dessa
   %toner efter varandra.
   freq_list(1, x) = (total_freq);
end

%clear on�diga saker
clear total_freq;
clear t;
clear x;
clear y;


fs = sampling_freq;
duration = 3;
%tiden b�rjar p� noll och slutar p� duration (hur l�ngt ljudet ska vara)
%med samplingsfekvensen fs.
t = [0 : 1/fs : duration];

%G�r en tom array d�r vi samlar alla ljud s� dem kan spelas efter varandra
yA = [];

%loopar igenom hela frekvenslistan
for i = 1:size(freq_list, 2)
    %sinusv�gorna med frekvensen tagna fr�n frekvenslistan
    yi = sin(2*pi*freq_list(i)*t);
    %stoppa in alla sinusv�gor i yA (v�r samlingslista)
    yA = cat(2, yA, yi);    
end

end