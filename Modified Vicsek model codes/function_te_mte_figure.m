

function function_te_mte_figure(font,noise,tau_max,coup_min,coup_max,num_coup)

nbird=3;
coup_array=linspace(coup_min,coup_max,num_coup);

for ind1=1:nbird
    for ind2=1:nbird

        if ind1<ind2
            load(['data_te/data_r3_box10_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'tran_ent','tran_ent_new')

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

%%%%%%%%%%%%% Figure %%%%%%%%%%%%%%%%


%%%%%%%%%% transfer entropy figure %%%%%%%%%

figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_xy{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Y}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.35])
yticks([0 0.05 0.10 0.15 0.20 0.25 0.30 0.35])
yticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_yz{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$T_{Y\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.35])
yticks([0 0.05 0.10 0.15 0.20 0.25 0.30 0.35])
yticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_xz{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$T_{X\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.25])
yticks([0 0.05 0.10 0.15 0.20 0.25])
yticklabels({'0','0.05','0.10','0.15','0.20','0.25'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% modified transfer entropy figure %%%%%%%%%%%%%%

figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_new_xy{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.35])
yticks([0 0.05 0.10 0.15 0.20 0.25 0.30 0.35])
yticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_new_yz{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$MT_{Y\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.35])
yticks([0 0.05 0.10 0.15 0.20 0.25 0.30 0.35])
yticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


figure
for tau_ind=1:tau_max
    plot(coup_array,tran_ent_new_xz{tau_ind}(noise,:),'LineWidth',1.5)
    hold on
end
xlabel('Coupling strength $(w)$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
legend('${\tau=1}$','${\tau=2}$','${\tau=3}$','${\tau=4}$','location','northwest','interpreter','latex')
xlim([coup_min coup_max])
xticks([0 0.4 0.8 1.2 1.6 2])
xticklabels({'0','0.4','0.8','1.2','1.6','2'})
ylim([0 0.15])
yticks([0 0.05 0.10 0.15])
yticklabels({'0','0.05','0.10','0.15'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

end
%%%%%%%%%%%%%%%%%%% complete %%%%%%%%%%%%%%%%%%%
