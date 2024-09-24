
function function_histogram_statistical_test_vm_udoy(font,noise_ind1,noise_ind2,coup_ind,tau1,tau2,bird1,bird2)

load(['data_te/udoy_data_stat_test_bird_',num2str(bird1),'_',num2str(bird2),...
    '.mat'],'true_data','surr_data')

%%%%% Figure %%%%%%%%%%%%%%%%

%%%%%% With Title %%%%%%%%%%%%%%%%
% % fig=figure('papersize',[31.4 14.65]);
% % ax1=axes('position',[0.24 0.3 0.25 0.4]);
% % bx1=axes('position',[0.555 0.3 0.25 0.4]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Without Title %%%%%%%%%%%%%%%%
fig=figure('papersize',[31.4 13.9]);
ax1=axes('position',[0.24 0.32 0.25 0.4]);
bx1=axes('position',[0.555 0.32 0.25 0.4]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


true_tr=mean(true_data{noise_ind1,coup_ind},1);
if true_tr(tau1)>true_tr(tau2)
   diff_true_tr=true_tr(tau1)-true_tr(tau2);
   diff_sur_te=(surr_data{noise_ind1,coup_ind}(:,tau1)-surr_data{noise_ind1,coup_ind}(:,tau2));
elseif true_tr(tau1)<true_tr(tau2)
   diff_true_tr=true_tr(tau2)-true_tr(tau1);
   diff_sur_te=(surr_data{noise_ind1,coup_ind}(:,tau2)-surr_data{noise_ind1,coup_ind}(:,tau1));
end
%%%%%%%%% Histogram of Statistical test %%%%%%%%%%%%%%%%%%%

mdi= diff_sur_te;     % surro data set %
cb=0.95;              % confidence level%
%cb1=0.05;
ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
smd=sort(mdi,'ascend');
d_cut=smd(find(ce<=cb,1,'last'));

set(fig,'currentaxes',ax1);
histogram(mdi,20,'normalization','probability')
hold on
h(1)=plot([d_cut d_cut],[0 0.5],'-r','linewidth',2.5);
hold on
h(2)=plot([diff_true_tr diff_true_tr],[0 0.5],'-b','linewidth',2.5);
hold on
xlabel('$\Delta MT_{X\to Z}$','interpreter','latex')
title('(a)','interpreter','latex')
% title({'(a)','Statistical test'},'interpreter','latex')
ylabel('$p(\Delta MT_{X\to Z}^s)$','interpreter','latex')
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

if true_tr(tau1)>true_tr(tau2)

    if bird1==1 && bird2==2
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Y}$(',num2str(tau1),')','-','$MT_{X\rightarrow Y}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==2 && bird2==3
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{Y\rightarrow Z}$(',num2str(tau1),')','-','$MT_{Y\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==1 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau1),')','-','$MT_{X\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    end
elseif true_tr(tau1)<true_tr(tau2)
    if bird1==1 && bird2==2
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Y}$(',num2str(tau2),')','-','$MT_{X\rightarrow Y}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==2 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{Y\rightarrow Z}$(',num2str(tau2),')','-','$MT_{Y\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==1 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau2),')','-','$MT_{X\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    end
end

true_tr=mean(true_data{noise_ind2,coup_ind},1);
if true_tr(tau1)>true_tr(tau2)
   diff_true_tr=true_tr(tau1)-true_tr(tau2);
   diff_sur_te=(surr_data{noise_ind2,coup_ind}(:,tau1)-surr_data{noise_ind2,coup_ind}(:,tau2));
elseif true_tr(tau1)<true_tr(tau2)
   diff_true_tr=true_tr(tau2)-true_tr(tau1);
   diff_sur_te=(surr_data{noise_ind2,coup_ind}(:,tau2)-surr_data{noise_ind2,coup_ind}(:,tau1));
end
%%%%%%%%% Histogram of Statistical test %%%%%%%%%%%%%%%%%%%

mdi= diff_sur_te;     % surro data set %
cb=0.95;              % confidence level%
%cb1=0.05;
ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
smd=sort(mdi,'ascend');
d_cut=smd(find(ce<=cb,1,'last'));

set(fig,'currentaxes',bx1);
histogram(mdi,20,'normalization','probability')
hold on
h(1)=plot([d_cut d_cut],[0 0.5],'-r','linewidth',2.5);
hold on
h(2)=plot([diff_true_tr diff_true_tr],[0 0.5],'-b','linewidth',2.5);
hold on
xlabel('$\Delta MT_{X\to Z}$','interpreter','latex')
title('(b)','interpreter','latex')
% title({'(b)','Statistical test'},'interpreter','latex')
ylabel('$p(\Delta MT_{X\to Z}^s)$','interpreter','latex')
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

if true_tr(tau1)>true_tr(tau2)

    if bird1==1 && bird2==2
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Y}$(',num2str(tau1),')','-','$MT_{X\rightarrow Y}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==2 && bird2==3
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{Y\rightarrow Z}$(',num2str(tau1),')','-','$MT_{Y\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==1 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau1),')','-','$MT_{X\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
    end
elseif true_tr(tau1)<true_tr(tau2)
    if bird1==1 && bird2==2
        legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Y}$(',num2str(tau2),')','-','$MT_{X\rightarrow Y}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==2 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{Y\rightarrow Z}$(',num2str(tau2),')','-','$MT_{Y\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    elseif bird1==1 && bird2==3
         legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau2),')','-','$MT_{X\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
    end
end


end
