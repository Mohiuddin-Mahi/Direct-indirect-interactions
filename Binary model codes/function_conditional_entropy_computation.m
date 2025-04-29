

function function_conditional_entropy_computation()


clc
close all
clear;

nbird=2;
max_tau=10;
nsymbols=2;
num_trail=10;
num_c1=19;
num_coupling=19;
tau_array=1:max_tau;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coupling);

entropy1=cell(length(c1_array),length(coup_array));
entropy2=cell(length(c1_array),length(coup_array));
cond_entropy1=cell(length(c1_array),length(coup_array));
cond_entropy2=cell(length(c1_array),length(coup_array));
cond_entropy1_new=cell(length(c1_array),length(coup_array));
cond_entropy2_new=cell(length(c1_array),length(coup_array));

for bird1=1:nbird
    for bird2=1:nbird
        if bird1<bird2

            for c1_ind=1:length(c1_array)
                for coup_ind=1:length(coup_array)
                    load(['symbols/symbols_c1_',num2str(c1_ind),'_coup_',...
                        num2str(coup_ind),'.mat'],'symbols');

                    tic;
                    for tau_ind=1:length(tau_array)
                        tau=tau_array(tau_ind);
                        parfor trail_ind=1:num_trail
                            [ent1,ent2,cond_ent1,cond_ent2]=ent_cond_ent_function2(symbols{trail_ind}(bird2,:),...
                                symbols{trail_ind}(bird1,:),nsymbols,tau);
                            [cond_ent1_new,cond_ent2_new] =cond_ent_function2_new(symbols{trail_ind}(bird2,:),...
                                symbols{trail_ind}(bird1,:),nsymbols,tau);

                            temp1(trail_ind,tau_ind) =ent1;
                            temp2(trail_ind,tau_ind) =ent2;
                            cond_temp1(trail_ind,tau_ind) =cond_ent1;
                            cond_temp2(trail_ind,tau_ind) =cond_ent2;
                            
                            cond_temp1_new(trail_ind,tau_ind) =cond_ent1_new;
                            cond_temp2_new(trail_ind,tau_ind) =cond_ent2_new;
                        end
                    end
                    entropy1{c1_ind,coup_ind}=temp1;
                    entropy2{c1_ind,coup_ind}=temp2;
                    cond_entropy1{c1_ind,coup_ind}=cond_temp1;
                    cond_entropy2{c1_ind,coup_ind} =cond_temp2;
                    cond_entropy1_new{c1_ind,coup_ind}=cond_temp1_new;
                    cond_entropy2_new{c1_ind,coup_ind}=cond_temp2_new;
                    toc;
                end
            end
            save(['data_cond_ent/cond_ent_bird_',num2str(bird1),'_',num2str(bird2),'.mat'],...
                'entropy1','entropy2','cond_entropy1','cond_entropy2','cond_entropy1_new','cond_entropy2_new')
        end
    end
end

end


