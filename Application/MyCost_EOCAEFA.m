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

function [xhat,z, sol]=MyCost_EOCAEFA(xhat,model)
    
    D.AV = [1:model.n];
    for kkk = 1:size(xhat,2)
        aa = find(D.AV >= xhat(1,kkk),1,'first');
        bb = find(D.AV <= xhat(1,kkk),1,'last');
        
        if abs(D.AV(aa)-xhat(1,kkk)) < abs(D.AV(bb)-xhat(1,kkk))
            xhat(1,kkk) = D.AV(aa);
        else
            xhat(1,kkk) = D.AV(bb);
        end
    end




    cost = prufer(xhat);
    A = zeros(model.n);
    for i = 1:model.n-1
            A(cost(i,1),cost(i,2)) = 1;
            A(cost(i,2),cost(i,1)) = 1;
    end
    
    d=model.d;

    AD=A.*d;
   
    SumAD=sum(AD(:))/2;
    
    z=SumAD;
    sol.A=A;
    sol.SumAD=SumAD;
    sol.z=z;
    sol.cost = cost;

end