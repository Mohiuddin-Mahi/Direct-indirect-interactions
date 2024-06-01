
clc
close all
clear;

tmax=1e6;
tau_max=4;
coup_min=0;
coup_max=0.4;
nsymbols=16;
num_coup=11;
num_chaos=11;
num_trail=20;
chaos_max=4;
chaos_min=3.57;


%%%%%%%%%%%%%%%%%% Generation of Data %%%%%%%%%%%%%%

function_symbols_logistic(tmax,num_trail,num_chaos,num_coup,nsymbols,coup_min,coup_max,chaos_min,chaos_max)

%%%%%%%%%%%%%%%%%% TE and modified TE computation %%%%%%%%%%%%%%

function_tran_ent_logistic(tmax,num_trail,num_chaos,num_coup,nsymbols,coup_min,coup_max,chaos_min,chaos_max,tau_max)


%%%%%%%% Cond_ent_strength_upto_1 %%%%%%

coup_max1=1;
num_chaos1=21;
num_coup1=21;
function_cond_ent_logistic(tmax,num_trail,num_chaos1,num_coup1,nsymbols,coup_min,coup_max1,chaos_min,chaos_max)


