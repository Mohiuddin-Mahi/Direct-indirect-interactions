

function function_Figure_supple_Line_plot(font)

tau_max=4;
tau_array=1:tau_max;

%%%%%%%%%%%%% Figures %%%%%%%%%%%%%%%%%%

fig=figure('papersize',[29 23.7]); 
ax1=axes('position',[0.27 0.6 0.22 0.32]); 
bx1=axes('position',[0.55 0.6 0.22 0.32]);
cx1=axes('position',[0.27 0.12 0.22 0.32]);
dx1=axes('position',[0.55 0.12 0.22 0.32]);

load('data_te/data_r3_box10_birds_1_2.mat','tran_ent_new')
for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(5,3);
end
set(fig,'currentaxes',ax1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay$({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Y}$','interpreter','latex')
title('($\mathbf{a}$)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 0$(Red color)','location','northeast','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


load('data_te/data_r3_box10_birds_1_3.mat','tran_ent_new')
for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(8,3);
end
set(fig,'currentaxes',bx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay$({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{b}$)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 2$(Orange color)','location','northeast','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(5,3);
end
set(fig,'currentaxes',cx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay$({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{c}$)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 3$(Yellow color)','location','northeast','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

for tau_ind=1:tau_max
    te(tau_ind)=tran_ent_new{tau_ind}(3,4);
end
set(fig,'currentaxes',dx1);
plot(tau_array',te,'k','LineWidth',2.5)
xlabel('Time delay$({\tau})$ ','interpreter','latex')
ylabel('$MT_{X\rightarrow Z}$','interpreter','latex')
title('($\mathbf{d}$)','interpreter','latex')
dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
legend(dummyh, '$N_r = 4$(Green color)','location','northeast','interpreter','latex')
legend boxoff
xlim([1 4])
xticks([1 2 3 4])
xticklabels({'1','2','3','4'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

