function [ earth ] = equ2earth1( equ, t )
%UNTITLED10 Summary of this function goes here
% equ - object equatorial coordinate [alpha delta] (rad)
% t - local sidereal time
% earth - coordinate of object's projection on the earth [lambda phi] (rad)
%   Detailed explanation goes here
tG = mod(t - 125.27684/180*pi + 2*pi, 2*pi);
lambda = mod(equ(:,1) - tG, 2*pi);
earth=[lambda equ(:,2)];
end

