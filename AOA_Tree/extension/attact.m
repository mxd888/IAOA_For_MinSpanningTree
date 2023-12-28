%-----------------------------------------------------------------------------------
% Charge 
Fmax=max(fitness); Fmin=min(fitness); Fmean=mean(fitness); 

if Fmax==Fmin
   Q=ones(N,1);
else
   if tag==1 %for minimization
      best=Fmin;worst=Fmax;
   else %for maximization
      best=Fmax;worst=Fmin; 
   end
   Q=exp((fitness-worst)./(best-worst));
end
Q=Q./sum(Q); 
%----------------------------------------------------------------------------------
fper=3; %In the last iteration, only 2-6 percent of charges apply force to the others.
%----------------------------------------------------------------------------------
 %%%%total electric force calculation
 if FCheck==1
     cbest=fper+(1-iteration/max_it)*(100-fper); 
     cbest=round(N*cbest/100);
 else
     cbest=N; 
 end
 [Qs s]=sort(Q,'descend');
 for i=1:N
     E(i,:)=zeros(1,D);
     for ii=1:cbest
         j=s(ii);
         if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); %Euclidian distanse.
             for k=1:D 
                 E(i,k)=E(i,k)+ rand*(Q(j))*((X(j,k)-X(i,k))/(R^Rpower+eps));
             end
         end
     end
 end
%---------------------------------------------------------------------------------- 
%Calculation of Coulomb constant
%----------------------------------------------------------------------------------
alfa=30;K0=500;
K=K0*exp(-alfa*iteration/max_it);
%---------------------------------------------------------------------------------- 
%%%Calculation of accelaration.
a=E*K;
%----------------------------------------------------------------------------------
%Charge movement
%----------------------------------------------------------------------------------
V=rand(N,D).*V+a;

for a = 1:N
    if rand() > 0
        Y(a,:)=X(a,:)+V(a,:);
%         Y(a,:)=X(a,:)+V(a,:).*fitness(a)/(fitness(best_X) - fitness(worst_X));
%     else
%         for j=1:D
%             center = X(best_X,j);
%             l = rand();
%             r = rand();
%             radius = (1 - 1*(iteration/max_it))*abs(center - X(a,j));
%                 Y(a,j) = (r*radius * exp(l)*cos(2*pi*l) + r * X(a,j) + (1-r) * center); %²âÊÔbartree ×îÓÅÖµ1.7249
%         end
    end
end





