

function function_monotonic_test_LD_ACF_aver_fitted(epi,dt,nparticles,num_kT,num_gamma,tau_max,num_trail)

for ind1=1:nparticles
    for ind2=1:nparticles
        if ind1~=ind2
            tic;
            load(['data_te/te_mt_l_10_epi_',num2str(epi),'_dt_',num2str(dt),'_part_',num2str(ind1),'_',...
                num2str(ind2),'.mat'],'tran_ent','tran_ent_new')

            mon_te=zeros(num_kT,num_gamma);
            mon_te_new=zeros(num_kT,num_gamma);
            for kT_ind=1:num_kT
                for gamma_ind=1:num_gamma
                    mon_te(kT_ind,gamma_ind)=function_cycleSort_monotonicity_test(mean(tran_ent{kT_ind,gamma_ind}...
                        (1:num_trail,1:tau_max),1));
                    mon_te_new(kT_ind,gamma_ind)=function_cycleSort_monotonicity_test(mean(tran_ent_new{kT_ind,gamma_ind}...
                        (1:num_trail,1:tau_max),1));
                end
            end
            save(['data_te/data_monotonic_test_epi_',num2str(epi),'_part_',num2str(ind1),'_',num2str(ind2),'.mat'],'mon_te','mon_te_new')
            toc;
        end
    end
end


end

