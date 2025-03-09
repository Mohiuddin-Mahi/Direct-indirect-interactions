function symbols_out=get_symbol_strings(theta,num_symbols)

theta(theta>2*pi)=theta(theta>2*pi)-2*pi;
theta(theta<0)=theta(theta<0)+2*pi;
grid_points=linspace(0,2*pi,num_symbols+1);
symbols_out=zeros(size(theta));
for ind=1:1:size(theta,1)
    curr_theta=theta(ind,:);
    
    for symbol_ind=1:1:num_symbols
        symbols_out(ind,curr_theta>=grid_points(symbol_ind) & curr_theta <= grid_points(symbol_ind+1)) = symbol_ind;
    end
end