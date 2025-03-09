
function discretize_resample_data_aver_tc_fitted_ACF(epi,dt,num_trail,num_kT,num_grids,num_gamma)

symbol_array=reshape(1:(num_grids*num_grids),[num_grids,num_grids]);

for g_ind=1:num_gamma
    for kT_ind=1:num_kT
        load(['resample_py_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',...
            num2str(kT_ind),'.mat'],'new_vx','new_vy')

        tic;
        data_sym=cell(1,num_trail);
        
        parfor trail_ind=1:num_trail
            [symbols_out]=frequency_discretization_function(symbol_array,new_vx{trail_ind},new_vy{trail_ind});
            data_sym{1,trail_ind}=symbols_out;
        end

        save(['discretize_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',num2str(kT_ind),'.mat'],...
            'data_sym','symbol_array','-v7.3')
        toc;
    end
end

end