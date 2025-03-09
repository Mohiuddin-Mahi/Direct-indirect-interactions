


function stat_test_true_surr_data_modified_te(epi,dt,num_trail,num_kT,nparticles,num_gamma,num_symbols,num_tau)

for ind1=1:nparticles
    for ind2=1:nparticles
        if ind1~=ind2

            true_data=cell(num_kT,num_gamma);
            surr_data=cell(num_kT,num_gamma);
            for g_ind=1:num_gamma
                tic;
                parfor kT_ind=1:num_kT

                    data=load(['discretize_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
                        '_kT_',num2str(kT_ind),'.mat'],'data_sym');

                    %%%%%%%%% Fixing the length of data %%%%%
                    data_length=zeros(1,num_trail);
                    for i=1:num_trail
                        data_length(i)=size(data.data_sym{i},2);
                    end
                    min_length=min(data_length);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    %%%% Estimation true TE & surrogate TE %%%%%%%%%
                    true_te=zeros(num_trail,num_tau);
                    surr_te=zeros(num_trail*(num_trail-1),num_tau);
                    for tau_ind=1:num_tau
                        
                        ind=1;
                        for trail1=1:num_trail
                            for trail2=1:num_trail
                                if trail1==trail2
                                    true_te(trail1,tau_ind)=tran_ent_func_mohi_new(data.data_sym{trail2}(ind2,1:min_length),...
                                        data.data_sym{trail1}(ind1,1:min_length),num_symbols,tau_ind);
                                else
                                    surr_te(ind,tau_ind)=tran_ent_func_mohi_new(data.data_sym{trail2}(ind2,1:min_length),...
                                        data.data_sym{trail1}(ind1,1:min_length),num_symbols,tau_ind);
                                    ind=ind+1;
                                end
                            end
                        end
                        
                    end
                    true_data{kT_ind,g_ind}=true_te;
                    surr_data{kT_ind,g_ind}=surr_te;
                end
                toc;
            end
            save(['data_te/mt_data_true_surr_part_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'true_data','surr_data')
        end
    end
end

end


