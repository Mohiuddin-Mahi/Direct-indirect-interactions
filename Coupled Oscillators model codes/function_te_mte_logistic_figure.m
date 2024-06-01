

function function_te_mte_logistic_figure(font,chaos_ind,coup_min,coup_max,num_coup,tau_max)

nbird=3;
tau_array=1:tau_max;
coup_array=linspace(coup_min,coup_max,num_coup);

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2
            load(['data_te/data_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'tran_ent','tran_ent_new')

            if ind1==1 && ind2==2
                tran_ent_xy=tran_ent;
                tran_ent_new_xy=tran_ent_new;
            elseif ind1==1 && ind2==3
                tran_ent_xz=tran_ent;
                tran_ent_new_xz=tran_ent_new;
            elseif ind1==2 && ind2==3
                tran_ent_yz=tran_ent;
                tran_ent_new_yz=tran_ent_new;
            end

        end

    end
end

%%%%%% modified TE Figures %%%%

figure
for tau_ind=1:length(tau_array)
    plot(coup_array,tran_ent_new_xy{tau_ind}(chaos_ind,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.08 0.16 0.24 0.32 0.4])
xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
ylim([0 2])
yticks([0 0.4 0.8 1.2 1.6 2])
yticklabels({'0','0.4','0.8','1.2','1.6','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:length(tau_array)
    plot(coup_array,tran_ent_new_yz{tau_ind}(chaos_ind,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
ylabel('$MT_{Y\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.08 0.16 0.24 0.32 0.4])
xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
ylim([0 2])
yticks([0 0.4 0.8 1.2 1.6 2])
yticklabels({'0','0.4','0.8','1.2','1.6','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:length(tau_array)
    plot(coup_array,tran_ent_new_xz{tau_ind}(chaos_ind,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.08 0.16 0.24 0.32 0.4])
xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
% ylim([0 2])
% yticks([0 0.4 0.8 1.2 1.6 2])
% yticklabels({'0','0.4','0.8','1.2','1.6','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');




% % %%% TE Figures %%%%%
% % 
% % figure
% % for tau_ind=1:length(tau_array)
% %     plot(coup_array,tran_ent_xy{tau_ind}(chaos_ind,:),'LineWidth',1.5)
% %     hold on
% % end
% % xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
% % ylabel('$T_{X\rightarrow Y}$','interpreter','latex')
% % legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
% % xlim([coup_min coup_max])
% % xticks([0 0.08 0.16 0.24 0.32 0.4])
% % xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
% % ylim([0 2])
% % yticks([0 0.4 0.8 1.2 1.6 2])
% % yticklabels({'0','0.4','0.8','1.2','1.6','2'})
% % set(gca,FontSize=font);
% % set(gca,'TickLabelInterpreter','latex');
% % 
% % 
% % figure
% % for tau_ind=1:length(tau_array)
% %     plot(coup_array,tran_ent_yz{tau_ind}(chaos_ind,:),'LineWidth',1.5)
% %     hold on
% % end
% % xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
% % ylabel('$T_{Y\rightarrow Z}$','interpreter','latex')
% % legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
% % xlim([coup_min coup_max])
% % xticks([0 0.08 0.16 0.24 0.32 0.4])
% % xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
% % ylim([0 2])
% % yticks([0 0.4 0.8 1.2 1.6 2])
% % yticklabels({'0','0.4','0.8','1.2','1.6','2'})
% % set(gca,FontSize=font);
% % set(gca,'TickLabelInterpreter','latex');
% % 
% % 
% % figure
% % for tau_ind=1:length(tau_array)
% %     plot(coup_array,tran_ent_xz{tau_ind}(chaos_ind,:),'LineWidth',1.5)
% %     hold on
% % end
% % xlabel('Coupling strength $(\epsilon)$ ','interpreter','latex')
% % ylabel('$T_{X\rightarrow Z}$','interpreter','latex')
% % legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
% % xlim([coup_min coup_max])
% % xticks([0 0.08 0.16 0.24 0.32 0.4])
% % xticklabels({'0','0.08','0.16','0.24','0.32','0.4'})
% % ylim([0 2])
% % yticks([0 0.4 0.8 1.2 1.6 2])
% % yticklabels({'0','0.4','0.8','1.2','1.6','2'})
% % set(gca,FontSize=font);
% % set(gca,'TickLabelInterpreter','latex');

end
