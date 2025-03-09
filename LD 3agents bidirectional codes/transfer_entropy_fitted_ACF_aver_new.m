
function transfer_entropy_fitted_ACF_aver_new(epi,dt,num_trail,num_kT,nparticles,num_gamma,num_symbols,num_tau)

for ind1=1:nparticles
    for ind2=1:nparticles
        if ind1~=ind2

            tran_ent=cell(num_kT,num_gamma);
            tran_ent_new=cell(num_kT,num_gamma);

            for g_ind=1:num_gamma
                for kT_ind=1:num_kT
                    load(['discretize_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
                        '_kT_',num2str(kT_ind),'.mat'],'data_sym');
                    tic;
                    temp=zeros(num_trail,num_tau);
                    temp_new=zeros(num_trail,num_tau);
                    parfor trail_ind=1:num_trail

                        for tau=1:num_tau
                            temp(trail_ind,tau)=tran_ent_func_mohi(data_sym{trail_ind}(ind2,:),...
                                data_sym{trail_ind}(ind1,:),num_symbols,tau);

                            temp_new(trail_ind,tau)=tran_ent_func_mohi_new(data_sym{trail_ind}(ind2,:),...
                                data_sym{trail_ind}(ind1,:),num_symbols,tau);
                        end

                    end
                    tran_ent{kT_ind,g_ind}=temp;
                    tran_ent_new{kT_ind,g_ind}=temp_new;
                    toc;
                end
            end
            save(['data_te/te_mt_l_10_epi_',num2str(epi),'_dt_',num2str(dt),'_part_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'tran_ent','tran_ent_new')

        end
    end
end

end
