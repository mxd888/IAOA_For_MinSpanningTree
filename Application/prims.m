

model = loadmodel(i);

route = primaa(model.d,22);

function [route]=primaa(A,start) %A=cost matrix, start= initial node
[x y]=size(A);
if ne(x,y) % check if matrix is square
    fprintf('enter square matrix');
    return;end
for i=1 : size(A,1) %assigning large cost(inf) to not connected edges
    for j=1 : size(A,1)
        if A(i,j)==0; A(i,j)=inf;
        end
    end
end
route=zeros(x-1,3); %initialize route matrix (first node, second node, cost)
C=(start); %initial node
C_N=(1:x); % all nodes
C_N(:,start)=[]; %removing selected node
for k = 2:x
    counter=0;
    min=inf; %can be set to infinity
    for i=C
        count=0;
        for j=C_N
            count=count+1;
            if min>A(i,j)
                min=A(i,j);
                s=i;e=j;counter=count; %s=start node e=end node counter=node to remove
            end
        end
    end
    C(end+1)=e; % add node
    C_N(:,counter)=[]; % remove added none
    route(k-1,:)=[s e min]; % [start_node  end_node  cost]
end
end
    