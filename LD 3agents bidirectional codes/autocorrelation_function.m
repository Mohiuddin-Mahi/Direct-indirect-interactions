
function [corr_coef]=autocorrelation_function(x,tau)

tmax=length(x);
xbar=mean(x);

diff_x=0;
for i=1:tmax
    diff_x=diff_x+(x(i)-xbar)^2;
end

diff_x_at_k=0;
for j=1:tmax-tau
    diff_x_at_k=diff_x_at_k+((x(j)-xbar)*(x(j+tau)-xbar));
end
corr_coef=diff_x_at_k/diff_x;
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        