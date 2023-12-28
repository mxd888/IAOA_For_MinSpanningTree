
% cost = prufer1([1 3 3 3 4]);

function cost = prufer(P)
    
    n = size(P,2)+2;
    Q = [];
    for i = 1:n
        if find(P==i)
            
        else
            Q = [Q i];
        end
    end
    
    i = 1;
    while ~isempty(P)
       
        cost(i,1) = P(1);
        cost(i,2) = Q(1);
        
        Q = Q(2:end);
        ptemp = P(1);
        P = P(2:end);
        if find(P==ptemp)
            
        else
            Q = [ptemp Q];
%             Q = sort(Q);
        end
        
        i = i+1;
    end
    cost(i,1) = Q(1);
    cost(i,2) = Q(2);
    
end