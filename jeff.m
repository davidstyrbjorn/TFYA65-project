[image, map] = imread("triangle.png");
org_image = image;

for x = 1:size(image,2)
    image(:,x,1) = 100;
    image(:,x,2) = 0;
    image(:,x,3) = 0;
    
    line_images{x} = image;
    
    image = org_image;
end

soundsc(yA, fs);

for x = 1:size(image, 2)
    % Is there someway to make this faster?
    imshow(cell2mat(line_images(x)), 'InitialMagnification', 900);
    drawnow; % Force display to update imediatly
        
    pause(3);
end
  
clf;
close all;