
clc
close all
clear;

font=23;
tau_max=4;
num_trail=20;
nsymbols=16;
coup_min=0;
coup_max=0.4;
num_coup=11;
num_chaos=11;
chaos_ind=11;

%%%% TE and modified TE figures %%%%%%%%%%

function_te_mte_logistic_figure(font,chaos_ind,coup_min,coup_max,num_coup,tau_max)

%%%%%%%%%%%% Cond_ent strength upto 1 and timeseries %%%%%%%%
coup_max1=1;
num_coup1=21;
chaos_ind1=21;
function_cond_ent_timseries_figure_logistic(font,chaos_ind1,coup_min,coup_max1,num_coup1)




