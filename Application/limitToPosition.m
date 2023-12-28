%=============================
%限制变量变化范围在定义域内
%=============================
function Position = limitToPosition(Position,VarMin,VarMax)

if size(Position,1) >1
    % 传入种群
    for i=1:size(Position,1)
         for j =1:size(Position,2)
            if Position(i,j)<VarMin
                Position(i,j) = VarMin;
            elseif Position(i,j) > VarMax
                Position(i,j) = VarMax;
            end
        end
    end
else
    for i =1:size(Position,2)
        if Position(i)<VarMin
            Position(i) = VarMin;
        elseif Position(i) > VarMax
            Position(i) = VarMax;
        end
    end
end

end