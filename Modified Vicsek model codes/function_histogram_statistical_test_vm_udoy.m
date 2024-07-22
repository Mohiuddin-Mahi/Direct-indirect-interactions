


function function_histogram_statistical_test_vm_udoy(font,noise_ind,coup_ind,tau1,tau2,bird1,bird2)


load(['data_te/udoy_data_stat_test_bird_',num2str(bird1),'_',num2str(bird2),...
    '.mat'],'true_data','surr_data')

true_tr=mean(true_data{noise_ind,coup_ind},1);
if true_tr(tau1)>true_tr(tau2)
   diff_true_tr=true_tr(tau1)-true_tr(tau2);
   diff_sur_te=(surr_data{noise_ind,coup_ind}(:,tau1)-surr_data{noise_ind,coup_ind}(:,tau2));
elseif true_tr(tau1)<true_tr(tau2)
   diff_true_tr=true_tr(tau2)-true_tr(tau1);
   diff_sur_te=(surr_data{noise_ind,coup_ind}(:,tau2)-surr_data{noise_ind,coup_ind}(:,tau1));
end
% diff_true_te=mean(true_data{noise_ind,coup_ind}(:,tau1) - true_data{noise_ind,coup_ind}(:,tau2));
%%%%%%%%% Histogram of Statistical test %%%%%%%%%%%%%%%%%%%

mdi= diff_sur_te;     % surro data set %
cb=0.95;              % confidence level%
%cb1=0.05;
ce=cumsum(1/numel(mdi)*ones(1,numel(mdi)));
smd=sort(mdi,'ascend');
d_cut=smd(find(ce<=cb,1,'last'));

figure
histogram(mdi,20,'normalization','probability')
hold on
h(1)=plot([d_cut d_cut],[0 0.5],'-r','linewidth',2);
hold on
h(2)=plot([diff_true_tr diff_true_tr],[0 0.5],'-b','linewidth',2);
hold on
% legend(h,'95% confidence cutoff','actual MT')
xlabel('$\Delta MT_{X\to Z}$','interpreter','latex')
title('Statistical test','interpreter','latex')
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
