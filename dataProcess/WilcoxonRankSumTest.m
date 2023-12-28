
function R = WilcoxonRankSumTest(L,data)

MAOA=data(1).Fitness(:,end);
R = zeros(2,numel(L)-1);
for j = 2 : numel(L)
    [p,h]= signrank(MAOA,data(j).Fitness(:,end));
    R(1,j-1) = p;
    R(2,j-1) = h;
end

end

