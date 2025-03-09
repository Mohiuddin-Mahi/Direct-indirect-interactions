
function function_conditional_entropy_computation(epi,dt,num_trail,num_kT,nparticles,num_gamma,nsymbols,num_tau)

tau_array=1:num_tau;
kT_array=linspace(0.2,3.8,num_kT);
g_array=linspace(0.2,2,num_gamma);

entropy1=cell(length(kT_array),length(g_array));
entropy2=cell(length(kT_array),length(g_array));
cond_entropy1=cell(length(kT_array),length(g_array));
cond_entropy2=cell(length(kT_array),length(g_array));
cond_entropy1_new=cell(length(kT_array),length(g_array));
cond_entropy2_new=cell(length(kT_array),length(g_array));

for ind1=1:nparticles
    for ind2=1:nparticles
        if ind1~=ind2

            for kT_ind=1:length(kT_array)
                for g_ind=1:length(g_array)
                    load(['discretize_data/l_10_epi_',num2str(epi),'_g_',num2str(g_ind),'_dt_',num2str(dt),...
                        '_kT_',num2str(kT_ind),'.mat'],'data_sym');

                    tic;
                    for tau_ind=1:length(tau_array)
                        tau=tau_array(tau_ind);
                        parfor trail_ind=1:num_trail
                            [ent1,ent2,cond_ent1,cond_ent2]=ent_cond_ent_function(data_sym{trail_ind}(ind2,:),...
                                data_sym{trail_ind}(ind1,:),nsymbols,tau);
                            [cond_ent1_new,cond_ent2_new] =cond_ent_function_new(data_sym{trail_ind}(ind2,:),...
                                data_sym{trail_ind}(ind1,:),nsymbols,tau);

                            temp1(trail_ind,tau_ind) =ent1;
                            temp2(trail_ind,tau_ind) =ent2;
                            cond_temp1(trail_ind,tau_ind) =cond_ent1;
                            cond_temp2(trail_ind,tau_ind) =cond_ent2;
                            
                            cond_temp1_new(trail_ind,tau_ind) =cond_ent1_new;
                            cond_temp2_new(trail_ind,tau_ind) =cond_ent2_new;
                        end
                    end
                    entropy1{kT_ind,g_ind}=temp1;
                    entropy2{kT_ind,g_ind}=temp2;
                    cond_entropy1{kT_ind,g_ind}=cond_temp1;
                    cond_entropy2{kT_ind,g_ind} =cond_temp2;
                    cond_entropy1_new{kT_ind,g_ind}=cond_temp1_new;
                    cond_entropy2_new{kT_ind,g_ind}=cond_temp2_new;
                    toc;
                end
            end
            save(['data_te/cond_ent_part_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'entropy1','entropy2','cond_entropy1','cond_entropy2','cond_entropy1_new','cond_entropy2_new')
        end
    end
end

end


