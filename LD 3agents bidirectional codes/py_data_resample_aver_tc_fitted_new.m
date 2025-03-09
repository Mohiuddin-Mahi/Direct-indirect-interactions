



function py_data_resample_aver_tc_fitted_new(epi,dt,num_trail,num_kT,num_gamma,tmax)

d=round((5*tmax)/100);

for g_ind=1:num_gamma
    for kT_ind=1:num_kT

        load(['corr_data_fit/corr_l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
            '_kT_',num2str(kT_ind),'.mat'],'params_vx','params_vy');

        tic;
        value_tc=zeros(1,num_trail);
        typical_lags_vx=cell(1,num_trail);
        typical_lags_vy=cell(1,num_trail);
        new_vx=cell(1,num_trail);
        new_vy=cell(1,num_trail);

        parfor trail_ind=1:num_trail
            data=load(['py_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
                '_kT_',num2str(kT_ind),'_trail_',num2str(trail_ind),'.mat'],'vx','vy');

            data_vx=data.vx(:,d:end);
            data_vy=data.vy(:,d:end);
            data_length=size(data_vx,2);

            lags_vx=optimal_time_delay_counting_function(params_vx{trail_ind}(:,1));
            lags_vy=optimal_time_delay_counting_function(params_vy{trail_ind}(:,1));


            tc=round(mean(lags_vx));

            temp_vx=[];
            temp_vy=[];

            for t=1:round(data_length/tc)
                temp_vx(:,t)=data_vx(:,(1+(t-1)*tc));
                temp_vy(:,t)=data_vy(:,(1+(t-1)*tc));
            end

            value_tc(trail_ind)=tc;
            typical_lags_vx{trail_ind}=lags_vx;
            typical_lags_vy{trail_ind}=lags_vy;
            new_vx{trail_ind}=temp_vx;
            new_vy{trail_ind}=temp_vy;


        end
        save(['resample_py_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',...
            num2str(kT_ind),'.mat'],'value_tc','typical_lags_vx','typical_lags_vy','new_vx','new_vy','-v7.3')
        toc;

    end
end

end