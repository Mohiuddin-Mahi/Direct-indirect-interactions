
function Figures_TE_modified_TE_Binary_model(font)

bird1=1;
bird2=2;
max_tau=10;
tau_array=1:max_tau;

load(['data_te/data_birds_',num2str(bird1),'_',num2str(bird2),'.mat'],'tran_ent','tran_ent_new')
tran_ent_xy=tran_ent;
tran_ent_new_xy=tran_ent_new;

%%%%%%%%%%%%% TE and modified TE Figure %%%%%%%%%%%%%%%%

figure

plot(tau_array,mean(tran_ent_xy{3,3},1),'-k*')
hold on
plot(tau_array,mean(tran_ent_new_xy{3,3},1),'-k*','LineWidth',2.5)
xlabel('Time delay ${(\tau)}$ ','interpreter','latex')
ylabel('Infromation flow','interpreter','latex')
legend('$T_{X\rightarrow Y} ; c_1=c=0.2$','$MT_{X\rightarrow Y} ; c_1=c=0.2$',...
    'location','northeast','interpreter','latex')
xlim([1 10])
xticks([1 2 3 4 5 6 7 8 9 10])
xticklabels({'1','2','3','4','5','6','7','8','9','10'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

end

