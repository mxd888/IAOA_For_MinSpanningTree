%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPAP116
% Project Title: Minimum Spanning Tree using PSO, FA, ICA
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function PlotSolution(sol,model)

    X=model.X;
    Y=model.Y;
    Z=model.Z;
    n=model.n;
    z=[sol.SumAD];
    [~, index]=min(z);
    A=sol(index).A;
    %画球
    [X0,Y0,Z0]=sphere(40);
    surf(X0,Y0,Z0);
    colormap(winter);
    shading interp
    alpha(1); % 这里是透明度 0.5  1
    axis equal;
    axis off;
    set(gcf,'Color','w');
%     set(gcf,'Color','w', 'Position',[454   445   350   350]);
    %移除坐标轴边框
    set(gca,'Visible','off');
%     title(['\bf The Best Route For ' num2str(n) ' Cities']);
    %去除上右边框刻度
    box off  

    hold on;

    border = 0;
    %连线
    for i=1:n
        for j=i+1:n
            if A(i,j)~=0
                if A(i,j) == 1
                    lh(1,[0 0 0],[X(i),Y(i),Z(i)],[X(j),Y(j),Z(j)]);
                elseif A(i,j) == 2
                    lh1(1,[0 0 0],[X(i),Y(i),Z(i)],[X(j),Y(j),Z(j)]);
                elseif A(i,j) == 3
                    lh2(1,[0 0 0],[X(i),Y(i),Z(i)],[X(j),Y(j),Z(j)]);
                elseif A(i,j) == 4
                    lh3(1,[0 0 0],[X(i),Y(i),Z(i)],[X(j),Y(j),Z(j)]);
                end
                
                border = border + 1;
                hold on;
            end
        end
    end
    % 画出根节点
    plot3([-0.3012],[0.2064], [0.9310],'k.','MarkerSize',25,'MarkerFaceColor',[0 1 0]);
    hold off;
    disp(['边的条数 ' num2str(border)]);
    
end