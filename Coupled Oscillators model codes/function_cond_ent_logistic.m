
function function_cond_ent_logistic(tmax,num_trail,num_chaos,num_coup,nsymbols,coup_min,coup_max,chaos_min,chaos_max)


nbird=3;
d=round((5*tmax)/100);
coup_array=linspace(coup_min,coup_max,num_coup);
chaos_array=linspace(chaos_min,chaos_max,num_chaos);

cond_entropy=cell(1,length(chaos_array));

for bird1=1:nbird
    for bird2=1:nbird
        if bird1<bird2

            for chaos_ind=1:length(chaos_array)
                temp=zeros(length(coup_array),num_trail);
                for coup_ind=1:length(coup_array)
                    load(['symbols_strength_upto_1/symbols_chaos_',num2str(chaos_ind),...
                        '_coup_',num2str(coup_ind),'.mat'],'symbols');
                    tic;
                    parfor trail_ind=1:num_trail
                        [cond_ent]=conditional_entropy_function(symbols{trail_ind}(bird2,d:end),...
                            symbols{trail_ind}(bird1,d:end),nsymbols);
                        temp(coup_ind,trail_ind) =cond_ent;
                    end
                    toc;
                end
                cond_entropy{chaos_ind} =temp;
            end
            save(['data_cond_ent/cond_ent_bird_',num2str(bird1),'_',num2str(bird2),'.mat'],'cond_entropy')

        end
    end
end
