clear; close all; clc;

load rank.mat

L1={'IAOA', 'AOAK', 'IMA', 'IRAEFA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};

H1={'f1','f2','f3'};

Num = 4;

ModelNum=numel(H1);

FNum=numel(L1);

Table_Rank = zeros(ModelNum,numel(L1));

for i = 1:ModelNum
    
    h=(i-1)*Num;
    
    idata = data(h+1:h+Num,:);
    
    [p,~,stats]=friedman(idata);
    
    rk=stats.meanranks;
    
    [r,index]=sort(rk);
    
    rank=zeros(1,FNum);
    
    for j=1:numel(index)
        
        rank(index(j))=j;
        
    end
    
    Table_Rank(i,:) = rank;
    
end

% clear table
T = table(Table_Rank(:,1),Table_Rank(:,2),Table_Rank(:,3),Table_Rank(:,4), ...
    Table_Rank(:,5),Table_Rank(:,6),Table_Rank(:,7),Table_Rank(:,8), ...
    Table_Rank(:,9),Table_Rank(:,10), ...
    'VariableNames', L1, ...
    'RowNames', H1);

% save the result

% save('rank/Table_Rank', 'Table_Rank');


