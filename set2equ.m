function [ equ ] = set2equ( set, S )
%UNTITLED8 Summary of this function goes here
% equ - object equatorial coordinate [alpha delta] (rad)
% S - satellite orbit elements [RAAN Inclination] (rad)
% set - object satellite coordinate [sRA sDec] (rad)
%   Detailed explanation goes here
sRA = set(:,1);
sDec = set(:,2);
R = S(:,1);
I = S(:,2);
tanaR = (sin(sRA).*cos(I)-tan(sDec).*sin(I))./cos(sRA);
del = asin(sin(sDec).*cos(I)+cos(sDec).*sin(I).*sin(sRA));
for i=1:size(set,1)
    if sRA(i)>=pi/2 && sRA(i)<pi/2*3
        aR(i,1) = atan(tanaR(i))+pi;
    elseif tanaR(i)<0
        aR(i,1) = atan(tanaR(i))+2*pi;
    else
        aR(i,1) = atan(tanaR(i));
    end
end
alp = mod(aR + R, 2*pi);
equ = [alp del];
end

