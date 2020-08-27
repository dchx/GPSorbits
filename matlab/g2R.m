function [ R ] = g2R( g )
%UNTITLED3 Summary of this function goes here
% g - measured gravity acceleration (m/s^2)
% R - distance between the earth center and the observer (m)
%   Detailed explanation goes here
R = sqrt(6.67384e-11*5.97219e+24/g);
end

