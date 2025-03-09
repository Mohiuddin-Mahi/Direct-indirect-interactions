

function Figure_TE_MT_LD(font)

g_ind1=2;       %%% g_ind=2 is friction coefficient gamma=0.4
g_ind2=2;
g_ind3=2;

kT_ind1=3;     %%% kT_ind1=3 is Thermal energy kBT=1.0
kT_ind2=4;     %%% kT_ind2=4 is Thermal energy kBT=1.4
kT_ind3=5;     %%% kT_ind1=5 is Thermal energy kBT=1.8

epi=5;
dt=0.1;
num_tau=9;
nparticles=3;
tau_array=1:num_tau;
% g_array=linspace(0.2,2,10);
kT_array=linspace(0.2,3.8,10);


%%%%% Figure TE and MT %%%%%%%%%

for part1=1:nparticles
    for part2=1:nparticles
        if part1<part2
            load(['data_te/te_mt_l_10_epi_',num2str(epi),'_dt_',num2str(dt),...
                '_part_',num2str(part1),'_',num2str(part2),'.mat'],...
                'tran_ent','tran_ent_new')
            if part1==1 && part2==2
                tr_ent_xy=tran_ent;
                tr_ent_new_xy=tran_ent_new;
            elseif part1==1 && part2==3
                tr_ent_xz=tran_ent;
                tr_ent_new_xz=tran_ent_new;
            elseif part1==2 && part2==3
                tr_ent_yz=tran_ent;
                tr_ent_new_yz=tran_ent_new;
            end

        end
    end
end

fig=figure('papersize',[41.0 22.5]);
ax1=axes('position',[0.152 0.605 0.2 0.29]);
bx1=axes('position',[0.422 0.605 0.2 0.29]);
cx1=axes('position',[0.690 0.605 0.2 0.29]);

dx1=axes('position',[0.152 0.165 0.2 0.29]);
ex1=axes('position',[0.422 0.165 0.2 0.29]);
fx1=axes('position',[0.690 0.165 0.2 0.29]);

set(fig,'currentaxes',ax1);
plot(tau_array,mean(tr_ent_xy{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_xy{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_xy{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Y}$','interpreter','latex')
title('($\mathbf{a}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.1])
yticks([0 0.02 0.04 0.06 0.08 0.10])
yticklabels({'0','0.02','0.04','0.06','0.08' ,'0.10'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',bx1);
plot(tau_array,mean(tr_ent_yz{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_yz{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_yz{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{Y\rightarrow Z}$','interpreter','latex')
title('($\mathbf{b}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.1])
yticks([0 0.02 0.04 0.06 0.08 0.10])
yticklabels({'0','0.02','0.04','0.06','0.08' ,'0.10'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',cx1);
plot(tau_array,mean(tr_ent_xz{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_xz{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_xz{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{c}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.04])
yticks([0 0.01 0.02 0.03 0.04])
yticklabels({'0','0.01','0.02','0.03','0.04'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


set(fig,'currentaxes',dx1);
plot(tau_array,mean(tr_ent_new_xy{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_new_xy{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_new_xy{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
title('($\mathbf{d}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.1])
yticks([0 0.02 0.04 0.06 0.08 0.10])
yticklabels({'0','0.02','0.04','0.06','0.08' ,'0.10'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',ex1);
plot(tau_array,mean(tr_ent_new_yz{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_new_yz{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_new_yz{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{Y\rightarrow Z}$','interpreter','latex')
title('($\mathbf{e}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.1])
yticks([0 0.02 0.04 0.06 0.08 0.10])
yticklabels({'0','0.02','0.04','0.06','0.08' ,'0.10'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',fx1);
plot(tau_array,mean(tr_ent_new_xz{kT_ind1,g_ind1}(:,1:num_tau),1),'LineWidth',2.5)
hold on
plot(tau_array,mean(tr_ent_new_xz{kT_ind2,g_ind2}(:,1:num_tau),1),'LineWidth',2.5)
plot(tau_array,mean(tr_ent_new_xz{kT_ind3,g_ind3}(:,1:num_tau),1),'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{f}$)','interpreter','latex')
legend(strcat('$k_BT$=', num2str(kT_array(kT_ind1)),'.0'),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind2))),...
           strcat(' $k_BT$=', num2str(kT_array(kT_ind3))),...
           'location','northeast','interpreter','latex')

xlim([1 num_tau])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.04])
yticks([0 0.01 0.02 0.03 0.04])
yticklabels({'0','0.01','0.02','0.03','0.04'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');