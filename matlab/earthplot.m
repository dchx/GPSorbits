function [ ] = earthplot( earth )
%UNTITLED11 Summary of this function goes here
% earth - coordinate of object's projection on the earth [lambda phi] (rad)
%   Detailed explanation goes here
geoshow('landareas.shp', 'FaceColor', [0.5 1.0 0.5]);
hold on;
for i=1:(size(earth,1)-1)
    if earth(i+1,1)<1 && earth(i,1)>6
        c = earth(1:i,:);
        earth(1:i,:)=[];
        earth = [earth;c];
    end
end
for i=1:size(earth,1)
    if earth(i,1)>pi
        earth(i,1) = earth(i,1)-2*pi;
    end
end
for i=1:(size(earth,1)-1)
    if earth(i+1,1)<0 && earth(i,1)>0
        c = earth(1:i,:);
        earth(1:i,:)=[];
        earth = [earth;c];
    end
end
earth = earth/pi*180;
plot(earth(:,1),earth(:,2));
plot(125.27684,43.8253,'*');
text(115.27684,46.2253,'Changchun');
axis([-180 180 -90 90]);
axis off;
end

