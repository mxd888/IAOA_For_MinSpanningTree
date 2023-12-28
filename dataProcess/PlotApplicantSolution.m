function PlotApplicantSolution(n, a, data)
figure;
load geoid60c.mat
ax=worldmap('World');
setm(ax,'Origin',[0 180 0])
% 某些视角下的地图坐标区,其他经线的纬度范围[-75 75],四条经线绘制完全
axesm('MapProjection','ortho','Frame','on',...
    'grid','on','Origin',[45,a,15],...
    'MLineLimit',[-75 75],...
    'MLineException',[-90,0,90,180])
title(['The best route around the globe for ' num2str(n) ' cities'])
% 设置颜色并插值细化
C=[222,238,209;126,190,174;144,213,220;
    33,118,155;30,69,128;20,49,127]./255;
C1(:,1)=interp1(0:5,C(:,1),0:.5:5,'linear')';
C1(:,2)=interp1(0:5,C(:,2),0:.5:5,'linear')';
C1(:,3)=interp1(0:5,C(:,3),0:.5:5,'linear')';
% 下面减了个100为了让最大值也小于0
geoshow(ax,geoid60c-100,geoid60cR,'DisplayType','surface')
colormap(C1) % 应用颜色
% 绘制陆地
land=shaperead('landareas.shp','UseGeoCoords',true);
geoshow(ax,land,'FaceColor',[0.5 0.7 0.5])
% 绘制湖泊
lakes=shaperead('worldlakes.shp','UseGeoCoords',true);
geoshow(lakes,'FaceColor','blue')
% 绘制河流
rivers=shaperead('worldrivers.shp','UseGeoCoords',true);
geoshow(rivers, 'Color', 'blue')
% 绘制城市
cities=shaperead('worldcities.shp','UseGeoCoords',true);
cities = cities(1:n);
geoshow(cities,'Marker','.','Color','red')
hold on;
Lon=[cities.Lon];
Lat=[cities.Lat];
A=data(1).Sol.A;
%连线
for i=1:n
    for j=i+1:n
        if A(i,j)~=0
            xx=linspace(Lat(i),Lat(j),50);
            d1 = 0;
            if Lon(i) > 0
                d1=180-Lon(i);
            else
                d1=Lon(i)+180;
            end
            d2 = 0;
            if Lon(j) >= 0
                d2=180-Lon(j);
            else
                d2=Lon(j)+180;
            end
            yy=[];
            if abs(Lon(i) - Lon(j)) > (d1 + d2)
                ii = [];
                jj = [];
                if Lon(i) > 0
                    ii=linspace(Lon(i),180,25);
                else
                    ii=linspace(Lon(i),-180,25);
                end
                if Lon(j) > 0
                    jj=linspace(Lon(j),180,25);
                else
                    jj=linspace(Lon(j),-180,25);
                end
                jj = sort(jj,'descend');
                yy=[ii jj];
            else
                yy=linspace(Lon(i),Lon(j),50);
            end
            
            linem(xx,yy,'r-');
            hold on;
        end
    end
end
hold off;
end