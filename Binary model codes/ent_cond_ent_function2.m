
function [ent1,ent2,cond_ent1,cond_ent2]=ent_cond_ent_function2(x,y,nsymbols,tau)

%%%%%%%%%%%%%%%%%%%%% Probability computation %%%%%%%%%%%%%%%%%%%

xt1=x(1+tau:end);
xt=x(1:end-tau);
yt=y(1:end-tau);

vec_x1xy= [xt1' xt' yt'];

[tmp_x1xy_1,~,tmp_x1xy_3]=unique(vec_x1xy,'rows');
[a,~]=size(tmp_x1xy_1);
counts = histcounts(tmp_x1xy_3,1:(a+1));
pr_x1xy=counts./size(vec_x1xy,1);

new_pr_x1xy=zeros(nsymbols,nsymbols,nsymbols);
new_pr_x1x=zeros(nsymbols,nsymbols);
new_pr_xy=zeros(nsymbols,nsymbols);
new_pr_x=zeros(nsymbols);
new_pr_y=zeros(nsymbols);

if (~isempty(tmp_x1xy_1))
    for ind1=1:size(tmp_x1xy_1,1)
        curr_symbol=tmp_x1xy_1(ind1,:);
        new_pr_x1xy(curr_symbol(1),curr_symbol(2),curr_symbol(3))=pr_x1xy(ind1);
    end
end

%%% Probability of x %%%
for j=1:nsymbols
    pr=0;
    for i=1:nsymbols
        for k=1:nsymbols
        pr=pr+new_pr_x1xy(i,j,k);
        end
    end
    new_pr_x(j)=pr;
end
%%%%%%%%%%%%%%%%%%%%%%%%

%%% Probability of y %%%
for k=1:nsymbols
    pr=0;
    for i=1:nsymbols
        for j=1:nsymbols
        pr=pr+new_pr_x1xy(i,j,k);
        end
    end
    new_pr_y(k)=pr;
end
%%%%%%%%%%%%%%%%%%%%%%%%

%%% Probability of x1 and x %%%
for i=1:nsymbols
    for j=1:nsymbols
        pr=0;
        for k=1:nsymbols
        pr=pr+new_pr_x1xy(i,j,k);
        end
         new_pr_x1x(i,j)=pr;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%

%%% Probability of x and y %%%
for j=1:nsymbols
    for k=1:nsymbols
        pr=0;
        for i=1:nsymbols
        pr=pr+new_pr_x1xy(i,j,k);
        end
         new_pr_xy(j,k)=pr;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Entropy H(X)  %%%%%%%%%%%%%%%%%%%%
ent1=0;
for j=1:nsymbols
    if(new_pr_x(j)~=0)
        ent1=ent1-(new_pr_x(j)*log2(new_pr_x(j)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Entropy H(Y)  %%%%%%%%%%%%%%%%%%%%
ent2=0;
for k=1:nsymbols
    if(new_pr_y(k)~=0)
        ent2=ent2-(new_pr_y(k)*log2(new_pr_y(k)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%% Conditional entropy H(X(t+tau)|X(t)) %%%%%
cond_ent1=0;
for i=1:nsymbols
    for j=1:nsymbols
        if(new_pr_x1x(i,j)~=0 && new_pr_x(j)~=0)
            cond_ent1=cond_ent1-(new_pr_x1x(i,j)*log2(new_pr_x1x(i,j)/new_pr_x(j)));
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Conditional entropy H(X(t+tau)|X(t),Y(t)) %%%%%
cond_ent2=0;
for i=1:nsymbols
    for j=1:nsymbols
        for k=1:nsymbols
        if(new_pr_x1xy(i,j,k)~=0 && new_pr_xy(j,k)~=0)
            cond_ent2=cond_ent2-(new_pr_x1xy(i,j,k)*log2(new_pr_x1xy(i,j,k)/new_pr_xy(j,k)));
        end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
