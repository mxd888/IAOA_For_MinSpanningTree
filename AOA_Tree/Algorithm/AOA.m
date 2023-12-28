
% [Best_FF,Best_P,Conv_curve]=AOA(N,M_Iter,LB,UB,Dim,F_obj)
% [AOAsol,AOAbest,AOAmeanbest]=AOA(N,max_it,model);
function [AOAsol,AOAbest,AOAmeanbest]=AOA(N,M_Iter,model)
%Two variables to keep the positions and the fitness value of the best-obtained solution
F_obj=@(xhat) MyCost_EOCAEFA(xhat,model);
Dim=model.n-2;
LB=1;
UB=model.n;
AOAmeanbest = zeros(1,M_Iter);
VarSize=[1 Dim];
Best_P=zeros(1,Dim);
Best_FF=inf;
AOAbest=zeros(M_Iter,1);

%Initialize the positions of solution
empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Sol=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
empty_particle.Best.Sol=[];

particle=repmat(empty_particle,N,1);

MOP_Max=0.9;
MOP_Min=0.2;
C_Iter=1;
Alpha=5;
Mu=0.499;


for i=1:N
    % Initialize Position
    particle(i).Position=unifrnd(LB,UB,VarSize);
    % Evaluation
    [~,particle(i).Cost, particle(i).Sol]=F_obj(particle(i).Position);  %Calculate the fitness values of solutions
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    particle(i).Best.Sol=particle(i).Sol;
    
    if particle(i).Best.Cost<Best_FF
        Best_FF=particle(i).Best.Cost;
        Best_P=particle(i).Best.Position;
        AOAsol = particle(i).Best.Sol;
    end
end
Xnew=particle;
Y = repmat(particle,3,1);

while C_Iter<M_Iter+1  %Main loop
    MOP=1-((C_Iter)^(1/Alpha)/(M_Iter)^(1/Alpha));   % Probability Ratio 
    MOA=MOP_Min+C_Iter*((MOP_Max-MOP_Min)/M_Iter); %Accelerated function
   
    %Update the Position of solutions
    for i=1:N   % if each of the UB and LB has a just value 
        for j=1:Dim
           r1=rand();
            if (size(LB,2)==1)
                if r1>MOA
                    r2=rand();
                    if r2>0.5
                        Xnew(i).Position(j)=Best_P(1,j)/(MOP+eps)*((UB-LB)*Mu+LB);
                    else
                        Xnew(i).Position(j)=Best_P(1,j)*MOP*((UB-LB)*Mu+LB);
                    end
                else
                    r3=rand();
                    if r3>0.5
                        Xnew(i).Position(j)=Best_P(1,j)-MOP*((UB-LB)*Mu+LB);
                    else
                        Xnew(i).Position(j)=Best_P(1,j)+MOP*((UB-LB)*Mu+LB);
                    end
                end               
            end
            
            
            if (size(LB,2)~=1)   % if each of the UB and LB has more than one value 
                r1=rand();
                if r1>MOA
                    r2=rand();
                    if r2>0.5
                        if rand()>0.5
                            Xnew(i).Position(j)=Best_P(1,j)/(MOP+eps)*((UB(j)-LB(j))*Mu+LB(j));
                        else
                            Xnew(i).Position(j)=particle(i).Position(j)/(MOP+eps)*((UB(j)-LB(j))*Mu+LB(j));
                        end
                    else
                        if rand()>0.5
                            Xnew(i).Position(j)=Best_P(1,j)*MOP*((UB(j)-LB(j))*Mu+LB(j));
                        else
                            Xnew(i).Position(j)=particle(i).Position(j)*MOP*((UB(j)-LB(j))*Mu+LB(j));
                        end
                    end
                else
                    r3=rand();
                    if r3>0.5
                        if rand()>0.5
                            Xnew(i).Position(j)=Best_P(1,j)-MOP*((UB(j)-LB(j))*Mu+LB(j));
                        else
                            Xnew(i).Position(j)=particle(i).Position(j)-MOP*((UB(j)-LB(j))*Mu+LB(j));
                        end
                    else
                        if rand()>0.5
                            Xnew(i).Position(j)=Best_P(1,j)+MOP*((UB(j)-LB(j))*Mu+LB(j));
                        else
                            Xnew(i).Position(j)=particle(i).Position(j)+MOP*((UB(j)-LB(j))*Mu+LB(j));
                        end
                    end
                end               
            end
            
        end
        
        % оч╫Г
        Xnew(i).Position = limitToPosition(Xnew(i).Position,LB,UB);     
 
        [Xnew(i).Position,Xnew(i).Cost, Xnew(i).Sol]=F_obj(Xnew(i).Position);  % calculate Fitness function 


        if Xnew(i).Cost<particle(i).Cost
            particle(i).Position=Xnew(i).Position;
            particle(i).Cost=Xnew(i).Cost;
            particle(i).Sol=Xnew(i).Sol;
        end

        if particle(i).Cost<Best_FF
            Best_FF=particle(i).Cost;
            Best_P=particle(i).Position;
            AOAsol = particle(i).Sol;
        end
        
    end
    
    

    %Update the convergence curve
    AOAbest(C_Iter)=Best_FF;
    AOAmeanbest(C_Iter) = mean([particle(:).Cost]);
    C_Iter=C_Iter+1;  % incremental iteration
   
end
end



