
function function_TE_MT_Figure(font,noise1,noise2,noise3,coup_value)

nbird=3;
tau_max=9;
tau_array=1:tau_max;
coup_array=linspace(0.1,1.0,10);
noise_array=linspace(1/10,19/10,10);

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2
            load(['data_te/data_r3_box10_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'tran_ent','tran_ent_new')

            for noise_ind=1:length(noise_array)
                for coup_ind=1:length(coup_array)
                    for tau_ind=1:tau_max
                        if ind1==1 && ind2==2
                            tr_ent_12{noise_ind,coup_ind}(tau_ind)=tran_ent{tau_ind}(noise_ind,coup_ind);
                            tr_ent_new_12{noise_ind,coup_ind}(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
                        elseif ind1==1 && ind2==3
                            tr_ent_13{noise_ind,coup_ind}(tau_ind)=tran_ent{tau_ind}(noise_ind,coup_ind);
                            tr_ent_new_13{noise_ind,coup_ind}(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
                        elseif ind1==2 && ind2==3
                            tr_ent_23{noise_ind,coup_ind}(tau_ind)=tran_ent{tau_ind}(noise_ind,coup_ind);
                            tr_ent_new_23{noise_ind,coup_ind}(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
                        end
                    end
                end

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

%%%%%%%%%%%%%%% TE figures %%%%%%%%%%%%%%

set(fig,'currentaxes',ax1);
plot(tau_array,tr_ent_12{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_12{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_12{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Y}$','interpreter','latex')
title('($\mathbf{a}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')
xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.2])
yticks([0 0.05 0.10 0.15 0.2])
yticklabels({'0','0.05','0.10','0.15','0.20'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


set(fig,'currentaxes',bx1);
plot(tau_array,tr_ent_23{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_23{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_23{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{Y\rightarrow Z}$','interpreter','latex')
title('($\mathbf{b}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')
xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.2])
yticks([0 0.05 0.10 0.15 0.2])
yticklabels({'0','0.05','0.10','0.15','0.20'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


set(fig,'currentaxes',cx1);
plot(tau_array,tr_ent_13{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_13{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_13{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{c}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')
xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.12])
yticks([0 0.03 0.06 0.09 0.12])
yticklabels({'0','0.03','0.06','0.09','0.12'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%% MT figures %%%%%%%%%%%%%%%
set(fig,'currentaxes',dx1);
plot(tau_array,tr_ent_new_12{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_new_12{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_new_12{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
title('($\mathbf{d}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')
xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.16])
yticks([0 0.04 0.08 0.12 0.16])
yticklabels({'0','0.04','0.08','0.12','0.16'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');



set(fig,'currentaxes',ex1);
plot(tau_array,tr_ent_new_23{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_new_23{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_new_23{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{Y\rightarrow Z}$','interpreter','latex')
title('($\mathbf{e}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')

xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.16])
yticks([0 0.04 0.08 0.12 0.16])
yticklabels({'0','0.04','0.08','0.12','0.16'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


set(fig,'currentaxes',fx1);
plot(tau_array,tr_ent_new_13{noise1,coup_value},'LineWidth',2.5)
hold on
plot(tau_array,tr_ent_new_13{noise2,coup_value},'LineWidth',2.5)
plot(tau_array,tr_ent_new_13{noise3,coup_value},'LineWidth',2.5)
xlabel('Time delay$(\tau)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{f}$)','interpreter','latex')
legend(strcat('$\eta$=', num2str(noise_array(noise1)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise2)),'$\pi$'),...
           strcat('$\eta$=', num2str(noise_array(noise3)),'$\pi$'),...
           'location','northeast','interpreter','latex')
xlim([1 tau_max])
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'1','2','3','4','5','6','7','8','9'})
ylim([0 0.04])
yticks([0 0.01 0.02 0.03 0.04])
yticklabels({'0','0.01','0.02','0.03','0.04'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');
