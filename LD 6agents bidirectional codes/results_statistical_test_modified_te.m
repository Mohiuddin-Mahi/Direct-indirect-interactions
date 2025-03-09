
function results_statistical_test_modified_te(alpha,num_kT,nparticles,num_gamma,num_tau)

for ind1=1:nparticles
    for ind2=1:nparticles
        if ind1~=ind2

            load(['data_te/mt_data_true_surr_part_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'true_data','surr_data');

            all_pr=zeros(num_kT,num_gamma,num_tau-1);
            pass_or_fail = zeros(num_kT,num_gamma,num_tau-1);

            for kT_ind=1:num_kT
                tic;
                for g_ind=1:num_gamma

                    true_te_mean=mean(true_data{kT_ind,g_ind},1);
                    surr_te=surr_data{kT_ind,g_ind};

                    for tau1=1:num_tau-1
                        tau2=tau1+1;
                        if true_te_mean(tau1)>true_te_mean(tau2)
                            diff_true_te=true_te_mean(tau1)-true_te_mean(tau2);
                            diff_sur_te=surr_te(:,tau1)-surr_te(:,tau2);
                        else
                            diff_true_te=true_te_mean(tau2)-true_te_mean(tau1);
                            diff_sur_te=surr_te(:,tau2)-surr_te(:,tau1);
                        end

                        mdi= diff_sur_te;     % surro data set %
                        cb=1-alpha;           % confidence level%
                        ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
                        smd=sort(mdi,'ascend');
                        d_cut=smd(find(ce<=cb,1,'last'));
                        curr_pass_or_fail=1;                   %%%% assume that curr_pass_or_fail=1 means significant
                        all_pr(kT_ind,g_ind,tau1)=d_cut;
                        pass_or_fail(kT_ind,g_ind,tau1) = curr_pass_or_fail & (diff_true_te > d_cut);
                    end

                end
                toc;
            end
            save(['data_te/mt_results_stat_test_part_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'all_pr','pass_or_fail')
        end
    end
end


end
