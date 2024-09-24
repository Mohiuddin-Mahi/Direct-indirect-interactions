
function function_mte_figure_vs_time_delay_line_plot(font,tau_max)

tau_array=1:tau_max;
load('data_te/data_r3_box10_birds_1_3.mat','tran_ent_new')

%%%%%%%%%%%%% Figures %%%%%%%%%%%%%%%%%%

fig=figure('papersize',[29 23.7]); 
ax1=axes('position',[0.28 0.6 0.22 0.32]); % [x corr y corr width hight]
bx1=axes('position',[0.56 0.6 0.22 0.32]);
cx1=axes('position',[0.28 0.12 0.22 0.32]);
dx1=axes('position',[0.56 0.12 0.22 0.32]);


for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(11,1);
end
set(fig,'currentaxes',ax1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay $({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('(a)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 0$(Red color in Fig.5)','location','northwest','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(11,2);
end
set(fig,'currentaxes',bx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay $({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('(b)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 2$(Orange color in Fig.5)','location','northwest','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(3,7);
end
set(fig,'currentaxes',cx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay $({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('(c)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 3$(Yellow color in Fig.5)','location','northwest','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
% % ylim([0 1.2])
% % yticks([0 0.5 1.0 1.5 2])
% % yticklabels({'0','0.5','1','1.5','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(3,3);
end
set(fig,'currentaxes',dx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay $({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('(d)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 4$(Green color in Fig.5)','location','northwest','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
% % ylim([0 1.2])
% % yticks([0 0.5 1.0 1.5 2])
% % yticklabels({'0','0.5','1','1.5','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


end
