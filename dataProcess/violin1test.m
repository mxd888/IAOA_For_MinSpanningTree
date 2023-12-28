clear;clc;close all;
 
 
load carbig MPG Origin
Origin      = cellstr(Origin);
loc         = find(ismember(Origin,'England'));
Origin(loc) = [];
MPG(loc)    = [];
 
 
grouporder={'Sweden','USA','Japan','Italy','Germany','France'};  
fig = figure('Position',[495 186 894  700],...
             'Name','matlab科研绘图之小提琴图',...
             'NumberTitle','off',...
             'Color','w',...
             'Menubar','none');
         
vs2 = violinplot(MPG,Origin,'GroupOrder',grouporder,'Width',0.3);
xlim([0.5, 6.5]);
box on;
set(gca,'LineWidth',1.5,...
    'FontName','Times New Roman',...
    'FontWeight','bold',...
    'FontSize',18);