
function IAOABoxplot(~,L,data)

    figure;
    n=size(data(1).Sol(1).A,1);
    x1=zeros(numel(L),30);
    % 给每个箱子设置不同的颜色
    mycolor = [237,110,61 % 优美
        0,0,0 % 娇媚
        220,91,111  % 微笑
        113,59,18 % 温顺
        247,200,207 % 雅致
        131,175,155
        123,104,238
        152,251,152
        211,160,221
        255,222,173]./255;
    for j = 1 : numel(L)
        
        x1(j,:) = data(j).Fitness(:,end)';
        
    end
    
%     'Color','k',...                                   %箱体边框及异常点颜色
    boxplot(x1',L,'Notch','on',...
        'OutlierSize',4)                              %是否是凹口的形式展现箱线图，默认非凹口);
%     h = findobj(gca,'Tag','Box');
%     for j = 1:length(h)
%         patch(get(h(j),'XData'),get(h(j),'YData'),mycolor(j,:),'FaceAlpha',.5);%赋颜色填充箱型图内部
%     end
    axis tight;
    
    set(gca,'xticklabelrotation',45);
    set(gca,'FontSize',10);
    title(['\fontsize{12}\bf The ANOVA test for ',num2str(n),' points']);
    
    xlabel('\fontsize{12}\bf Algorithms');
    
    ylabel('\fontsize{12}\bf Fitness Value');
    
end