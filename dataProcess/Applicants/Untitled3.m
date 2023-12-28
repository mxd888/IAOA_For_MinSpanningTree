clear;close all;clc;
ax=worldmap('World');
setm(ax,'Origin',[0 180 0])
load geoid60c.mat
load P3.mat
% ĳЩ�ӽ��µĵ�ͼ������,�������ߵ�γ�ȷ�Χ[-75 75],�������߻�����ȫ
axesm('MapProjection','ortho','Frame','on',...
    'grid','on','Origin',[45,0,15],...
    'MLineLimit',[-75 75],...
    'MLineException',[-90,0,90,180])
title('The best routes in 100 cities around the globe')
% ������ɫ����ֵϸ��
C=[222,238,209;126,190,174;144,213,220;
    33,118,155;30,69,128;20,49,127]./255;
C1(:,1)=interp1(0:5,C(:,1),0:.5:5,'linear')';
C1(:,2)=interp1(0:5,C(:,2),0:.5:5,'linear')';
C1(:,3)=interp1(0:5,C(:,3),0:.5:5,'linear')';

% ������˸�100Ϊ�������ֵҲС��0
geoshow(ax,geoid60c-100,geoid60cR,'DisplayType','surface')
colormap(C1) % Ӧ����ɫ


% ����½��
land=shaperead('landareas.shp','UseGeoCoords',true);
geoshow(ax,land,'FaceColor',[0.5 0.7 0.5])
% ���ƺ���
lakes=shaperead('worldlakes.shp','UseGeoCoords',true);
geoshow(lakes,'FaceColor','blue')
% ���ƺ���
rivers=shaperead('worldrivers.shp','UseGeoCoords',true);
geoshow(rivers, 'Color', 'blue')
% ���Ƴ���
cities=shaperead('worldcities.shp','UseGeoCoords',true);

cities = cities(1:100);

geoshow(cities,'Marker','.','Color','red')

hold on;
bei_lat=39.9292552640542;
bei_lon=116.393770223050;
cheng_lat=30.5783221817622;
cheng_lon =104.256670030632;

n=numel(cities);
Lon=[cities.Lon];
Lat=[cities.Lat];
A=data(1).Sol.A;
%����
for i=1:n
    for j=i+1:n
        if A(i,j)~=0
%             lh(1,[0 0 0],[X(i),Y(i),Z(i)],[X(j),Y(j),Z(j)]);
            xx=linspace(Lat(i),Lat(j),50);
            yy=linspace(Lon(i),Lon(j),50);
            linem(xx,yy,'r-');
            hold on;
        end
    end
end
hold off;

