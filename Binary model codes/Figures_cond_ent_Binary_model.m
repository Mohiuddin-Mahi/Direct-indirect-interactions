

function Figures_cond_ent_Binary_model(font)

bird1=1;
bird2=2;
num_c1=19;
max_tau=10;
num_coupling=19;
tau_array=1:max_tau;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coupling);

load(['data_cond_ent/cond_ent_bird_',num2str(bird1),'_',num2str(bird2),'.mat'])

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

%%%%%%%%%%%%%%%% Figure %%%%%%%%%%%%%%%%%


c1_ind=3;
coup_ind=3;

figure

plot(tau_array,cond_ent1{coup_ind}(c1_ind,:),'-k*')
hold on
plot(tau_array,cond_ent1_new{coup_ind}(c1_ind,:),'-k*', 'LineWidth',2.5)
xlabel('Time delay $(\tau)$ ','interpreter','latex')
ylabel('$H(.|.)$','interpreter','latex')
legend('$H(Y_{t+\tau}|Y_t) ; c1=c=0.2$','$H(Y_{t+\tau}|Y_{t+\tau-1}) ; c1=c=0.2$',...
    'location','best','interpreter','latex')
xlim([1 10])
xticks([1 2 3 4 5 6 7 8 9 10])
xticklabels({'1','2','3','4','5','6', '7','8','9','10'})
ylim([0 1])
% yticks([0 0.5 1.0 1.5 2])
% yticklabels({'0','0.5','1','1.5','2'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


end
