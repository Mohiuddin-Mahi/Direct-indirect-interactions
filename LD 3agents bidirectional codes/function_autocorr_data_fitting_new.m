


function function_autocorr_data_fitting_new(epi,dt,num_trail,num_kT,num_gamma)

for g_ind=1:num_gamma
    for kT_ind=1:num_kT
        
        load(['corr_data/corr_l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
            '_kT_',num2str(kT_ind),'.mat'],'corr_vx','corr_vy');
        tic;
        
        params_vx=cell(1,num_trail);
        params_vy=cell(1,num_trail);
        fitted_corr_vx=cell(1,num_trail);
        fitted_corr_vy=cell(1,num_trail);

        for trail_ind=1:num_trail

            [temp1,temp2]=lscurvefitting_function_new(corr_vx{trail_ind});
            params_vx{trail_ind} =temp2; 
            fitted_corr_vx{trail_ind} =temp1; 

            [temp3,temp4]=lscurvefitting_function_new(corr_vy{trail_ind});
            params_vy{trail_ind} =temp4; 
            fitted_corr_vy{trail_ind} =temp3; 

        end
        toc;
        save(['corr_data_fit/corr_l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',...
            num2str(kT_ind),'.mat'],'params_vx','params_vy','fitted_corr_vx','fitted_corr_vy')
    end

end

end