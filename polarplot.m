function [  ] = polarplot( v, str )
%UNTITLED6 Summary of this function goes here
% v - satellite coo [a A] (rad)
%   Detailed explanation goes here
if (nargin==1),
    str = '.';
end
for i=1:size(v,1)
    if v(i,2)>pi
        v(i,2) = v(i,2)-2*pi;
    end
end
a=amapproj([v(:,2) v(:,1)], 'r',[-pi pi 0 pi/2],str);
view(270,90);
text(pi/2+0.1,0,'N');
text(0,pi/2+0.15,'E');
text(-pi/2-0.1,0,'S');
text(0,-pi/2-0.1,'W');
end