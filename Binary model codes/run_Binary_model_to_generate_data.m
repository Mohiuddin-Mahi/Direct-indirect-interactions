
function run_Binary_model_to_generate_data()

clc
close all
clear;

delay=1;
tmax=1e5;
num_trail=20;
c1_point=19;
coup_point=19;
c1_array=linspace(0.1,1,c1_point);
coup_array=linspace(0.1,1,coup_point);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for c1_ind=1:length(c1_array)
    c1=c1_array(c1_ind);

    for coup_ind=1:length(coup_array)
        epi=coup_array(coup_ind);

        tic;
        parfor trail_ind=1:num_trail
            [x,y]=function_Binary_model(c1,epi,tmax,delay);
            time_series_out=[x;y];
            symbols{trail_ind}=time_series_out;
        end
        toc;
        save(['symbols/symbols_c1_',num2str(c1_ind),'_coup_',num2str(coup_ind)],'symbols')
    end
end

end

