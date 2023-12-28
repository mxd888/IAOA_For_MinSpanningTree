
function T = IAOADataAnalysis(L,data)

    x1=zeros(numel(L),30);
    
    for j = 1 : numel(L)
        
        x1(j,:) = data(j).Fitness(:,end)';
        
    end
    
    T = table(min(x1')', max(x1')', mean(x1')', std(x1')', ...
          'VariableNames',{'Best', 'Worst', 'Mean', 'Std'}, ...
          'RowNames',L) ;

end