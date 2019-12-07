t = t/180*pi;
s1 = s1/180*pi;
s10 = s10/180*pi;
s11 = s11/180*pi;
s12 = s12/180*pi;
s13 = s13/180*pi;
s17 = s17/180*pi;
s2 = s2/180*pi;
s20 = s20/180*pi;
s23 = s23/180*pi;
s24 = s24/180*pi;
s28 = s28/180*pi;
s32 = s32/180*pi;
s4 = s4/180*pi;

s={s1 s10 s11 s12 s13 s17 s2 s20 s23 s24 s28 s32 s4}';

for i=1:13
polarplot(s{i}(:,2:3))
end

[ s1(:,2), s1(:,3) ] = hor2equ( s1(:,1), s1(:,2), s1(:,3) );
[ s10(:,2), s10(:,3) ] = hor2equ( s10(:,1), s10(:,2), s10(:,3) );
[ s11(:,2), s11(:,3) ] = hor2equ( s11(:,1), s11(:,2), s11(:,3) );
[ s12(:,2), s12(:,3) ] = hor2equ( s12(:,1), s12(:,2), s12(:,3) );
[ s13(:,2), s13(:,3) ] = hor2equ( s13(:,1), s13(:,2), s13(:,3) );
[ s17(:,2), s17(:,3) ] = hor2equ( s17(:,1), s17(:,2), s17(:,3) );
[ s2(:,2), s2(:,3) ] = hor2equ( s2(:,1), s2(:,2), s2(:,3) );
[ s20(:,2), s20(:,3) ] = hor2equ( s20(:,1), s20(:,2), s20(:,3) );
[ s23(:,2), s23(:,3) ] = hor2equ( s23(:,1), s23(:,2), s23(:,3) );
[ s24(:,2), s24(:,3) ] = hor2equ( s24(:,1), s24(:,2), s24(:,3) );
[ s28(:,2), s28(:,3) ] = hor2equ( s28(:,1), s28(:,2), s28(:,3) );
[ s32(:,2), s32(:,3) ] = hor2equ( s32(:,1), s32(:,2), s32(:,3) );
[ s4(:,2), s4(:,3) ] = hor2equ( s4(:,1), s4(:,2), s4(:,3) );

s={s1 s10 s11 s12 s13 s17 s2 s20 s23 s24 s28 s32 s4}';

r=(6.67384e-11*5.97219e+24*(23.9344699/2*60*60)^2/(4*pi*pi))^(1/3);
R=g2R(9.8048);
phi0 = 43.8253/180*pi;

o1=[R*cos(phi0)*cos(s1(:,1)) R*cos(phi0)*sin(s1(:,1)) R*sin(phi0)*ones(size(s1,1),1)];
o10=[R*cos(phi0)*cos(s10(:,1)) R*cos(phi0)*sin(s10(:,1)) R*sin(phi0)*ones(size(s10,1),1)];
o11=[R*cos(phi0)*cos(s11(:,1)) R*cos(phi0)*sin(s11(:,1)) R*sin(phi0)*ones(size(s11,1),1)];
o12=[R*cos(phi0)*cos(s12(:,1)) R*cos(phi0)*sin(s12(:,1)) R*sin(phi0)*ones(size(s12,1),1)];
o13=[R*cos(phi0)*cos(s13(:,1)) R*cos(phi0)*sin(s13(:,1)) R*sin(phi0)*ones(size(s13,1),1)];
o17=[R*cos(phi0)*cos(s17(:,1)) R*cos(phi0)*sin(s17(:,1)) R*sin(phi0)*ones(size(s17,1),1)];
o2=[R*cos(phi0)*cos(s2(:,1)) R*cos(phi0)*sin(s2(:,1)) R*sin(phi0)*ones(size(s2,1),1)];
o20=[R*cos(phi0)*cos(s20(:,1)) R*cos(phi0)*sin(s20(:,1)) R*sin(phi0)*ones(size(s20,1),1)];
o23=[R*cos(phi0)*cos(s23(:,1)) R*cos(phi0)*sin(s23(:,1)) R*sin(phi0)*ones(size(s23,1),1)];
o24=[R*cos(phi0)*cos(s24(:,1)) R*cos(phi0)*sin(s24(:,1)) R*sin(phi0)*ones(size(s24,1),1)];
o28=[R*cos(phi0)*cos(s28(:,1)) R*cos(phi0)*sin(s28(:,1)) R*sin(phi0)*ones(size(s28,1),1)];
o32=[R*cos(phi0)*cos(s32(:,1)) R*cos(phi0)*sin(s32(:,1)) R*sin(phi0)*ones(size(s32,1),1)];
o4=[R*cos(phi0)*cos(s4(:,1)) R*cos(phi0)*sin(s4(:,1)) R*sin(phi0)*ones(size(s4,1),1)];

o={o1 o10 o11 o12 o13 o17 o2 o20 o23 o24 o28 o32 o4}';

simple(solve('(x0+d*cos(delta)*cos(alpha))^2+(y0+d*cos(delta)*sin(alpha))^2+(z0+d*sin(delta))^2=r^2','d'));

[a0, d0]=solve('k1=-tan(delta0)/sin(alpha0)','k2=-cot(alpha0)','alpha0','delta0');

v1 = setcoo( o1, s1, r );
v10 = setcoo( o10, s10, r );
v11 = setcoo( o11, s11, r );
v12 = setcoo( o12, s12, r );
v13 = setcoo( o13, s13, r );
v17 = setcoo( o17, s17, r );
v2 = setcoo( o2, s2, r );
v20 = setcoo( o20, s20, r );
v23 = setcoo( o23, s23, r );
v24 = setcoo( o24, s24, r );
v28 = setcoo( o28, s28, r );
v32 = setcoo( o32, s32, r );
v4 = setcoo( o4, s4, r );

v={v1 v10 v11 v12 v13 v17 v2 v20 v23 v24 v28 v32 v4}';


S1 = setobit( v1);
S10 = setobit( v10 );
S11 = setobit( v11 );
S12 = setobit( v12 );
S13 = setobit( v13 );
S17 = setobit( v17 );
S2 = setobit( v2 );
S20 = setobit( v20 );
S23 = setobit( v23 );
S24 = setobit( v24 );
S28 = setobit( v28 );
S32 = setobit( v32 );
S4 = setobit( v4 );

for i = 1:13
[S(i,:),re(i,1),q(i,:)] = setobit([v{i}]);
end

Sdeg=S/pi*180;

set1=[s1(:,1) equ2set1(v1(:,1:2),S1(:,1:2))];
set10=[s10(:,1) equ2set1(v10(:,1:2),S10(:,1:2))];
set11=[s11(:,1) equ2set1(v11(:,1:2),S11(:,1:2))];
set12=[s12(:,1) equ2set1(v12(:,1:2),S12(:,1:2))];
set13=[s13(:,1) equ2set1(v13(:,1:2),S13(:,1:2))];
set17=[s17(:,1) equ2set1(v17(:,1:2),S17(:,1:2))];
set2=[s2(:,1) equ2set1(v2(:,1:2),S2(:,1:2))];
set20=[s20(:,1) equ2set1(v20(:,1:2),S20(:,1:2))];
set23=[s23(:,1) equ2set1(v23(:,1:2),S23(:,1:2))];
set24=[s24(:,1) equ2set1(v24(:,1:2),S24(:,1:2))];
set28=[s28(:,1) equ2set1(v28(:,1:2),S28(:,1:2))];
set32=[s32(:,1) equ2set1(v32(:,1:2),S32(:,1:2))];
set4=[s4(:,1) equ2set1(v4(:,1:2),S4(:,1:2))];

set={set1 set10 set11 set12 set13 set17 set2 set20 set23 set24 set28 set32 set4}';

qset=equ2set(q,S);

for i=1:13
figure;
stem(set{i}(:,2),set{i}(:,3));
hold on
alpha = linspace(0,2*pi)';
delta = atan(-(cos(qset(i,1)).*cos(alpha)+sin(qset(i,1)).*sin(alpha))./tan(qset(i,2)));
plot(alpha,delta);
end

for i=1:13
[mini(i,1) mini(i,2)]=min(abs(set{i}(:,3)));
end

for i=1:13
vinitial(i,:)=v{i}(mini(i,2),:);
end

setinitial=[equ2set(vinitial(:,1:2),S) vinitial(:,3)];
setinitial(:,2)=0;
vinitial(:,1:2)=set2equ(setinitial(:,1:2),S);

orbitnotset = buildorbitnot( setinitial );

for i=1:13
orbitnotequ{i,1}=[set2equ(orbitnotset{i}(:,1:2),S(i,:)) orbitnotset{i}(:,3)];
end

orbitnotearth = equ2earth( orbitnotequ );

for i=1:13
figure;
sphplot(orbitnotearth{i}(:,1:2),'-');
sphplot([125.27684 43.8253]/180*pi);
end

for i=1:13
lambda = mod(v{i}(:,1)-mod(v{i}(:,3)-125.27684/180*pi+2*pi,2*pi), 2*pi);
vearth{i}=[lambda v{i}(:,2) v{i}(:,3)];
for j=1:size(vearth{i},1)
    if vearth{i}(j,1)>pi
        vearth{i}(j,1) = vearth{i}(j,1)-2*pi;
    end
end
end

for i=1:13
figure;
earthplot(orbitnotearth{i}(:,1:2));
plot(vearth{i}(:,1)/pi*180,vearth{i}(:,2)/pi*180,'*')
end

Y=2014;
M=6;
D=6;
for i=1:13
 for h = 1:24
  for m = 1:60
   mrdhor{i,1}(60*(h-1)+m,:)=equ2hor( Y, M, D, h, m, setinitial(i,:), S(i,:) );
  end
 end
end

real20_20140606 = real20_20140606/180*pi;
real32_20140606 = real32_20140606/180*pi;
forcast20_20140606 = mrdhor{8,1}(:,1:2)/180*pi;
forcast32_20140606 = mrdhor{12,1}(:,1:2)/180*pi;
polarplot(forcast20_20140606,'-')
polarplot(forcast32_20140606,'-')
polarplot(real20_20140606)
polarplot(real32_20140606)