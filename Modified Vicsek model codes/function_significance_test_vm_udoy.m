
function function_significance_test_vm_udoy(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

tau_array=1:tau_max;

for bird1=1:nbird
    for bird2=2:nbird
        if bird1<bird2

            true_data=cell(num_noise,num_coupling);
            surr_data=cell(num_noise,num_coupling);
            all_pr=zeros(num_noise,num_coupling,tau_max-1);
            pass_or_fail = zeros(num_noise,num_coupling,tau_max-1);

            for coup_ind=1:num_coupling
                for noise_ind=1:num_noise

                    load(['symbols/symbols_r3_box10_coup_',num2str(coup_ind),'_noise_',num2str(noise_ind),'.mat'],'symbols');

                    true_te=zeros(num_trail,tau_max);
                    surr_te=zeros(num_trail*(num_trail-1),tau_max);

                    for tau_ind=1:tau_max
                        tau=tau_array(tau_ind);

                        tic;
                        ind=1;
                        for trail1=1:num_trail
                            for trail2=1:num_trail
                                if trail1==trail2
                                    true_te(trail1,tau_ind)=tran_ent_func_mohi_new(symbols{trail2}(bird2,d:end),...
                                        symbols{trail1}(bird1,d:end),nsymbols,tau);
                                else
                                    surr_te(ind,tau_ind)=tran_ent_func_mohi_new(symbols{trail2}(bird2,d:end),...
                                        symbols{trail1}(bird1,d:end),nsymbols,tau);
                                    ind=ind+1;
                                end
                            end
                        end
                        toc;
                    end

                    %%%%%%%%% Statistical test %%%%%%%%%%%%%%%%%%%

                    for tau1=1:tau_max-1
                        tau2=tau1+1;
                        
                        true_te_mean=mean(true_te,1);
                        if true_te_mean(tau1)>true_te_mean(tau2)
                            diff_true_te=true_te_mean(tau1)-true_te_mean(tau2);
                            diff_sur_te=surr_te(:,tau1)-surr_te(:,tau2);
                        else
                            diff_true_te=true_te_mean(tau2)-true_te_mean(tau1);
                            diff_sur_te=surr_te(:,tau2)-surr_te(:,tau1);
                        end

                        mdi= diff_sur_te;     % surro data set %
                        cb=0.95;              % confidence level%
                        %cb1=0.05;
                        ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
                        smd=sort(mdi,'ascend');
                        d_cut=smd(find(ce<=cb,1,'last'));

                        curr_pass_or_fail=1;                   %%%% assume that curr_pass_or_fail=1 means significant
                        all_pr(noise_ind,coup_ind,tau1)=d_cut;
                        pass_or_fail(noise_ind,coup_ind,tau1) = curr_pass_or_fail & (diff_true_te > d_cut);
                    end
                    true_data{noise_ind,coup_ind}=true_te;
                    surr_data{noise_ind,coup_ind}=surr_te;
                end
            end

            save(['data_te/udoy_data_stat_test_bird_',num2str(bird1),'_',num2str(bird2),...
                '.mat'],'true_data','surr_data','all_pr','pass_or_fail')
        end
    end
end


end


