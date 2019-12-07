function [ v ] = setcoo( o, s, r )
%UNTITLED4 Summary of this function goes here
% v - satellite coo [ALPHA DELTA t] (rad)
% o - N*3 observer data [x0 y0 z0] (m)
% s - N*3 satellite data [t, alpha, delta] (rad)
% r - satellite orbit radius (m)
%   Detailed explanation goes here
x0 = o(:,1);
y0 = o(:,2);
z0 = o(:,3);
alpha = s(:,2);
delta = s(:,3);
d = (y0.^2.*cos(delta).^2 - z0.^2.*cos(delta).^2 + r.^2 - x0.^2 - y0.^2 ...
    + x0.^2.*cos(alpha).^2.*cos(delta).^2 - y0.^2.*cos(alpha).^2.*cos(delta).^2 ...
    + 2.*x0.*y0.*cos(alpha).*cos(delta).^2.*sin(alpha) ...
    + 2.*x0.*z0.*cos(alpha).*cos(delta).*sin(delta) ...
    + 2.*y0.*z0.*cos(delta).*sin(alpha).*sin(delta)).^(1/2) ...
    - z0.*sin(delta) - x0.*cos(alpha).*cos(delta) - y0.*cos(delta).*sin(alpha);
x = x0+d.*cos(delta).*cos(alpha);
y = y0+d.*cos(delta).*sin(alpha);
z = z0+d.*sin(delta);
ALPHA = atan(y./x);
for i = 1:size(ALPHA)
    if y(i)==0 && x(i)<0
        ALPHA(i) = pi;
    end
    if y(i)<0
        ALPHA(i) = ALPHA(i) + pi;
    end
    if (y(i)/x(i))<0
        ALPHA(i) = ALPHA(i) + pi;
    end
end
DELTA = asin(z./r);
t = s(:,1);
v = [ALPHA DELTA t];
sphplot([v(:,1) v(:,2)]);
end

