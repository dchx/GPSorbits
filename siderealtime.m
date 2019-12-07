function [ t ] = siderealtime( h, m )
%UNTITLED Summary of this function goes here
% Date: May 29 2014
% t: sidereal time (degree)
% h: hour (0~24)
% m: minute (0~60)
%   Detailed explanation goes here
Y = 2014; %YEAR
M = 5; %MONTH
D = 29; %DATE
h = h-8; %Greenwich hour
lamda0 = 125.2768107; %local longitude
TJD = floor(365.25*Y)+floor(Y/400)-floor(Y/100)+floor(30.59*(M-2))+D+1721088.5...
    +h/24+m/1440-2440000.5; %Truncated Julian Day
t = mod(360*(0.671262+1.0027379094*TJD)+lamda0,360);
end

