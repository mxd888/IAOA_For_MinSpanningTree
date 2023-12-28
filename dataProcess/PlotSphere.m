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
% axis off;
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
 O = [0, 0, 0];
% 定义半径的大小
r = 1;
% 定义法向向量
n = [1, 1, 0];
%% 开始绘制3维圆圈
theta = linspace(0, 2*pi, 100);
x = O(1)+r*n(2)/sqrt(n(1)^2+n(2)^2).*cos(theta)+...
	n(1)*n(2)/(sqrt(n(1)^2+n(2)^2)*sqrt(n(1)^2+n(2)^2+n(3)^2)).*sin(theta);
y = O(2)-r*n(1)/sqrt(n(1)^2+n(2)^2).*cos(theta)+...
	n(2)*n(3)/(sqrt(n(1)^2+n(2)^2)*sqrt(n(1)^2+n(2)^2+n(3)^2)).*sin(theta);
z = O(3)-r*sqrt(n(1)^2+n(2)^2)/sqrt(n(1)^2+n(2)^2+n(3)^2).*sin(theta);
plot3(x,y,z,'k-', 'LineWidth', 1.3)
hold on

% 纬线
% h=1/3;
% r=sqrt(2)/3*2;
% pos=[0,0];
% t=0:0.0001:(2*pi);
% t=[t,0];
% plot3(pos(1)+r*sin(t),pos(2)+r*cos(t),h*ones(size(t)),'Linewidth',1.3)
% axis([0 100 0 100]);
% axis equal;
% set(gca,'XTick',0:10:100)
% set(gca,'YTick',0:10:100)
% hold on
% 

%% 画弧
%经线 
% R=1;r0=[0,0,0];p=[-0.01,-0.01,-1];q=[0.05,0.05,1];
% 
R=1;r0=[0,0,0];p=[-1,0,0];q=[0,-1,0];

%圆心O的坐标
x0=r0(1);y0=r0(2);z0=r0(3);
%定点P的坐标
xp=p(1);yp=p(2);zp=p(3);
%定点Q的坐标
xq=q(1);yq=q(2);zq=q(3);
%计算圆所在平面的法向量
a=(yp-y0)*(zq-z0)-(yq-y0)*(zp-z0);
b=(xq-x0)*(zp-z0)-(xp-x0)*(zq-z0);
c=(xp-x0)*(yq-y0)-(xq-x0)*(yp-y0);
%计算旋转角度
if c>=0
  A=asin(b/sqrt(a^2+b^2+c^2));
  B=-asin(a/sqrt(a^2+c^2+eps));
else
  A=-asin(b/sqrt(a^2+b^2+c^2));
  B=asin(a/sqrt(a^2+c^2+eps));
end
C=0;
%旋转矩阵
Ra=[1,0,0;0,cos(A),sin(A);0,-sin(A),cos(A)];
Rb=[cos(B),0,-sin(B);0,1,0;sin(B),0,cos(B)];
Rc=[cos(C),sin(C),0;-sin(C),cos(C),0;0,0,1];
%旋转逆矩阵
iRa=[1,0,0;0,cos(A),-sin(A);0,sin(A),cos(A)];
iRb=[cos(B),0,sin(B);0,1,0;-sin(B),0,cos(B)];
iRc=[cos(C),-sin(C),0;sin(C),cos(C),0;0,0,1];
%平移p点坐标
Rxp=xp-x0;
Ryp=yp-y0;
Rzp=zp-z0;
%平移q点坐标
Rxq=xq-x0;
Ryq=yq-y0;
Rzq=zq-z0;
%旋转p,q点坐标
Pxyz0=iRa*iRb*iRc*[Rxp;Ryp;Rzp];
Qxyz0=iRa*iRb*iRc*[Rxq;Ryq;Rzq];
%确定p,q点的参数坐标
if Pxyz0(1)>=0&Pxyz0(2)>=0
   tp=asin(Pxyz0(2)/R);
elseif Pxyz0(1)<0&Pxyz0(2)>=0
   tp=acos(Pxyz0(1)/R);
elseif Pxyz0(1)<0&Pxyz0(2)<0
   tp=pi-asin(Pxyz0(2)/R);
else
   tp=2*pi+asin(Pxyz0(2)/R);
end

if Qxyz0(1)>=0&Qxyz0(2)>=0
   tq=asin(Qxyz0(2)/R);
elseif Qxyz0(1)<0&Qxyz0(2)>=0
   tq=acos(Qxyz0(1)/R);
elseif Qxyz0(1)<0&Qxyz0(2)<0
   tq=pi-asin(Qxyz0(2)/R);
else
   tq=2*pi+asin(Qxyz0(2)/R);
end
%确定参数范围
if tp>=0&tp<=pi
  if tq-tp<=pi
    tmin=min(tp,tq);
    tmax=max(tp,tq);
    t=tmin:0.001:tmax;
  else
    t1=tq:0.001:2*pi;
    t2=0:0.001:tp;
    t=[t1,t2];
  end
else
  if tp-tq<=pi
    tmin=min(tp,tq);
    tmax=max(tp,tq);
    t=tmin:0.001:tmax;
  else
    t1=tp:0.001:2*pi;
    t2=0:0.001:tq;
    t=[t1,t2];
  end
end
%计算初始坐标
x=R*cos(t);
y=R*sin(t);
z=zeros(1,length(t));
%计算旋转后的坐标
Rxyz=Rc*Rb*Ra*[x;y;z];
%计算平移后的坐标
new(1,:)=Rxyz(1,:)+x0*ones(1,length(t));
new(2,:)=Rxyz(2,:)+y0*ones(1,length(t));
new(3,:)=Rxyz(3,:)+z0*ones(1,length(t));
%绘制图像
plot3(new(1,:),new(2,:),new(3,:),'k',...
x0,y0,z0,'ko',...
[xp,xq],[yp,yq],[zp,zq],'r.','MarkerSize',1,'MarkerFaceColor','r','Linewidth',2.3)
% plot3(new(1,:),new(2,:),new(3,:),'b',x0,y0,z0,'ko',[xp,xq],[yp,yq],[zp,zq],'b.','MarkerSize',2,'MarkerFaceColor','k')
grid on
axis equal
hold on


%% 画箭头
h1 = quiver3(0,0,0, 0,0,1.5);
set(h1,'maxheadsize',0.3,'Color','k');
h2 = quiver3(0,0,0, -1.9,0,0);
set(h2,'maxheadsize',0.3,'Color','k');
h3 = quiver3(0,0,0, 0,-1.9,0);
set(h3,'maxheadsize',0.3,'Color','k');

% h4 = quiver3(0,0,0, 0.12,-1.5,0.4);
% set(h4,'maxheadsize',0,'Color','k');
% h5 = quiver3(0,0,0, -0.8,-0.5,-0.1);
% set(h5,'maxheadsize',0,'Color','k');
hold on
 
%% 标注
 text(0.3,0.2,0,'Center','FontWeight','Bold','FontSize',11);
text(-0.4,0.3,0,'r','FontWeight','Bold','FontSize',11)
text(-2,0,0,'x','FontWeight','Bold','FontSize',11);
text(0,-1.8,0,'y','FontWeight','Bold','FontSize',11);
text(0.3,0.1,1.3,'z','FontWeight','Bold','FontSize',11)


% %经纬线
 text(-1.2,0.8,0.2,'Great Circle','FontWeight','Bold','FontSize',9);
% text(0,-1.8,0.5,'Latitudes','FontWeight','Bold','FontSize',11);
% text(-1.5,-1,-0.3,'Longitudes','FontWeight','Bold','FontSize',11)

% u v那三个点
text(-1.5,0,0.2,'u=0,v=0.5','FontWeight','Bold');
text(-1.3,-0.5,-0.05,'u=0,1,v=0.5','FontWeight','Bold');
text(-0.5,-0.9,0.2,'u=0.25,v=0.5','FontWeight','Bold')
hold on
% x=[-1 0 -1.01];
% y=[0 -1 -0.8];
% z=[0 0 0.05];
% plot3(x,y,z,'k.','MarkerSize',10) 
text(-1.3,0,0.15,'Pi','FontWeight','Bold','FontSize',11);
text(-0.2,-1.1,0.2,'Pj','FontWeight','Bold','FontSize',11);
text(-1,-0.5,-0.1,'d(Pi,Pj)','FontWeight','Bold','FontSize',11);

% x=[-1.01 0.4];
% y=[-0.8 -1];
x=[-1 0];
y=[0 -1];
z=[0 0];
plot3(x,y,z,'k.','MarkerSize',10) 
hold on

% set(gcf,'Position',[100 100 260 220]);
% set(gca,'Position',[.13 .17 .80 .74]);

% angle1=rand(1,2)*2*pi;
% 
% angle2=acos(rand(1,2)*2-1);
% 
% r=power(rand(1,2),1/3);
% 
% x=r.*cos(angle1).*sin(angle2);
% 
% y=r.*sin(angle1).*sin(angle2);
% 
% z=r.*cos(angle2);
% 
% %
% 
% plot3(x,y,z,'r.');