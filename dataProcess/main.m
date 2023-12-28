
% �Ķ����ݣ�����ͼ
clear;close all;clc;
global Colors Symbols x;

starModelNum = 1;
endModelNum = 1;
dataIter = 'data/4/';
x = 1:15:300;
x = [x 300];
Colors  = ['r', 'g', 'b', 'c', 'm', 'y', 'k', 'r', 'g', 'b', 'c', 'm', 'y', 'k'];
Symbols = ['+', '+', 'o', 'x', '.', 'd', '>', 'p', 'h', 'v', 's', '<', '^', '+', '*', 'o', 'x'];

% L1={'IAOA', 'AOA', 'IMA', 'IRAEFA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L1={'MAOA', 'AOA', 'IMA', 'IRAEFA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_1 = [1 2 3 4 5 7 8 10 11 13];
% L2={'IAOA', 'AOA', 'IMA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L2={'MAOA', 'AOA', 'IMA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_2 = [1 2 3 4 6 7 9 10 12];
% L3={'IAOA', 'AOA', 'PSO', 'ICA', 'GA', 'GWO', 'SOA', 'SMA', 'DE', 'AMO', 'ACO', 'AO'};
L3={'MAOA', 'AOA', 'PSO', 'GA', 'GWO', 'SMA', 'DE', 'ACO'};
L1_3 = [1 2 3 5 6 8 9 11];

for i = starModelNum : endModelNum
    
    PATH = [dataIter 'data/P' num2str(i)];
    load(PATH);
    
    % ѡ���ģ
    if i < 13
        L0 = L1;
        data = data(L1_1);
    elseif i >= 13 && i < 19
        L0 = L2;
        data = data(L1_2);
    elseif i == 24
        L0 = L3;
    else
        L0 = L3;
        data = data(L1_3);
    end


    % ��Ӧ������
    IAOAConvergenceCurves(i,L0,data)

    % ��Сֵ
    IAOAFitnessValues(i,L0,data);
    
    % ����ͼ
    IAOABoxplot(i,L0,data);
    
    % �Ⱥͼ���
%     WilcoxonRankSumValues(i).R = WilcoxonRankSumTest(L0,data);
    
    % ���
%     T=IAOADataAnalysis(L0,data);
%     PATH = [dataIter 'table/Table_Model_' num2str(i)];
%     save(PATH, 'T');

end