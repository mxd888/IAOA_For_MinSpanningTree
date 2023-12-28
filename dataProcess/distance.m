
function D=distance(model)

    C=[model.X model.Y model.Z];
    
    for i=1:model.n
        for j=1:model.n
            if i == j
                D(i,j)=100;
            else
                D(i,j)=distance1(C(i,:),C(j,:));
            end
        end
    end
end

function re=distance1(C1,C2)
    
    x1=C1(1,1);
    y1=C1(1,2);
    z1=C1(1,3);
    x2=C2(1,1);
    y2=C2(1,2);
    z2=C2(1,3);
    re=acos((x1*x2+y1*y2+z1*z2)/(1^2));
end


