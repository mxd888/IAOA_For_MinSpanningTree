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
text(-1.6,0.5,0.2,'Great Circle','FontWeight','Bold','FontSize',9);
text(0.8,-0.5,0.5,'Latitudes','FontWeight','Bold','FontSize',9);
text(0.8,-0.5,-0.5,'Latitudes','FontWeight','Bold','FontSize',9);
text(-0.8,-0.2,-1,'Longitudes','FontWeight','Bold','FontSize',9);
hold on

x=[-1 0 0];
y=[0 -1 0];
z=[0 0 1];
plot3(x,y,z,'k.','MarkerSize',10) 
hold on



%% 纬线
h=1/3;
r=sqrt(2)/3*2;
plot3(pos(1)+r*sin(t),pos(2)+r*cos(t),h*ones(size(t)),'Linewidth',1.3)
hold on

h=-1/3;
r=sqrt(2)/3*2;
plot3(pos(1)+r*sin(t),pos(2)+r*cos(t),h*ones(size(t)),'Linewidth',1.3)
hold on

%% 经线
h=0;
r=1;
plot3(h*ones(size(t)),pos(2)+r*cos(t),pos(1)+r*sin(t),'Linewidth',1.3)
hold on

plot3(pos(1)+r*sin(t),h*ones(size(t)),pos(2)+r*cos(t),'Linewidth',1.3)
hold on

O = [0 0 0];
% 定义法向向量
n = [3, -4, -0.1];
% 生成数据
phi = linspace(0,2*pi,1000); % 绘制完整圆一定是(0,2*pi)
theta = atan(-(n(1)*cos(phi)+n(2)*sin(phi))/n(3));
% 球坐标系(r,θ,φ)与直角坐标系(x,y,z)的转换关系表达式
x = O(1)+r*cos(theta).*cos(phi);
y = O(2)+r*cos(theta).*sin(phi);
z = O(3)+r*sin(theta);
plot3(x,y,z,'LineWidth', 1.3)
