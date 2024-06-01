function c=sequence_prob(x,k)

n=length(x);

R=cell(1,k);

for i=1:k
    for j=i:-1:1
        
        if j==i
            R{i}(j,:)=x(:,j:n);
        else
            R{i}(k-j,:)=x(:,i-j:n-j);
        end
        
    end
end
c=R{1,k}';

