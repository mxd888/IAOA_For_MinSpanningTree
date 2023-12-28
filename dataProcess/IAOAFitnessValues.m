
function IAOAFitnessValues(i,L,data)

    global Colors Symbols;
    
    figure;
    n=size(data(1).Sol(1).A,1);
    for j = 1 : numel(L)
        
        c = Colors(j);
        
        s = Symbols(j);
        
        if rem(j,2) == 0
            
            z = ['-.', c, s];
            
        else
            
            z = ['-', c, s];
            
        end
        
        if j == 1
            plot(data(j).Fitness(:,end),z,...
                'LineWidth',2,...
                'MarkerSize',10,...
                'MarkerEdgeColor',c);
        else
            plot(data(j).Fitness(:,end),z,...
                'LineWidth',1,...
                'MarkerSize',5,...
                'MarkerEdgeColor',c);
        end
        hold on;
        
    end
    
    axis tight;
    
    title(['\fontsize{12}\bf The Fitness values for 30 runs for ',num2str(n),' points']);
    
    legend(L);
    
    xlabel('\fontsize{12}\bf Runs');
    
    ylabel('\fontsize{12}\bf Fitness Value');
    
end