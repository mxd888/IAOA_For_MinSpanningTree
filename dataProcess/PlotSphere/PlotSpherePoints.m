clc;
clear;
close all;
%% 画球面
[X0,Y0,Z0]=sphere(40);
surf(X0,Y0,Z0);
colormap(jet);
shading interp
alpha(0.5);
axis equal;
axis off;
set(gcf,'Color','w');%背景设置为白色
hold on;
%% 画圆
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

%% 画圆心
plot3(0,0,0,'k.','MarkerSize',20) 
%% 标注
text(0.3,0.2,0,'Center','FontWeight','Bold','FontSize',11);
text(-2,0,0,'x','FontWeight','Bold','FontSize',11);
text(0,-1.8,0,'y','FontWeight','Bold','FontSize',11);
text(0.3,0.1,1.3,'z','FontWeight','Bold','FontSize',11)
hold on

x=[-1 0 0];
y=[0 -1 0];
z=[0 0 1];
plot3(x,y,z,'k.','MarkerSize',10)


%% 画箭头
h1 = quiver3(0,0,0, 0,0,1.5);
set(h1,'maxheadsize',0.3,'Color','k');
h2 = quiver3(0,0,0, -1.9,0,0);
set(h2,'maxheadsize',0.3,'Color','k');
h3 = quiver3(0,0,0, 0,-1.9,0);
set(h3,'maxheadsize',0.3,'Color','k');
hold on
% u v那三个点
text(-1.5,0,0.3,'m=0,n=0.5','FontWeight','Bold');
text(-1.2,-0.2,0,'A','FontWeight','Bold');
text(-0.9,-0.5,1.5,'m=0,n=0','FontWeight','Bold');
text(-0.4,-0.5,1.5,'C','FontWeight','Bold');
text(-0.5,-0.9,0.3,'m=0.25,n=0.5','FontWeight','Bold')
text(0,-0.9,-0.2,'B','FontWeight','Bold')