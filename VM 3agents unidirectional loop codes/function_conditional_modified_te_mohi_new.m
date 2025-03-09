
% % clc
% % close all
% % clear;
% % d=1;
% % x=[1,2,0,8,9,5,6,3,4,6,0,9,4]
% % y=[3,2,0,4,1,2,3,8,6,7,4,5,6]

function [ce_en1]=function_conditional_modified_te_mohi_new(x,y,nsymbols,d)

%%% probability of x1,x,x_1,y %%%

xt1=x(2+d:end);
xt=x(1+d:end-1);
xt_1=x(d:end-2);
yt=y(2:end-d);


vec_x1xx_1y = [xt1' xt' xt_1' yt'];

[tmp_x1xx_1y_1,~,tmp_x1xx_1y_3]=unique(vec_x1xx_1y,'rows');

[a,~]=size(tmp_x1xx_1y_1);
counts = histcounts(tmp_x1xx_1y_3,1:(a+1));
pr_x1xx_1y=counts./size(vec_x1xx_1y,1);

new_pr_x1xx_1y=zeros(nsymbols,nsymbols,nsymbols,nsymbols);
new_pr_x1xx_1=zeros(nsymbols,nsymbols,nsymbols);
new_pr_xx_1y=zeros(nsymbols,nsymbols,nsymbols);
new_pr_xx_1=zeros(nsymbols,nsymbols);

if (~isempty(tmp_x1xx_1y_1))
    for ind1=1:size(tmp_x1xx_1y_1,1)
        curr_symbol=tmp_x1xx_1y_1(ind1,:);
        new_pr_x1xx_1y(curr_symbol(1),curr_symbol(2),curr_symbol(3),curr_symbol(4))=pr_x1xx_1y(ind1);
    end
end

%%% probabiity x, x_1, y %%%
for j=1:nsymbols
    for k=1:nsymbols
        for l=1:nsymbols
            pr=0;
            for i=1:nsymbols
                pr=pr+new_pr_x1xx_1y(i,j,k,l);
            end
            new_pr_xx_1y(j,k,l)=pr;
        end
    end
end

%%% probabiity x1, x, x_1 %%%
for i=1:nsymbols
    for j=1:nsymbols
        for k=1:nsymbols
            pr=0;
            for l=1:nsymbols
                pr=pr+new_pr_x1xx_1y(i,j,k,l);
            end
            new_pr_x1xx_1(i,j,k)=pr;
        end
    end
end

%%% Probability of x, x_1 %%%
for j=1:nsymbols
    for k=1:nsymbols
        pr=0;
        for i=1:nsymbols
            for l=1:nsymbols
                pr=pr+new_pr_x1xx_1y(i,j,k,l);
            end
        end
        new_pr_xx_1(j,k)=pr;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ce_en1=0;
for i=1:nsymbols
    for j=1:nsymbols
        for k=1:nsymbols
            for l=1:nsymbols

                if(new_pr_x1xx_1y(i,j,k,l)~=0 && new_pr_x1xx_1(i,j,k)~=0 &&...
                        new_pr_xx_1y(j,k,l)~=0 && new_pr_xx_1(j,k)~=0)
                    ce_en1=ce_en1+new_pr_x1xx_1y(i,j,k,l)*log2(new_pr_x1xx_1y(i,j,k,l)*new_pr_xx_1(j,k)/...
                        (new_pr_xx_1y(j,k,l)*new_pr_x1xx_1(i,j,k)));
                end

            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%