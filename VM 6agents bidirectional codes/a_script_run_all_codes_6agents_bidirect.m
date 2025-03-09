

clc
close all
clear;

r=3;               % r refers to the nteraction radius in VM
dt=1;              % dt is interacting time delay     
vs=0.3;            % vs is constant velocity of agents in VM          
lbox=10;           % L is length of simulation box
nbird=6;           % nbird is number of agents in VM
tmax=2e6;          % tmax is simulation time length
nsymbols=6;        % nsymbols is number of bin in discretization
num_trail=20;      % num_trail is number of observation 


tau_max=10;        % tau_max is maximum time delays to compute MT
coup_max=1;        % coup_max is maximum value of coupling strength
coup_min=0.1;      % coup_min is minimum value of coupling strength
num_noise=10;      % num_noise is number of noise interval 
num_coupling=10;   % num_coupling is number of coupling interval
noise_min=pi/10;   % noise_min is minimum value of noise
noise_max=19*pi/10;% noise_max is maximum value of noise

d=round((5*tmax)/100); % d refers to the deletion of initial 5% time steps

%%%%%%% Simulation of time series data of agents using VM %%%%%%%

function_symbols_vm(tmax,r,dt,vs,lbox,nbird,nsymbols,num_trail,num_noise,num_coupling,coup_min,coup_max,...
    noise_min,noise_max)

%%%%%%% Computation of MT of pair of agents over time delay from time sereis data %%%%%%

function_tran_ent_computation_vm(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max)

%%%%%% Monotonicity matric map %%%%%%
tau_max1=4;   % maximum time delay for momonotonicity comparison 
function_monotonicity_test_vm_by_cycle_sort(nbird,num_noise,num_coupling,tau_max1)

%%%%%%%% Statistical test %%%%%%%%%%
tau_max2=4;   % maximum time delay for statistical test
function_stat_test_vm_modified_te(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max2)
function_stat_test_vm_standard_te(d,nbird,nsymbols,num_trail,num_noise,num_coupling,tau_max2)




