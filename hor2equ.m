function [ alpha, delta ] = hor2equ( t, a, A )
%UNTITLED2 Summary of this function goes here
% A - azimuth (rad)
% a - altitude (rad)
% t - local sidereal time (rad)
% delta - declination (rad)
% h - hour angle (rad)
%   Detailed explanation goes here
phi0 = 43.82381717/180*pi; % local latitude
th = sin(A)./(cos(A)*sin(phi0)-tan(a)*cos(phi0));
h = zeros(size(A),1);
for i=1:size(A)
    if  A(i)<pi && A(i)>0
        h(i,1) = atan(th(i))+pi;
    elseif A(i)>=pi || A(i)==0
        h(i,1) = atan(th(i));
    end
    if th(i)<0
        h(i,1) = h(i)+pi;
    end
end
delta = asin(sin(phi0)*sin(a)+cos(phi0)*cos(a).*cos(A));
alpha = t - h;
for i=1:size(alpha)
    if alpha(i)<0
        alpha(i) = alpha(i)+2*pi;
    end
end
end

