x=1:1:7;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a=[205,110,256.250,244.885,280,214,324]; %a数据y值
b=[322,144,297,487,519,322,456]; %b数据y值
c=[140,55,76,55,155,45,400]; %c数据y值
plot(x,a,'-*r',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','r');
hold on;
plot(x,b,'-pb',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b')
hold on;
plot(x,c,'-og',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g')
axis([0,8,0,700])  %确定x轴与y轴框图大小
set(gca,'XTick',[0:1:8]) %x轴范围1-6，间隔1
set(gca,'YTick',[0:100:700]) %y轴范围0-700，间隔100
legend('算法1','算法2','算法3');   %右上角标注
xlabel('x')  %x轴坐标描述
ylabel('y') %y轴坐标描述

