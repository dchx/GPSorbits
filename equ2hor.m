function [ hor ] = equ2hor( Y, M, D, h, m, setinitial, S )
%UNTITLED Summary of this function goes here
% Y, M, D, h, m - year, month, date, hour, minute
% setinitial - initial satellite point under satellite coordinate [sRA0 sDec0 t0] (rad)
%       t0 - orbit initial sidereal time
% S - satellite orbit elements [RAAN Inclination] (rad)
% hor - object horizontal coordinate [a A h m] (degree degree h m) 
%      a - altitude (rad)
%      A - azimuth (rad)
%   Detailed explanation goes here
lamda0 = 125.2768107/180*pi;
phi0 = 43.82381717/180*pi;
R = g2R(9.8048);
r=(6.67384e-11*5.97219e+24*(23.9344699/2*60*60)^2/(4*pi*pi))^(1/3);
%-----calculate sidereal time t (rad)
h = h-8;
TJD = floor(365.25*Y)+floor(Y/400)-floor(Y/100)+floor(30.59*(M-2))+D+1721088.5...
    +h/24+m/1440-2440000.5;
t = mod(360*(0.671262+1.0027379094*TJD)+lamda0/pi*180,360)/180*pi; %local sidereal time
%-----calculate satellite position in satellite coordinate sett [sRA sDec] (rad)
sRA0 = setinitial(:,1);
sDec0 = setinitial(:,2);
t0 = setinitial(:,3);
dt = t - t0;
sRA = mod(sRA0+2.*dt, 2*pi);
sDec = sDec0;
sett = [sRA sDec];
%-----calculate satellite position in xyz coordinate 
%        equt [alpha delta r] (rad) - xyzt [x y z] (m)
equt = set2equ( sett, S );
alpha = equt(:,1);
delta = equt(:,2);
x = r.*cos(delta).*cos(alpha);
y = r.*cos(delta).*sin(alpha);
z = r.*sin(delta);
%-----calculate observer position in xyz coordinate
%        o [t phi0 R] (rad rad m) - o [x0 y0 z0] (m)
x0 = R*cos(phi0)*cos(t);
y0 = R*cos(phi0)*sin(t);
z0 = R*sin(phi0);
%-----calculate xyz difference
dx = x - x0;
dy = y - y0;
dz = z - z0;
d = sqrt(dx^2+dy^2+dz^2);
%-----calculate difference in equatorial coordinate
%       d [dalpha ddelta] (rad)
dalpha = atan(dy./dx);
for i = 1:size(dalpha)
    if dy(i)==0 && dx(i)<0
        dalpha(i) = pi;
    end
    if dy(i)<0
        dalpha(i) = dalpha(i) + pi;
    end
    if (dy(i)/dx(i))<0
        dalpha(i) = dalpha(i) + pi;
    end
end
ddelta = asin(dz./d);
%-----calculate difference in horizonal coordinate
%        hor  [a A h m] (degree degree h m)
ha = mod(t - dalpha,2*pi);
tanA = sin(ha)./(cos(ha)*sin(phi0)-tan(ddelta)*cos(phi0));
a = asin(sin(phi0)*sin(ddelta)+cos(phi0)*cos(ddelta).*cos(ha));
A = zeros(size(ha,1),1);
for i=1:size(ha)
    if  ha(i)<pi
        A(i,1) = atan(tanA(i));
    elseif ha(i)>=pi
        A(i,1) = atan(tanA(i))+pi;
    end
    if tanA(i)<0
        A(i,1) = A(i)+pi;
    end
end
A = mod(A-pi,2*pi)/pi*180;
a = a/pi*180;
hor = [a A];
hor(:,3) = h + 8;
hor(:,4) = m;
end

