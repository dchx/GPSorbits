function [  ] = sphplot( v, str )
%UNTITLED6 Summary of this function goes here
% v - satellite coo [ALPHA DELTA] (rad)
%   Detailed explanation goes here
if (nargin==1),
    str = '.';
end
for i=1:size(v,1)
    if v(i,1)>pi
        v(i,1) = v(i,1)-2*pi;
    end
end
amapproj(v, 'h','a',str);
end

