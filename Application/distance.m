
function D=distance(model)

    C=[model.X 
        model.Y];
    C = C';
    D = zeros(model.n,model.n);
    for i=1:model.n
        for j=1:model.n
            if i == j
                D(i,j)=100000;
            else
                [arclen, ~] = calc_distance(C(i,2), C(i,1), C(j,2), C(j,1));
                D(i,j) = arclen;
            end
        end
    end
end
