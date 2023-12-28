
function IAOAConvergenceCurves(i,L,data)

    global Colors Symbols x;
    
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
            plot(x,mean(data(j).Fitness(:,x)),z,...
                'LineWidth',2,...
                'MarkerSize',10,...
                'MarkerEdgeColor',c);
        else
            plot(x,mean(data(j).Fitness(:,x)),z,...
                'LineWidth',1,...
                'MarkerSize',5,...
                'MarkerEdgeColor',c);
        end

        
        hold on;
        
    end
    
    axis tight;
    
    title(['\fontsize{12}\bf The convergence curves of algorithms for ',num2str(n),' points']);
    
    legend(L);
    
    xlabel('\fontsize{12}\bf Iterations');
    
    ylabel('\fontsize{12}\bf Fitness Value');
    
end