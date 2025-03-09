

function [symbols_out]=frequency_discretization_function(symbol_array,vx,vy)

symbols_out=zeros(size(vx));                             % Initialize symbolized variables

for ind=1:1:size(vx,1)

    curr_vx=vx(ind,:);
    curr_vy=vy(ind,:);

    %% Sort the data in ascending order
    sorted_curr_vx=sort(curr_vx,'ascend');
    sorted_curr_vy=sort(curr_vy,'ascend');

    %% Calculate the number of data points in each bin
    bin_size_vx = floor(length(curr_vx)/ length(symbol_array));
    bin_size_vy = floor(length(curr_vy)/ length(symbol_array));

    %% Initialize variables to keep track of bin boundaries
    bin_edges_vx = zeros(1, length(symbol_array) + 1);
    bin_edges_vy = zeros(1, length(symbol_array) + 1);

    %%% Calculate bin edges  %%%%
    bin_edges_vx(1) = -Inf;                                   % To include the minimum value
    bin_edges_vy(1) = -Inf;
    for i = 1:length(symbol_array)-1
        bin_edges_vx(i+1) = sorted_curr_vx(i*bin_size_vx);
        bin_edges_vy(i+1) = sorted_curr_vy(i*bin_size_vy);
    end
    bin_edges_vx(end) = Inf;                                  % To include the maximum value
    bin_edges_vy(end) = Inf;

    %%% Assign each data point to a symbol/bin %%%%
    for vx_ind=1:length(symbol_array)
        for vy_ind=1:length(symbol_array)

            symbols_out(ind,curr_vx>=bin_edges_vx(vx_ind) & curr_vx <= bin_edges_vx(vx_ind+1) & curr_vy>=bin_edges_vy(vy_ind) &...
                curr_vy <= bin_edges_vy(vy_ind+1)) = symbol_array(vy_ind,vx_ind);

        end

    end

end