

tau_max=4;

r=3;
dt=1;
vs=0.03;
lbox=10;
nbird=3;
tmax=2e6;
nsymbols=6;
num_trail=20;
num_noise=11;
coup_min=0;
coup_max=2;
d=round((5*tmax)/100);    %% 5% of time length
num_coupling=11;
noise_min=0.3927;

%%%% simulate data %%%%

function_symbols_vm(tmax,r,dt,vs,lbox,nbird,nsymbols,num_trail,num_noise,num_coupling,coup_min,coup_max,noise_min)

%%%% Compute TE and modified TE %%%%%%

function_tran_ent_computation_vm(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

%%%% Significance test %%%%%

function_significance_test_vm_udoy(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

%%% Monotonicity test %%%%%%

function_monotonicity_test_vm_by_cycle_sort(nbird,num_noise,num_coupling,tau_max)

