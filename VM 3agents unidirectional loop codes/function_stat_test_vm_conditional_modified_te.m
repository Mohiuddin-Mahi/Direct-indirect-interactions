

function function_stat_test_vm_conditional_modified_te(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

tau_array=1:tau_max;

for bird1=1:nbird
    for bird2=1:nbird
        if bird1~=bird2

            true_data=cell(num_noise,num_coupling);
            surr_data=cell(num_noise,num_coupling);
            all_pr=zeros(num_noise,num_coupling,tau_max-1);
            pass_or_fail = zeros(num_noise,num_coupling,tau_max-1);

            for coup_ind=1:num_coupling
                for noise_ind=1:num_noise

                    load(['symbols/symbols_r3_box10_coup_',num2str(coup_ind),'_noise_',...
                        num2str(noise_ind),'.mat'],'symbols');
                    
                    true_ce=zeros(num_trail,tau_max);
                    surr_ce=zeros(num_trail*(num_trail-1),tau_max);
                    
                    tic;
                    for tau_ind=1:tau_max
                        tau=tau_array(tau_ind);

                        temp_true_ce=zeros(num_trail,1);
                        temp_surr_ce=[];
                        
                        parfor trail1=1:num_trail
                            for trail2=1:num_trail
                                if trail1==trail2
                                    temp_true_ce(trail1)=function_conditional_modified_te_mohi_new(symbols{trail2}(bird2,d:end),...
                                        symbols{trail1}(bird1,d:end),nsymbols,tau);
                                else
                                    temp=function_conditional_modified_te_mohi_new(symbols{trail2}(bird2,d:end),...
                                        symbols{trail1}(bird1,d:end),nsymbols,tau);
                                    temp_surr_ce=[temp_surr_ce;temp];
                                end
                            end
                        end
                        true_ce(:,tau_ind)=temp_true_ce;
                        surr_ce(:,tau_ind)=temp_surr_ce;
                    end
                    toc;

                    %%%%%%%%% Statistical test %%%%%%%%%%%%%%%%%%%

                    for tau1=1:tau_max-1
                        tau2=tau1+1;

                        true_ce_mean=mean(true_ce,1);
                        if true_ce_mean(tau1)>true_ce_mean(tau2)
                            diff_true_ce=true_ce_mean(tau1)-true_ce_mean(tau2);
                            diff_sur_ce=surr_ce(:,tau1)-surr_ce(:,tau2);
                        else
                            diff_true_ce=true_ce_mean(tau2)-true_ce_mean(tau1);
                            diff_sur_ce=surr_ce(:,tau2)-surr_ce(:,tau1);
                        end

                        mdi= diff_sur_ce;     % surro data set %
                        cb=0.95;              % confidence level%
                        %cb1=0.05;
                        ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
                        smd=sort(mdi,'ascend');
                        d_cut=smd(find(ce<=cb,1,'last'));

                        curr_pass_or_fail=1;                   %%%% assume that curr_pass_or_fail=1 means significant
                        all_pr(noise_ind,coup_ind,tau1)=d_cut;
                        pass_or_fail(noise_ind,coup_ind,tau1) = curr_pass_or_fail & (diff_true_ce > d_cut);
                    end
                    true_data{noise_ind,coup_ind}=true_ce;
                    surr_data{noise_ind,coup_ind}=surr_ce;
                end
            end

            save(['data_te/cmt_data_stat_test_bird_',num2str(bird1),'_',num2str(bird2),...
                '.mat'],'true_data','surr_data','all_pr','pass_or_fail')
        end
    end

end


end


