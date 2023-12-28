clc;
clear;
close all;
%% »­ÇòÃæ
[X0,Y0,Z0]=sphere(40);
surf(X0,Y0,Z0);
colormap(jet);
shading interp
alpha(0.5);
axis equal;
axis off;
set(gcf,'Color','w');%±³¾°ÉèÖÃÎª°×É«
hold on;
%% »­Ô²
h=0;
r=1;
pos=[0,0];
t=0:0.0001:(2*pi);
t=[t,0];
plot3(pos(1)+r*sin(t),pos(2)+r*cos(t),h*ones(size(t)),'Linewidth',1.3)
axis([0 100 0 100]);
axis equal;
set(gca,'XTick',0:10:100)
set(gca,'YTick',0:10:100)
hold on

%% »­Ô²ÐÄ
plot3(0,0,0,'k.','MarkerSize',20) 
%% ±ê×¢
text(0.3,0.2,0,'Center','FontWeight','Bold','FontSize',11);
text(-0.5,0.3,0,'r','FontWeight','Bold','FontSize',11);
text(0.3,-0.5,0,'r','FontWeight','Bold','FontSize',11);
text(-0.2,0,0.5,'r','FontWeight','Bold','FontSize',11);
hold on

x=[-1 0 0];
y=[0 -1 0];
z=[0 0 1];
plot3(x,y,z,'k.','MarkerSize',10) 
hold on
