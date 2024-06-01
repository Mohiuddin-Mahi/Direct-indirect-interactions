
function symbols_out=discretization_logistic_map_function(array,num_symbols)

array(array>1)=array(array>1)-1;
array(array<0)=array(array<0)+1;
grid_points=linspace(0,1,num_symbols+1);
symbols_out=zeros(size(array));
for ind=1:1:size(array,1)
    curr_array=array(ind,:);
    for symbol_ind=1:1:num_symbols
        symbols_out(ind,curr_array>=grid_points(symbol_ind) & curr_array <= grid_points(symbol_ind+1)) = symbol_ind;
    end
end
