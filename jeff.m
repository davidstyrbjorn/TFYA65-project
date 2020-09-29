[image, map] = imread("triangle.png");
org_image = image;

fig = figure;

soundsc(yA, fs);

for x = 1:size(image, 2)
    
    % We need to fix this either by pre processing all the images with the
    % lines (dumb solution probably)
    image(:,x,1) = 100;
    image(:,x,2) = 0;
    image(:,x,3) = 0;
    
    % Is there someway to make this faster?
    imshow(image, 'InitialMagnification', 900);
    
    image = org_image;
    
    pause(3);
      
  end