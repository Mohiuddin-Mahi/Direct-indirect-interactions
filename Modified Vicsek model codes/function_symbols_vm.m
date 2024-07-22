
function function_symbols_vm(tmax,r,dt,vs,lbox,nbird,nsymbols,num_trail,num_noise,num_coupling,coup_min,coup_max,noise_min)

noise_array=linspace(noise_min,2*pi,num_noise);
coup_array=linspace(coup_min,coup_max,num_coupling);

%%%%%%%%%%%%%%%%%%%%%%%%

for coup_ind=1:length(coup_array)
    
    wmatrix=eye(nbird);
    wmatrix(2,1)=coup_array(coup_ind);
    wmatrix(3,2)=coup_array(coup_ind);
    wmat=wmatrix;

    for noise_ind=1:length(noise_array)
        eta=noise_array(noise_ind);
        tic;
        parfor trail_ind=1:num_trail
            [theta_out,~,~] = modified_VM_multi_updated(lbox,vs,dt,r,eta,nbird,tmax,wmat);
            symbols{trail_ind}=get_symbol_strings(theta_out,nsymbols);
        end
       save(['symbols/symbols_r3_box10_coup_',num2str(coup_ind),'_noise_',num2str(noise_ind)],'symbols')
        toc;
    end
end

end

