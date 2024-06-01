
function function_tran_ent_logistic(tmax,num_trail,num_chaos,num_coup,nsymbols,coup_min,coup_max,chaos_min,chaos_max,tau_max)

nbird=3;
k=1;l=1;
tau_array=1:tau_max;
d=round((5*tmax)/100);
coup_array=linspace(coup_min,coup_max,num_coup);
chaos_array=linspace(chaos_min,chaos_max,num_chaos);

for ind1=1:nbird
    for ind2=1:nbird

        if (ind1<ind2)

            tran_ent=cell(1,length(tau_array));
            tran_ent_new=cell(1,length(tau_array));

            for tau_ind=1:length(tau_array)
                tau=tau_array(tau_ind);

                for chaos_ind=1:length(chaos_array)
                    for coup_ind=1:length(coup_array)
                        tic;
                        load(['symbols/symbols_chaos_',num2str(chaos_ind),'_coup_',num2str(coup_ind),'.mat'],'symbols');
                        temp=zeros(1,num_trail);
                        temp_new=zeros(1,num_trail);

                        parfor trail_ind=1:num_trail
                            temp(1,trail_ind)=transfer_entropy_function_udoy(symbols{trail_ind}(ind2,d:end),...
                                symbols{trail_ind}(ind1,d:end),nsymbols,k,l,tau);
                            temp_new(1,trail_ind)=transfer_entropy_function_udoy_new(symbols{trail_ind}(ind2,d:end),...
                                symbols{trail_ind}(ind1,d:end),nsymbols,k,l,tau);
                        end

                        tran_ent{tau_ind}(chaos_ind,coup_ind)=mean(temp,2);
                        tran_ent_new{tau_ind}(chaos_ind,coup_ind)=mean(temp_new,2);
                        toc;
                    end
                end

            end
            save(['data_te/data_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'tran_ent', 'tran_ent_new')

        end

    end
end

end