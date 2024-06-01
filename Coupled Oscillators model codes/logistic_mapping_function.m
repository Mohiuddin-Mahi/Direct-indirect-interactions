

%%%% Mohiuddin code: Logistic map of the paper Sun, Jie, and Erik M. Bollt.Physica D: Nonlinear Phenomena 267 (2014): 49-57 %%%%%

function [time_series_out]=logistic_mapping_function(a,epi,cmat,nbird,TMAX)

time_series=zeros(nbird,TMAX);                        %%%% We may consider here 1st row=Z(b1), 2nd row=Y(b2), and 3rd row=X(b3) ... 
first_value=rand(1,nbird); 
time_series(:,1)=first_value';
discarded_value=(5*TMAX)/100;                        %%%% discartion of 5 percent segments

for t=1:TMAX-1
    for ind1=1:nbird
         coupling_value=0;
        for ind2=1:nbird
            if (ind1~=ind2)
                coupling_value=coupling_value+(cmat(ind1,ind2)*((a*time_series(ind2,t)*(1-time_series(ind2,t)))-(a*time_series(ind1,t)*(1-time_series(ind1,t)))));
            end
        end
        time_series(ind1,t+1)=a*time_series(ind1,t)*(1-time_series(ind1,t))+epi*coupling_value;
    end
end

%%%% For initial 5 percent segments discartion/cancelation%%%%%
for ind=1:nbird
    time_series_out(ind,:)=time_series(ind,1+discarded_value:end);
end
%%%%%%% Complete%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


