% X=randi([2,8],[4,7])+rand([4,7]);
% RC=radarChart(X);
% RC=RC.draw(); 
% 
% X=randi([2,8],[4,7])+rand([4,7]);
% RC=radarChart(X,'Type','Patch');
% RC=RC.draw(); 


X=randi([2,8],[4,7])+rand([4,7]);


RC=radarChart(X);
% RC.PropName={'25 cities','50 cities','100 cities','200 cities','300 cities','400 cities'};
% RC.ClassName={'ACO','DE','PSO','GA','GWO','SMA','IRAEFA','BBMA','AOA','MAOA'};

RC.PropName={'500 cities','600 cities','700 cities','800 cities','900 cities','1000 cities'};
RC.ClassName={'ACO','DE','PSO','GA','GWO','SMA','BBMA','AOA','MAOA'};

RC=RC.draw();
RC.legend();




% X=rand([1,6]);
% RC=radarChart(X,'Type','Patch');
% RC.PropName={'25 cities','50 cities','100 cities','200 cities','300 cities','400 cities'};
% RC.ClassName={'Õ¨√≈A'};
% RC=RC.draw();
% RC.legend();
% 
% colorList=[78 101 155;
%           138 140 191;
%           184 168 207;
%           231 188 198;
%           253 207 158;
%           239 164 132;
%           182 118 108]./255;
% for n=1:RC.ClassNum
%     RC.setPatchN(n,'FaceColor',colorList(n,:),'EdgeColor',colorList(n,:))
% end
