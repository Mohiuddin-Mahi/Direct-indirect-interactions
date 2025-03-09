

function [fitted_data,params]=lscurvefitting_function_new(data)

t = linspace(0,size(data,2)-1,size(data,2));     %% time delays

%%%% Initial guess of parameters %%%%%%%%%
initial_guess = [0.5, 1, 0.6283, 0];    

%%%% Fitted model %%%%%%
fitted_model = @(b, t)  (exp(-b(1)*t).*(b(2) + cos(b(3)*t))+b(4))/(1+b(2)+b(4));

fitted_data=zeros(size(data));
params=zeros(size(data,1),length(initial_guess));

for ind=1:size(data,1)

    %%%% Performing the curve fitting using non-linear least squares %%%%%
    temp = lsqcurvefit(fitted_model, initial_guess, t, data(ind,:));
    %%% Optimized parameters & fitted curves %%%%%%
    params(ind,:)=temp;
    fitted_data(ind,:) = fitted_model(temp, t);

end


end
