

clc
close all
clear;

font=23;
noise_min=0.3927;
coup_min=0;
coup_max=2;

noise=3;
tau_max=4;
num_coup=11;

%%%%%%%%%%%% TE & modified TE Figures %%%%%

function_te_mte_figure(font,noise,tau_max,coup_min,coup_max,num_coup)

%%%%%%%%% Heatmap Figures without considering statistical significant subsequent differences %%%%%%%%

function_heatmap_figure_by_cycle_sort(font,coup_min,coup_max,num_coup,noise_min)

%%%  heatmap with statistical test %%%%%%%%%%

function_heatmap_mte_with_stat_test_vm_by_cycle_sort(font,coup_min,coup_max,num_coup,noise_min)

% % %%%%%%% Histogram of statistical test %%%%%


bird1=1;
bird2=3;
tau1=3;
tau2=4;

coup_ind=3;

noise_ind1=3;    %%% for eta=pi/2
noise_ind2=11;    %%% for eta=2pi

function_histogram_statistical_test_vm_udoy(font,noise_ind1,noise_ind2,coup_ind,tau1,tau2,bird1,bird2)

%%%%%%%%%% TE figure vs time delay %%%%%%

function_mte_figure_vs_time_delay_line_plot(font,tau_max)


