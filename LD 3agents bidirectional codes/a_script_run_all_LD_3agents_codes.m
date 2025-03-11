
%%%% Firstly, one has to generate time series data of agents by running the python code. Then, need to upload those data in the py_data folder in Matlab and run the rest of the codes
%%% Input parameters %%%
clc
close all
clear;

dt=0.1;            %%% Simulation time step
num_tau=10;        %%% time delay for MT estimation

tmax=1e7;          %%% time length of simulation

kT_min=0.2;        %%% minimum thermal energy
kT_max=3.8;        %%% maximum thermal energy

num_kT=10;         %%% number of interval in thermal energy
num_gamma=10;      %%% number of interval in friction coefficient
epi=5;             %%% value of potential well depth
num_grids=4;       %%% number of interval in v=(vx,vy) discretization
num_trail=20;      %%% number of simulation trail
nparticles=3;      %%% number of agents
num_symbols=16;
num_autocorr_tau=50;   %%% time lag in autocorrelation estimation
gamma_array=linspace(0.2,2,num_gamma);            %%% friction coefficient interval


%%%%%%%%%%%%% Autocorrelation estimation from python data %%%%%%%%%%%

function_autocorr_new(epi,dt,num_trail,num_kT,nparticles,num_autocorr_tau,tmax,num_gamma)

%%%%%%%%%%%%% Fitting ACF with a curve %%%%%%%%%%%

function_autocorr_data_fitting_new(epi,dt,num_trail,num_kT,num_gamma)

%%%%%%%%%%%%% Resample the original trajectories based average time delay %%%%%%%%%%%

py_data_resample_aver_tc_fitted_new(epi,dt,num_trail,num_kT,num_gamma,tmax)

%%%%%%%%%%%%% Discretization of resampled data %%%%%%%%%%%

discretize_resample_data_aver_tc_fitted_ACF(epi,dt,num_trail,num_kT,num_grids,num_gamma)

%%%%%%%%%%%%% TE and MT estimation varying time delay %%%%%%%%%%%

transfer_entropy_fitted_ACF_aver_new(epi,dt,num_trail,num_kT,nparticles,num_gamma,num_symbols,num_tau)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% Monotonicity test of TE and MT values over time delay %%%%%%%%%%%%%%%%%%%%%

tau_max1=4;
function_monotonic_test_LD_ACF_aver_fitted(epi,dt,nparticles,num_kT,num_gamma,tau_max1,num_trail)

%%%%%%%%%%%%%%%%%%%%% Statistical test of MT %%%%%%%%%%%%%%%%%%%%%

tau_max2=4;
stat_test_true_surr_data_modified_te(epi,dt,num_trail,num_kT,nparticles,num_gamma,...
    num_symbols,tau_max2)

%%%%% Statistical test results of MT %%%%%%%

tau_max3=4;
alpha=0.05;
results_statistical_test_modified_te(alpha,num_kT,nparticles,num_gamma,tau_max3)

%%%%%%%%%%%%%%%%%%%%% Statistical test of TE %%%%%%%%%%%%%%%%%%%%%

tau_max2=4;
stat_test_true_surr_data_standard_te(epi,dt,num_trail,num_kT,nparticles,num_gamma,...
    num_symbols,tau_max2)

%%%%% Statistical test results of TE %%%%%%%

tau_max3=4;
alpha=0.05;
results_statistical_test_standard_te(alpha,num_kT,nparticles,num_gamma,tau_max3)

%%%%%%%%% Conditional entropy computation %%%%%%%%%%%%%

function_conditional_entropy_computation(epi,dt,num_trail,num_kT,nparticles,num_gamma,num_symbols,num_tau)

%%%%%%%%%%% Complete %%%%%%%%%%%%%%%%%%%%%%%%




