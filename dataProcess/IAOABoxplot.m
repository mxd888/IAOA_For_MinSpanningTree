
function IAOABoxplot(~,L,data)

    figure;
    n=size(data(1).Sol(1).A,1);
    x1=zeros(numel(L),30);
    % ��ÿ���������ò�ͬ����ɫ
    mycolor = [237,110,61 % ����
        0,0,0 % ����
        220,91,111  % ΢Ц
        113,59,18 % ��˳
        247,200,207 % ����
        131,175,155
        123,104,238
        152,251,152
        211,160,221
        255,222,173]./255;
    for j = 1 : numel(L)
        
        x1(j,:) = data(j).Fitness(:,end)';
        
    end
    
%     'Color','k',...                                   %����߿��쳣����ɫ
    boxplot(x1',L,'Notch','on',...
        'OutlierSize',4)                              %�Ƿ��ǰ��ڵ���ʽչ������ͼ��Ĭ�Ϸǰ���);
%     h = findobj(gca,'Tag','Box');
%     for j = 1:length(h)
%         patch(get(h(j),'XData'),get(h(j),'YData'),mycolor(j,:),'FaceAlpha',.5);%����ɫ�������ͼ�ڲ�
%     end
    axis tight;
    
    set(gca,'xticklabelrotation',45);
    set(gca,'FontSize',10);
    title(['\fontsize{12}\bf The ANOVA test for ',num2str(n),' points']);
    
    xlabel('\fontsize{12}\bf Algorithms');
    
    ylabel('\fontsize{12}\bf Fitness Value');
    
end