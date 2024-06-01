

function [x,y]=function_Binary_model(c1,c,tmax,k)
 
a=rand(1,tmax);
x(1)=randi([1 2],[1 1]);

for t=1:tmax-1
    if (a(t)>c1)
        x(t+1)=x(t);
    else
        x(t+1)=randi(2);
    end
end

a=rand(1,tmax);
y=randi([1 2],[1 k]);
for t=1:tmax-k
    if (a(t)>c)
        y(t+k)=y(t+k-1);
    else
        y(t+k)=x(t);
    end
end
x=x(1+k:end);
y=y(1+k:end);



