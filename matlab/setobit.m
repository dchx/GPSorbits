function [ S, r, q ] = setobit( v )
%UNTITLED5 Summary of this function goes here
% v - satellite coo [ALPHA DELTA t] (rad)
% q - satellite orbit vector [alpha0 delta0] (rad)
% S - satellite orbit vector [RAAN Inclination] (rad)
% r - correlation coefficient
%   Detailed explanation goes here
ALPHA = v(:,1);
DELTA = v(:,2);
yfit = tan(ALPHA);
xfit = tan(DELTA)./cos(ALPHA);
[k] = polyfit(xfit, yfit, 1);
r1 = corrcoef(xfit,yfit);
r = r1(2,1);
%-------------------
alpha0 = atan(-1/k(2));
delta0 = atan(k(1)/(k(2)*((k(2)^2 + 1)/k(2)^2)^(1/2)));
if delta0>0 && k(1)>0
    alpha0 = alpha0+pi;
end
if delta0<0 && k(1)<0
    alpha0 = alpha0+pi;
end
if k(2)>0
    alpha0 = alpha0+pi;
end
%-------------------
if delta0>=0
    RAAN = mod(alpha0+pi/2,2*pi);
    Inclination = pi/2-delta0;
end
if delta0<0
    RAAN = mod(alpha0+3*pi/2,2*pi);
    Inclination = delta0+pi/2;
end
%------------------
q = [alpha0 delta0];
alpha = linspace(-pi,pi)';
delta = atan(-(cos(alpha0).*cos(alpha)+sin(alpha0).*sin(alpha))./tan(delta0));
%[mini, n]=min(abs(v(:,2)-delta));
%t_initial = v(n,3);
%alpha_initial = v(n,1);
%delta_initial = delta(n);
S = [RAAN Inclination];
%--------------------------------
figure;
%-------------sphplot-------------
%amapproj([alpha delta],'h','a','-');
%sphplot([v(:,1) v(:,2)]);
%-------------linarplot-------------
plot(xfit,yfit,'*k',xfit,polyval(k,xfit),'k'); 
title(['r=',num2str(r)]);
xlabel('tan \delta / cos \alpha');
ylabel('tan \alpha');
%--------------------------------
end

