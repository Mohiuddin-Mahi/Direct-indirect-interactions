


function function_mte_figure_vs_time_delay_line_plot(font,bird1,bird2,noise_ind,coup_ind,tau_max)

tau_array=1:tau_max;
load(['data_te/data_r3_box10_birds_',num2str(bird1),'_',num2str(bird2),'.mat'],'tran_ent_new')

if bird1==1 && bird2==2

    for tau_ind=1:tau_max
        te(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
    end
    figure
    plot(tau_array',te,'LineWidth',2)
    xlabel('Time delay $({\tau})$ ','interpreter','latex')
    ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
    xlim([1 4])
    xticks([1 2 3 4])
    xticklabels({'1','2','3','4'})
    % % ylim([0 1.2])
    % % yticks([0 0.5 1.0 1.5 2])
    % % yticklabels({'0','0.5','1','1.5','2'})
    set(gca,FontSize=font);
    set(gca,'TickLabelInterpreter','latex');
elseif bird1==1 && bird2==3
    for tau_ind=1:tau_max
        te(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
    end
    figure
    plot(tau_array',te,'LineWidth',2)
    xlabel('Time delay $({\tau})$ ','interpreter','latex')
    ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
    xlim([1 4])
    xticks([1 2 3 4])
    xticklabels({'1','2','3','4'})
    % % ylim([0 1.2])
    % % yticks([0 0.5 1.0 1.5 2])
    % % yticklabels({'0','0.5','1','1.5','2'})
    set(gca,FontSize=font);
    set(gca,'TickLabelInterpreter','latex');
elseif bird1==2 && bird2==3
    for tau_ind=1:tau_max
        te(tau_ind)=tran_ent_new{tau_ind}(noise_ind,coup_ind);
    end
    figure
    plot(tau_array',te,'LineWidth',2)
    xlabel('Time delay $({\tau})$ ','interpreter','latex')
    ylabel('$MT_{Y\rightarrow Z}$','interpreter','latex')
    xlim([1 4])
    xticks([1 2 3 4])
    xticklabels({'1','2','3','4'})
    % % ylim([0 1.2])
    % % yticks([0 0.5 1.0 1.5 2])
    % % yticklabels({'0','0.5','1','1.5','2'})
    set(gca,FontSize=font);
    set(gca,'TickLabelInterpreter','latex');
end
end