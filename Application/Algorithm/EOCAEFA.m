
function [BestSol,BestValues,MeanValues]=EOCAEFA(N,max_it,model)
%V:   Velocity.
%a:   Acceleration.
%Q:   Charge  
%D:   Dimension of the test function.
%N:   Number of charged particles.
%X:   Position of particles.
%R:   Distance between charged particle in search space.
%lb:  lower bound of the variables
%ub:  upper bound of the variables
%Rnorm: Euclidean Norm 

FCheck=1; Rpower=1;
tag=1; % 1: minimization, 0: maximization
Rnorm=2; 
% Dimension and lower and upper bounds of the variables
%------------------------------------------------------------------------------------

CostFunction=@(xhat) MyCost_EOCAEFA(xhat,model);    % Cost Function

VarSize=model.n-2;      % Decision Variables Matrix Size
D=VarSize;             % Number of Decision Variables

VarMin=1;          % Lower Bound of Decision Variables
VarMax=model.n;          % Upper Bound of Decision Variables

ub = VarMax;
lb = VarMin;
%random initialization of charge population.
X=rand(N,D).*(ub-lb)+lb;

Y = ones(2*N,D);

%create the best so far chart and average fitnesses chart.
BestValues=[];
MeanValues=[];

V=zeros(N,D);

for i=1:N 
    [X(i,:),fitness(i),Sol(i)]=CostFunction(X(i,:));
end


if tag==1
    [best, best_X]=min(fitness); %minimization.
    [worst, worst_X]=max(fitness); %minimization.
else
    [best, best_X]=max(fitness); %maximization.
    [worst, worst_X]=min(fitness); %minimization.
end


Fbest=best;
Lbest=X(best_X,:);

if tag==1
    if best<Fbest  %minimization.
        Fbest=best;Lbest=X(best_X,:);
        BestSol = Sol(best_X);
    end
else 
    if best>Fbest  %maximization
        Fbest=best;Lbest=X(best_X,:);
        BestSol = Sol(best_X);
    end
end

%-------------------------------------------------------------------------------------
for iteration=1:max_it
    
    attact;%洛伦兹力引发的螺旋偏转搜索策略起到开发作用，将进一步逼近最优解
    EOL;%精英反向学习策略起到变异搜索作用，防止进入局部最优

    Y=max(Y,lb);Y=min(Y,ub);   % Check the bounds of the variables
    
    for i=1:2*N
        [Y(i,:),Y_fitness(i),xSol(i)]=CostFunction(Y(i,:));
    end
    
    [fit_temp index]=sort(Y_fitness);
    for i = 1:N
        X(i,:) = Y(index(i),:);
        Sol(i) = xSol(index(i));
    end
    
    fitness(1:N) = fit_temp(1:N);

    for i=1:N
        [fitness(i),X(i,:),Sol(i)] = Mutate(fitness(i),X(i,:),model);
    end

    if tag==1
        [best, best_X]=min(fitness); %minimization.
        [worst, worst_X]=max(fitness); %minimization.
    else
        [best, best_X]=max(fitness); %maximization.
        [worst, worst_X]=min(fitness); %minimization.
    end

    if tag==1
      if best<Fbest  %minimization.
       Fbest=best;Lbest=X(best_X,:);
       BestSol = Sol(best_X);
      end
    else 
      if best>Fbest  %maximization
       Fbest=best;Lbest=X(best_X,:);
       BestSol = Sol(best_X);
      end
    end
    
%     figure(1);
%     PlotSolution(BestSol,model);
%     pause(0.01);
    
BestValues=[BestValues Fbest];
MeanValues=[MeanValues mean(fitness)];
% disp(['Iteration ' num2str(iteration) ': BestValues = ' num2str(BestValues(end)) ' : MeanValues = ' num2str(MeanValues(end))]);
end 

% figure(1);
% PlotSolution(BestSol,model);

% disp(['Iteration ' num2str(iteration) ': BestValues = ' num2str(BestValues(end)) ' : MeanValues = ' num2str(MeanValues(end))]);
end