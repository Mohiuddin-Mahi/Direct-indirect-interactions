

function function_conditional_entropy_computation(d,nbird,nsymbols,num_trail,num_noise,num_coup,tau_max)

tau_array=1:tau_max;
coup_array=linspace(0.1,1,num_coup);
noise_array=linspace(pi/10,19*pi/10,num_noise);

entropy1=cell(length(noise_array),length(coup_array));
entropy2=cell(length(noise_array),length(coup_array));
cond_entropy1=cell(length(noise_array),length(coup_array));
cond_entropy2=cell(length(noise_array),length(coup_array));
cond_entropy1_new=cell(length(noise_array),length(coup_array));
cond_entropy2_new=cell(length(noise_array),length(coup_array));

for ind1=1:nbird
    for ind2=1:nbird
        if ind1~=ind2

            for noise_ind=1:length(noise_array)
                for coup_ind=1:length(coup_array)
                    load(['symbols/symbols_r3_box10_coup_',num2str(coup_ind),'_noise_',...
                            num2str(noise_ind),'.mat'],'symbols');

                    tic;
                    for tau_ind=1:length(tau_array)
                        tau=tau_array(tau_ind);
                        parfor trail_ind=1:num_trail
                            [ent1,ent2,cond_ent1,cond_ent2]=ent_cond_ent_function(symbols{trail_ind}(ind2,d:end),...
                                symbols{trail_ind}(ind1,d:end),nsymbols,tau);
                            [cond_ent1_new,cond_ent2_new] =cond_ent_function_new(symbols{trail_ind}(ind2,d:end),...
                                symbols{trail_ind}(ind1,d:end),nsymbols,tau);

                            temp1(trail_ind,tau_ind) =ent1;
                            temp2(trail_ind,tau_ind) =ent2;
                            cond_temp1(trail_ind,tau_ind) =cond_ent1;
                            cond_temp2(trail_ind,tau_ind) =cond_ent2;
                            
                            cond_temp1_new(trail_ind,tau_ind) =cond_ent1_new;
                            cond_temp2_new(trail_ind,tau_ind) =cond_ent2_new;
                        end
                    end
                    entropy1{noise_ind,coup_ind}=temp1;
                    entropy2{noise_ind,coup_ind}=temp2;
                    cond_entropy1{noise_ind,coup_ind}=cond_temp1;
                    cond_entropy2{noise_ind,coup_ind} =cond_temp2;
                    cond_entropy1_new{noise_ind,coup_ind}=cond_temp1_new;
                    cond_entropy2_new{noise_ind,coup_ind}=cond_temp2_new;
                    toc;
                end
            end
            save(['data_te/cond_ent_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'entropy1','entropy2','cond_entropy1','cond_entropy2','cond_entropy1_new','cond_entropy2_new')
        end
    end
end

end


