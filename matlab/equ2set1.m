function [ set ] = equ2set1( equ, S)
%UNTITLED7 Summary of this function goes here
% equ - object equatorial coordinate [alpha delta] (rad)
% S - satellite orbit elements [RAAN Inclination] (rad)
% set - object satellite coordinate [sRA sDec] (rad)
%   Detailed explanation goes here
alp = equ(:,1);
del = equ(:,2);
R = S(:,1);
I = S(:,2);
tansRA = (sin(alp-R).*cos(I)+tan(del).*sin(I))./cos(alp-R);
sDec = asin(sin(del).*cos(I)-cos(del).*sin(I).*sin(alp-R));
for i=1:size(equ,1)
    if  mod(alp(i)-R+2*pi,2*pi)>=pi/2 && mod(alp(i)-R+2*pi,2*pi)<pi/2*3
        sRA(i,1) = atan(tansRA(i))+pi;
    elseif tansRA(i)<0
        sRA(i,1) = atan(tansRA(i))+2*pi;
    else
        sRA(i,1) = atan(tansRA(i));
    end
end
set = [sRA sDec];
end

