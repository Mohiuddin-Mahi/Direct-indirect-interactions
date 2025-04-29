
clc
close all
clear;

font=23;

c1=2;
c2=4;
c3=6;

% % c1=7;
% % c2=9;
% % c3=11;

max_tau=10;
tau_array=1:max_tau;

load('data_te/data_birds_1_2.mat','tran_ent','tran_ent_new')
tran_ent_xy=tran_ent;
tran_ent_new_xy=tran_ent_new;

%%%%%%%%%%%%% TE and modified TE Figure %%%%%%%%%%%%%%%%
fig=figure('papersize',[48.4 13.70]); 
ax1=axes('position',[0.08 0.32 0.25 0.4]); 
bx1=axes('position',[0.40 0.32 0.25 0.4]);
cx1=axes('position',[0.71 0.32 0.25 0.4]);

set(fig,'currentaxes',ax1);
plot(tau_array(1:9),mean(tran_ent_xy{c1,c1}(:,1:9),1),':+','LineWidth',2.5)
hold on
plot(tau_array(1:9),mean(tran_ent_xy{c2,c2}(:,1:9),1),':o','LineWidth',2.5)
plot(tau_array(1:9),mean(tran_ent_xy{c3,c3}(:,1:9),1),':*','LineWidth',2.5)
xlabel('Time delay ${(\tau)}$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Y}$','interpreter','latex')
title('(a)','interpreter','latex')
legend('$p,p_1=0.15$','$p,p_1=0.25$','$p,p_1=0.35$',...
    'location','northeast','interpreter','latex')
xlim([1 9])
xticks([1 2 3 4 5 6 7 8 9 10])
xticklabels({'1','2','3','4','5','6','7','8','9','10'})
% ylim([0 0.15])
% yticks([0 0.05 0.10 0.15])
% yticklabels({'0','0.05','0.10','0.15'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

set(fig,'currentaxes',bx1);
plot(tau_array(1:9),mean(tran_ent_new_xy{c1,c1}(:,1:9),1),'-+','LineWidth',2.5)
hold on
plot(tau_array(1:9),mean(tran_ent_new_xy{c2,c2}(:,1:9),1),'-o','LineWidth',2.5)
plot(tau_array(1:9),mean(tran_ent_new_xy{c3,c3}(:,1:9),1),'-*','LineWidth',2.5)
xlabel('Time delay ${(\tau)}$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
title('(b)','interpreter','latex')
legend('$p,p_1=0.15$','$p,p_1=0.25$','$p,p_1=0.35$',...
    'location','northeast','interpreter','latex')
xlim([1 9])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
% ylim([0 0.15])
% yticks([0 0.05 0.10 0.15])
% yticklabels({'0','0.05','0.10','0.15'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


%%%%%%%%%%%%%%% Conditional entropy figure %%%%%%%
c1_array=linspace(0.1,1,19);
coup_array=linspace(0.1,1,19);

load('data_cond_ent/cond_ent_bird_1_2.mat','cond_entropy1','cond_entropy2',...
    'cond_entropy1_new','cond_entropy2_new')

cond_ent1=cell(1,length(coup_array));
cond_ent2=cell(1,length(coup_array));
cond_ent1_new=cell(1,length(coup_array));
cond_ent2_new=cell(1,length(coup_array));

for coup_ind=1:length(coup_array)
    for c1_ind=1:length(c1_array)

        cond_ent1{coup_ind}(c1_ind,:)=mean(cond_entropy1{c1_ind,coup_ind},1);
        cond_ent2{coup_ind}(c1_ind,:)=mean(cond_entropy2{c1_ind,coup_ind},1);
        cond_ent1_new{coup_ind}(c1_ind,:)=mean(cond_entropy1_new{c1_ind,coup_ind},1);
        cond_ent2_new{coup_ind}(c1_ind,:)=mean(cond_entropy2_new{c1_ind,coup_ind},1);

    end
end

set(fig,'currentaxes',cx1);
h1 = plot(tau_array,cond_ent1_new{coup_ind}(c1,:),'-+', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410]);
hold on
h2 = plot(tau_array,cond_ent1_new{coup_ind}(c2,:), '-o','LineWidth',2.5, 'Color', [0.8500 0.3250 0.0980]);
h3 = plot(tau_array,cond_ent1_new{coup_ind}(c3,:),'-*', 'LineWidth',2.5, 'Color', [0.9290 0.6940 0.1250]);
h4 = plot(tau_array,cond_ent1{coup_ind}(c1,:),':+', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410]);
h5 = plot(tau_array,cond_ent1{coup_ind}(c2,:), ':o','LineWidth',2.5, 'Color', [0.8500 0.3250 0.0980]);
h6 = plot(tau_array,cond_ent1{coup_ind}(c3,:),':*', 'LineWidth',2.5, 'Color', [0.9290 0.6940 0.1250]);
xlabel('Time delay $(\tau)$', 'Interpreter', 'latex', 'FontSize', 23);
title('(c)','interpreter','latex')
xlim([1 9])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6', '7','8','9'})
ylim([0 1])
% yticks([0 0.25 0.50 0.75 1.0])
% yticklabels({'0','0.25','0.50','0.75','1.0'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');
ylabel('$H(Y_{t+\tau}|Y_t)~\&~H(Y_{t+\tau}|Y_{t+\tau-1})$', 'Interpreter', 'latex', 'FontSize', 20);

%%5 First legend for upper bound of MT %%%
leg1 = legend([h1, h2, h3], {'$H(Y_{t+\tau}|Y_{t+\tau-1})$: $p,p_1=0.15$', '$H(Y_{t+\tau}|Y_{t+\tau-1})$: $p,p_1=0.25$', '$H(Y_{t+\tau}|Y_{t+\tau-1})$: $p,p_1=0.35$'}, ...
              'Location', 'southeast', 'Interpreter', 'latex', 'FontSize', 16);
set(leg1, 'Box', 'off'); % Remove box to make it look cleaner

ax2 = axes('Position', get(gca, 'Position'), 'Color', 'none', 'XTick', [], 'YTick', [], 'XColor', 'none', 'YColor', 'none');

%%% Second legend for upper bound of TE %%%
leg2 = legend(ax2, [h4, h5, h6], {'$H(Y_{t+\tau}|Y_t),$', '$H(Y_{t+\tau}|Y_t),$', '$H(Y_{t+\tau}|Y_t),$'}, ...
              'Location', 'southwest', 'Interpreter', 'latex', 'FontSize', 16);
set(leg2, 'Box', 'off'); % Remove box for a clean look

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
