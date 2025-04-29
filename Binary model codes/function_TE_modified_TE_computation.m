
function function_TE_modified_TE_computation()

clc
close all
clear;

nbird=2;
num_c1=19;
max_tau=10;
nsymbols=2;
num_trail=20;
num_coupling=19;
tau_array=1:max_tau;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coupling);

for bird1=1:nbird
    for bird2=1:nbird
        if (bird1~=bird2)

            tran_ent=cell(length(c1_array),length(coup_array));
            tran_ent_new=cell(length(c1_array),length(coup_array));

            for c1_ind=1:length(c1_array)
                for coup_ind=1:length(coup_array)
                    load(['symbols/symbols_c1_',num2str(c1_ind),'_coup_',...
                        num2str(coup_ind),'.mat'],'symbols');

                    temp=zeros(num_trail,length(tau_array));
                    temp_new=zeros(num_trail,length(tau_array));
                    for tau_ind=1:length(tau_array)
                        tau=tau_array(tau_ind);
                        tic;
                        parfor trail_ind=1:num_trail
                            temp(trail_ind,tau_ind)=tran_ent_func_mohi(symbols{trail_ind}(bird2,:),...
                                symbols{trail_ind}(bird1,:),nsymbols,tau);

                            temp_new(trail_ind,tau_ind)=tran_ent_func_mohi_new(symbols{trail_ind}(bird2,:),...
                                symbols{trail_ind}(bird1,:),nsymbols,tau);
                        end
                        tran_ent{c1_ind,coup_ind}=temp;
                        tran_ent_new{c1_ind,coup_ind}=temp_new;
                        toc;
                    end
                end

            end
            save(['data_te/data_birds_',num2str(bird1),'_',num2str(bird2),'.mat'],'tran_ent','tran_ent_new')
        end
    end
end

end