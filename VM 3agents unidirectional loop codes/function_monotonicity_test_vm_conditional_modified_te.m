
function function_monotonicity_test_vm_conditional_modified_te(nbird,num_noise,num_coupling,tau_max)

for ind1=1:nbird
    for ind2=1:nbird
        if ind1~=ind2

            load(['data_te/cmt_data_r3_box10_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'ce_ent')

            ce_ent_new=cell(num_noise,num_coupling);

            for tau_ind=1:tau_max
                for noise_ind=1:num_noise
                    for coup_ind=1:num_coupling
                        ce_ent_new{noise_ind,coup_ind}(1,tau_ind)=ce_ent{tau_ind}(noise_ind,coup_ind);
                    end
                end
            end

            %%%%% monotonic test %%%%

            mon_ce_new=zeros(num_noise,num_coupling);

            for noise_ind=1:num_noise
                for coup_ind=1:num_coupling
                    mon_ce_new(noise_ind,coup_ind)=function_cycleSort_monotonicity_test(ce_ent_new{noise_ind,coup_ind});
                end
            end

            save(['data_te/cmt_data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'mon_ce_new')

        end
    end
end


end

