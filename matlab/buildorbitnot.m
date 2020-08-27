function [ orbitnotset ] = buildorbitnot( setinitial )
%UNTITLED9 Summary of this function goes here
% setinitial - initial satellite point under satellite coordinate [sRA0 sDec0 t0] (rad)
%       t0 - local sidereal time
% orbitnotset - 1440 satellite points in the orbit {[sRA sDec tG]} (rad)
%       tG - Greenwich sidereal time
%   Detailed explanation goes here
sRA0 = setinitial(:,1);
sDec0 = setinitial(:,2);
t0 = setinitial(:,3);
tG0 = mod(t0 - 125.27684/180*pi + 2*pi, 2*pi);
for i=1:13
    % calculate orbitnotset{i}
    sRA = mod(sRA0(i)+linspace(0,4*pi,1440)',2*pi);
    sDec = sDec0(i)+zeros(1440,1);
    tG = mod(tG0(i)+linspace(0,2*pi,1440)',2*pi);
    orbitnotset{i,1} = [sRA sDec tG];
end
end

