
% clc
% close all
% clear;
% d=8; a=4;
% x=[1,2,0,8,9,5,6,3,4,6,0,9,4];
% y=[3,2,0,4,1,2,3,8,6,7,4,5,6];

function [tr_en1]=tran_ent_func_mohi(x,y,nsymbols,d)

%probability of x,x,y%%

xt1=x(1+d:end);
xt=x(1:end-d);  
yt=y(1:end-d);
vec_x_x_y = [xt1' xt' yt'];

[tmp_x_x_y_1,~,tmp_x_x_y_3]=unique(vec_x_x_y,'rows');
[a,~]=size(tmp_x_x_y_1);
counts = histcounts(tmp_x_x_y_3,1:(a+1));
pr_x_x_y=counts./size(vec_x_x_y,1);

new_pr_x_x_y=zeros(nsymbols,nsymbols,nsymbols);
new_pr_x_x=zeros(nsymbols,nsymbols);
new_pr_x_y=zeros(nsymbols,nsymbols);
new_pr_x=zeros(1,nsymbols);

if (~isempty(tmp_x_x_y_1))
    for ind1=1:size(tmp_x_x_y_1,1)
        curr_symbol=tmp_x_x_y_1(ind1,:);
        new_pr_x_x_y(curr_symbol(1),curr_symbol(2),curr_symbol(3))=pr_x_x_y(ind1);
    end
end

%%probabiity x and y%%%
for j=1:nsymbols
    for k=1:nsymbols
        pr=0;
        for i=1:nsymbols
            pr=pr+new_pr_x_x_y(i,j,k);
        end
        new_pr_x_y(j,k)=pr;
    end
end

%%probabiity x and x%%%
for i=1:nsymbols
    for j=1:nsymbols
        pr=0;
        for k=1:nsymbols
            pr=pr+new_pr_x_x_y(i,j,k);
        end
        new_pr_x_x(i,j)=pr;
    end
end

%%Probability of x %%%
for j=1:nsymbols
    pr=0;
    for i=1:nsymbols
        for k=1:nsymbols
            pr=pr+new_pr_x_x_y(i,j,k);
        end
    end
    new_pr_x(j)=pr;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tr_en1=0;
for i=1:nsymbols
    for j=1:nsymbols
        for k=1:nsymbols
            if(new_pr_x_x_y(i,j,k)~=0 && new_pr_x_x(i,j)~=0 &&...
                    new_pr_x_y(j,k)~=0 && new_pr_x(j)~=0)
                tr_en1=tr_en1+new_pr_x_x_y(i,j,k)*log2(new_pr_x_x_y(i,j,k)*new_pr_x(j)/...
                    (new_pr_x_y(j,k)*new_pr_x_x(i,j)));
            end
        end
    end
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%