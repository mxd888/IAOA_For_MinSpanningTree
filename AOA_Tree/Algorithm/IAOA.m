
% 改进版算术优化算法用于解决球面最小生成树问题
% 
% 1、将数学集合用于算术优化算法
% 2、将数学中位数概念用于算术优化算法
% 3、将数学对称概念用于算术优化算法
%       ：http://dictall.com/indu/402/4017167DCF0.htm
%       ：https://baike.baidu.com/item/%E5%AF%B9%E7%A7%B0%E7%AE%97%E5%AD%90/18898048?fr=aladdin
% -----------------------------参数--------------------------------------
% N：种群大小
% M_Iter：迭代次数
% model：最小生成树模型及数据
% -----------------------------返回--------------------------------------
% AOAsol：最优解决方案
% AOAbest：适应度值序列
% AOAmeanbest：平均适应度值序列
function [AOAsol,AOAbest,AOAmeanbest]=IAOA(N,M_Iter,model)

zero=0;

two = 2;

maxx=inf;

MathematicalOperators = ['+', '-', '×', '÷'];

len = size(MathematicalOperators,2);

F_obj=@(xhat) MyCost_EOCAEFA(xhat,model);

Dim=model.n-2;

LB=1;

UB=model.n;

AOAmeanbest = zeros(1,M_Iter);

Best_P=zeros(1,Dim);

Best_FF=maxx;

AOAbest=zeros(M_Iter,1);

vmax=two;

vmin=-vmax;

wmax = 50.0;

wmin = zero;

empty_particle.Position=[];

empty_particle.Cost=[];

empty_particle.Sol=[];

empty_particle.Best.Position=[];

empty_particle.Best.Cost=[];

empty_particle.Best.Sol=[];

particle=repmat(empty_particle,N,1);

MOP_Max=0.9;

MOP_Min=0.2;

Alpha=5;

Mu=0.499;

alfa = ((UB-LB)/2-(UB-LB)*Mu);

if Dim<1000
    
    p = sobolset(Dim);
    
    X = net(p,N)*(UB-LB) + LB;
    
else
    
    X = unifrnd(LB, UB, [N Dim]);
    
end

for i=1:N
    
    particle(i).Position=X(i,:);
    
    [particle(i).Position,particle(i).Cost, particle(i).Sol]=F_obj(particle(i).Position);
    
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

Y = repmat(particle, len,1);

AOAV=rand(N,Dim).*(vmax-vmin)+vmin;

for C_Iter=1:M_Iter
    
    MOP=1-((C_Iter)^(1/Alpha)/(M_Iter)^(1/Alpha));
    
    MOA=MOP_Min+C_Iter*((MOP_Max-MOP_Min)/M_Iter);
    
    Q = floor(LB + (UB/2 - LB)*C_Iter/M_Iter);
    
    w =MOP^Q * (wmax-MOA*(wmax-wmin)*C_Iter/M_Iter);
    
    for i=1:N
        
        for j=1:Dim
            
            r1=rand();
            
            if (size(LB,2)==1)
                
                if r1>MOA
                    
                    r2=rand();
                    
                    if r2>0.5
                        
                        Xnew(i).Position(j)=Best_P(1,j)/(MOP+eps)*alfa;
                        
                    else
                        
                        Xnew(i).Position(j)=Best_P(1,j)*MOP*alfa;
                        
                    end
                    
                else
                    
                    r3=rand();
                    
                    if r3>0.5
                        
                        Xnew(i).Position(j)=Best_P(1,j)-MOP^Q*alfa;
                        
                    else
                        
                        Xnew(i).Position(j)=Best_P(1,j)+MOP^Q*alfa;
                        
                    end
                    
                end
                
            end
            
            if (size(LB,2)~=1)
                
                r1=rand();
                
                if r1>MOA
                    
                    r2=rand();
                    
                    if r2>0.5
                        
                        Xnew(i).Position(j)=Best_P(1,j)/(MOP+eps)*((UB(j)-LB(j))*Mu+LB(j));
                        
                    else
                        
                        Xnew(i).Position(j)=Best_P(1,j)*MOP*((UB(j)-LB(j))*Mu+LB(j));
                        
                    end
                    
                else
                    
                    r3=rand();
                    
                    if r3>0.5
                        
                        Xnew(i).Position(j)=Best_P(1,j)-MOP^Q*((UB(j)-LB(j))*Mu+LB(j));
                        
                    else
                        
                        Xnew(i).Position(j)=Best_P(1,j)+MOP^Q*((UB(j)-LB(j))*Mu+LB(j));
                        
                    end
                    
                end
                
            end
            
        end
        
        Xnew(i).Position = limitToPosition(Xnew(i).Position,LB,UB);
        
        [Xnew(i).Position,Xnew(i).Cost, Xnew(i).Sol]=F_obj(Xnew(i).Position);
        
        if Xnew(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position = Xnew(i).Position;
            
            particle(i).Best.Cost = Xnew(i).Cost;
            
            particle(i).Best.Sol = Xnew(i).Sol;
            
        end
        
        Y(i).Position=Xnew(i).Position;
        
        Y(i).Cost=Xnew(i).Cost;
        
        Y(i).Sol=Xnew(i).Sol;
        
        if particle(i).Best.Cost<Best_FF
            
            Best_FF=particle(i).Best.Cost;
            
            Best_P=particle(i).Best.Position;
            
            AOAsol = particle(i).Best.Sol;
            
        end
        
    end
    
    for i=1:N
        
        % 存放到集合，1：数学对称算子
        Y(i + N).Position = limitToPosition(Best_P + rand() * (Best_P - particle(i).Position),LB,UB);
        
        % 存放到集合，2：靠近最优值算子
        Y(i + N + N).Position = limitToPosition(particle(i).Position ...
            + w * limitToPosition(AOAV(i,:)+len.*rand(1,Dim).*(Best_P-particle(i).Position),vmin,vmax),LB,UB);
        
        % 存放到集合，3：数学中位数算子
        Y(i + N + N + N).Position = limitToPosition((Best_P + particle(i).Position)/2,LB,UB);
        
    end
    
    for m=N+1:len*N
        
        [Y(m).Position, Y(m).Cost, Y(m).Sol]=F_obj(Y(m).Position);
        
    end
    
    [~, index]=sort([Y.Cost]);
    
    if Y(index(1)).Cost < Best_FF
        
        Best_FF=Y(index(1)).Cost;
        
        Best_P=Y(index(1)).Position;
        
        AOAsol = Y(index(1)).Sol;
        
    end
    
    for i = 1:N
        
        particle(i).Position = Y(index(i)).Position;
        
        particle(i).Cost = Y(index(i)).Cost;
        
        particle(i).Sol = Y(index(i)).Sol;
        
        particle(i).Best.Position=particle(i).Position;
        
        particle(i).Best.Cost=particle(i).Cost;
        
        particle(i).Best.Sol=particle(i).Sol;
        
    end
    
    for i=1:N
        
        cost = particle(i).Cost;
        
        for j=1:len
            
            [particle(i).Cost,particle(i).Position,particle(i).Sol] = Mutate(particle(i).Cost,particle(i).Position,model);
            
            if particle(i).Cost<cost
                
                break;
                
            end
            
        end
        
    end
    
    AOAbest(C_Iter)=Best_FF;
    
    AOAmeanbest(C_Iter) = mean([particle(:).Cost]);
    
end

end



