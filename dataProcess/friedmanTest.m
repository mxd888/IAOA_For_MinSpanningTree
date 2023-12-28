clear; close all; clc;

OriginModelNum = [25 50 100 200 300 400];
MinModelNum = [500 600 700 800 900 1000];
ModelNum = [24];%23
dataIter = 'data/4/';

% L1={'IAOA', 'AOA', 'IMA', 'IRAEFA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L1={'IAOA', 'AOA', 'IMA', 'IRAEFA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_1 = [1 2 3 4 5 7 8 10 11 13];
% L2={'IAOA', 'AOA', 'IMA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L2={'IAOA', 'AOA', 'IMA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_2 = [1 2 3 4 6 7 9 10 12];
% L3={'IAOA', 'AOA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L3={'IAOA', 'AOA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_3 = [1 2 3 5 6 8 9 11];
Table_Rank = cell(numel(OriginModelNum)+numel(ModelNum),numel(L1));
j=numel(OriginModelNum)+1;
k=1;
for i = OriginModelNum
    PATH = [dataIter 'table/Table_Model_' num2str(i)];
    load([PATH '.mat']);
    L0 = {'IAOA', 'ACO','DE','PSO','GA','GWO','SMA','IRAEFA','BBMA','AOA'};
    [p,table,stats]=friedman(data);
    rk=stats.meanranks;
    [r,index]=sort(rk);
    Table_Rank(k,1:numel(L0)) = L0(index);
    k=k+1;
end

for i = MinModelNum
    PATH = [dataIter 'table/Table_Model_' num2str(i)];
    load([PATH '.mat']);
    L0 = {'IAOA', 'ACO','DE','PSO','GA','GWO','SMA','BBMA','AOA'};
    [p,table,stats]=friedman(data);
    rk=stats.meanranks;
    [r,index]=sort(rk);
    Table_Rank(1,1:numel(L0)) = L0(index);
    j=j+1;
end

for i = ModelNum
    PATH = [dataIter 'table/Table_Model_' num2str(i)];
    load([PATH '.mat']);
    % Ñ¡Ôñ¹æÄ£
    if i < 13
        L0 = L1;
    elseif i >= 13 && i < 19
        L0 = L2;
    else
        L0 = L3;
    end
    
    [p,table,stats]=friedman(table2array(T)');
    rk=stats.meanranks;
    [r,index]=sort(rk);
    Table_Rank(1,1:numel(L0)) = L0(index);
    j=j+1;
end
% save the result
% PATH = [dataIter 'rank/Table_Rank'];
% save(PATH, 'Table_Rank');


