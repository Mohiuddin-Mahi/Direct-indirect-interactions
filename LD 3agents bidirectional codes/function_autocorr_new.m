
function function_autocorr_new(epi,dt,num_trail,num_kT,nparticles,num_tau,tmax,num_gamma)

d=round((5*tmax)/100);
tau_array=0:num_tau;

for g_ind=1:num_gamma
    for kT_ind=1:num_kT
        corr_vx=cell(1,num_trail);
        corr_vy=cell(1,num_trail);

        tic;
        parfor trail_ind=1:num_trail

            data=load(['py_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',...
                num2str(kT_ind),'_trail_',num2str(trail_ind),'.mat'],'vx','vy');

            temp_vx=zeros(nparticles,length(tau_array));
            temp_vy=zeros(nparticles,length(tau_array));
            for ind=1:nparticles
                for tau_ind=1:length(tau_array)
                    tau=tau_array(tau_ind);
                    %%% data is a struck so data.vx & data.vy are written%%%
                    temp_vx(ind,tau_ind) = autocorrelation_function(data.vx(ind,d:end),tau);
                    temp_vy(ind,tau_ind) = autocorrelation_function(data.vy(ind,d:end),tau);

                end
            end
            corr_vx{1,trail_ind}=temp_vx;
            corr_vy{1,trail_ind}=temp_vy;
        end
        toc;
        save(['corr_data/corr_l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),'_kT_',...
            num2str(kT_ind),'.mat'],'corr_vx','corr_vy')
    end

end

end