
function function_monotonicity_test_vm_by_cycle_sort(nbird,num_noise,num_coupling,tau_max)

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2

            load(['data_te/data_r3_box10_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'tran_ent','tran_ent_new')

            tr_ent=cell(num_noise,num_coupling);
            tr_ent_new=cell(num_noise,num_coupling);

            for tau_ind=1:tau_max
                for noise_ind=1:num_noise
                    for coup_ind=1:num_coupling
                        tr_ent{noise_ind,coup_ind}(1,tau_ind)=tran_ent{tau_ind}(noise_ind,coup_ind);
                        tr_ent_new{noise_ind,coup_ind}(1,tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
                    end
                end
            end

            %%%%% monotonic test %%%%

            mon_te=zeros(num_noise,num_coupling);
            mon_te_new=zeros(num_noise,num_coupling);

            for noise_ind=1:num_noise
                for coup_ind=1:num_coupling
                    mon_te(noise_ind,coup_ind)=function_cycleSort_monotonicity_test(tr_ent{noise_ind,coup_ind});
                    mon_te_new(noise_ind,coup_ind)=function_cycleSort_monotonicity_test(tr_ent_new{noise_ind,coup_ind});
                end
            end

            save(['data_te/data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'mon_te','mon_te_new')

        end
    end
end


end

