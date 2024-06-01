

function function_symbols_logistic(tmax,num_trail,num_chaos,num_coup,nsymbols,coup_min,coup_max,chaos_min,chaos_max)

nbird=3;
coupling_term=1;
coup_array=linspace(coup_min,coup_max,num_coup);
chaos_array=linspace(chaos_min,chaos_max,num_chaos);

%%%%%% Coupling strength matrix%%%%%%%%%

cmatrix=eye(nbird,nbird);
cmatrix(2,1)=coupling_term;           %%%% since z(b1) is coupling with y(b2)
cmatrix(3,2)=coupling_term;           %%%% since y(b2) is coupling with x(b3)
cmat=cmatrix;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for chaos_ind=1:length(chaos_array)
    a=chaos_array(chaos_ind);

    for coup_ind=1:length(coup_array)
        epi=coup_array(coup_ind);

        tic;
        symbols=cell(1,num_trail);
        symbols_real=cell(1,num_trail);
        parfor trail_ind=1:num_trail
            time_series_out=logistic_mapping_function(a,epi,cmat,nbird,tmax);
            symbols_real{trail_ind}=time_series_out;
            symbols{trail_ind}=discretization_logistic_map_function(time_series_out,nsymbols);
        end
        toc;
        save(['symbols/symbols_chaos_',num2str(chaos_ind),'_coup_',num2str(coup_ind)],'symbols','symbols_real')
    end
end

end

