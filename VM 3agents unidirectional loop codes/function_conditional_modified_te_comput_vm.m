

function function_conditional_modified_te_comput_vm(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

tau_array=1:tau_max;

for bird1=1:nbird
    for bird2=1:nbird
        if (bird1~=bird2)

            ce_ent=cell(1,length(tau_array));

            for tau_ind=1:length(tau_array)
                tau=tau_array(tau_ind);

                for coup_ind=1:num_coupling
                    for noise_ind=1:num_noise

                        load(['symbols/symbols_r3_box10_coup_',num2str(coup_ind),'_noise_',...
                            num2str(noise_ind),'.mat'],'symbols');
                        tic;
                        temp_new=zeros(1,num_trail);

                        parfor trail_ind=1:num_trail
                            temp_new(1,trail_ind)=function_conditional_modified_te_mohi_new(symbols{trail_ind}(bird2,d:end),...
                                symbols{trail_ind}(bird1,d:end),nsymbols,tau);
                        end

                        ce_ent{tau_ind}(noise_ind,coup_ind)=mean(temp_new,2);
                        toc;
                    end
                end
                
            end
            save(['data_te/cmt_data_r3_box10_birds_',num2str(bird1),'_',num2str(bird2),'.mat'],'ce_ent')
        end 
    end
end

end