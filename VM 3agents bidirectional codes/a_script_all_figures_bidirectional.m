

clc
close all
clear;

font=23;              %% text fontsize in figures

noise1=3;             %% noise1=3 is 0.5pi
noise2=4;             %% noise2=4 is 0.7pi
noise3=5;             %% noise3=5 is 0.9pi
coup_strength1=3;     %% coup_strength=8 is 0.3
coup_strength2=8;     %% coup_strength=8 is 0.8


%%%%%%%%%%% Conditional entropy Figure %%%%%%%
font1=20;
function_condtional_entropy_Figure(font1,noise1,noise2,noise3,coup_strength1,coup_strength2)

%%%%%%%%%%% TE and MT heatmap without statistical test %%%%%%

function_TE_MT_heatmap_without_stat_test(font)

%%%%%%%%% Heatmap Figures with statistical test of subsequent differences %%%%%%%%

function_TE_MT_heatmap_including_stat_test(font)

%%%%%%%%%% Complete %%%%%%%%%%%%%%%%%%%%%%%%
