

function[typical_lags]=optimal_time_delay_counting_function(gamma)

typical_lags=zeros(size(gamma));

for ind=1:size(gamma,1)
    typical_lags(ind,1)=round(1/gamma(ind));
end

end
