% �������Բ��� 2019������ã���8�����ݲ��Ե�һ�������������ֲ���
for i = 1:N
    if rand()>0.5
        for j = 1:D
            Y(i+N,j) = (Y(i,j) + rand() * (X(best_X,j) - (Y(i,j)) ) + Y(i,j) - rand() * (X(worst_X,j) - (Y(i,j)) ))/2;
        end
    else
        for j = 1:D
            r= rand();
            if X(best_X,j)>X(i,j)
                Y(i+N,j) = X(best_X,j) + rand() * abs(X(i,j) - X(best_X,j));
            elseif X(best_X,j)<X(i,j)
               Y(i+N,j) = X(best_X,j) - rand() * abs(X(i,j) - X(best_X,j));
            else
                Y(i+N,j) = r * X(best_X,j) + (1-r)*X(i,j);
            end
        end
    end
end

