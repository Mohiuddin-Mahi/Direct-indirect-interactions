
function Figures_TE_cond_ent_heatmap_Binary_model(font)

max_tau=10;
tau_array=1:max_tau;

load('data_te/data_birds_1_2.mat','tran_ent','tran_ent_new')
tran_ent_xy=tran_ent;
tran_ent_new_xy=tran_ent_new;

%%%%%%%%%%%%% TE and modified TE Figure %%%%%%%%%%%%%%%%
fig=figure('papersize',[29 24.8]); 
ax1=axes('position',[0.274 0.62 0.22 0.32]); % [x corr y corr width hight]
bx1=axes('position',[0.554 0.62 0.22 0.32]);
cx1=axes('position',[0.274 0.10 0.22 0.32]);
dx1=axes('position',[0.554 0.10 0.22 0.32]);

% fig=figure('papersize',[6.8 2.8]); orient tall %[11.69 6.27];
% ax1=axes('position',[0.21 0.62 0.22 0.32]); % [x corr y corr width hight]
% bx1=axes('position',[0.5 0.62 0.22 0.32]);
% cx1=axes('position',[0.2 0.10 0.22 0.32]);
% dx1=axes('position',[0.5 0.10 0.22 0.32]);

set(fig,'currentaxes',ax1);
plot(tau_array,mean(tran_ent_xy{3,3},1),':k*')
hold on
plot(tau_array,mean(tran_ent_new_xy{3,3},1),'-k*','LineWidth',2.5)
xlabel('Time delay ${(\tau)}$ ','interpreter','latex')
ylabel('Causal influence','interpreter','latex')
title('(a)','interpreter','latex')
legend('$T_{X\rightarrow Y} ; c_1=c=0.2$','$MT_{X\rightarrow Y} ; c_1=c=0.2$',...
    'location','northeast','interpreter','latex')
xlim([1 10])
xticks([1 2 3 4 5 6 7 8 9 10])
xticklabels({'1','2','3','4','5','6','7','8','9','10'})
ylim([0 0.15])
yticks([0 0.05 0.10 0.15])
yticklabels({'0','0.05','0.10','0.15'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


%%%%%%%%%%%%%%% Conditional entropy figure %%%%%%%
num_c1=19;
num_coupling=19;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coupling);

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


c1_ind=3;
coup_ind=3;

set(fig,'currentaxes',bx1);
plot(tau_array,cond_ent1{coup_ind}(c1_ind,:),':k*')
hold on
plot(tau_array,cond_ent1_new{coup_ind}(c1_ind,:),'-k*', 'LineWidth',2.5)
xlabel('Time delay $(\tau)$ ','interpreter','latex')
ylabel('$H(.|.)$','interpreter','latex')
title('(b)','interpreter','latex')
legend('$H(Y_{t+\tau}|Y_t) ; c1=c=0.2$','$H(Y_{t+\tau}|Y_{t+\tau-1}) ; c1=c=0.2$',...
    'location','best','interpreter','latex')
xlim([1 10])
xticks([1 2 3 4 5 6 7 8 9 10])
xticklabels({'1','2','3','4','5','6', '7','8','9','10'})
ylim([0 1])
yticks([0 0.25 0.50 0.75 1.0])
yticklabels({'0','0.25','0.50','0.75','1.0'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% Heatmap %%%%%%%%%%%%%%%%%%

delay=1;
num_c1=19;
num_coup=19;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coup);
load('data_te/data_birds_1_2.mat','tran_ent','tran_ent_new')

for c1_ind=1:length(c1_array)
    for coup_ind=1:length(coup_array)

        if find(mean(tran_ent{c1_ind,coup_ind},1)==max(mean(tran_ent{c1_ind,coup_ind},1)))==delay
            test_data_te(c1_ind,coup_ind)=1;
        else
            test_data_te(c1_ind,coup_ind)=0;
        end

        if find(mean(tran_ent_new{c1_ind,coup_ind},1)==max(mean(tran_ent_new{c1_ind,coup_ind},1)))==delay
            test_data_te_new(c1_ind,coup_ind)=1;
        else
            test_data_te_new(c1_ind,coup_ind)=0;
        end
    end
end

set(fig,'currentaxes',cx1);
h=heatmap(coup_array,c1_array,test_data_te,'CellLabelColor', 'None');
h.XLabel = 'Parameter $c$';
h.YLabel = ('Parameter  $c_1$');
h.Title = {'(c)','$T_{X\rightarrow Y}$'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
h.YDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);

set(fig,'currentaxes',dx1);
h=heatmap(coup_array,c1_array,test_data_te_new,'CellLabelColor', 'None');
h.XLabel =('Parameter $c$');
h.YLabel =('Parameter  $c_1$');
h.Title = {'(d)','$MT_{X\rightarrow Y}$'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
h.YDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);

end



