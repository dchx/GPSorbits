function [ earth ] = equ2earth( equ )
%UNTITLED10 Summary of this function goes here
% equ - object equatorial coordinate {[alpha delta tG]} (rad)
%       tG - Greenwich sidereal time
% earth - coordinate of object's projection on the earth {[lambda phi tG]} (rad)
%   Detailed explanation goes here
for i=1:13
    lambda = mod(equ{i}(:,1)-equ{i}(:,3), 2*pi);
    earth{i,1}=[lambda equ{i}(:,2) equ{i}(:,3)];
end
end

