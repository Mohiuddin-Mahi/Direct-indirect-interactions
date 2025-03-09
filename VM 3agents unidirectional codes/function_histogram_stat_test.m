

function function_histogram_stat_test(font)

tau1=3;
tau2=4;

coup=2;             %%% coup=2 is 0.2
noise1=3;           %%% noise1=3 is 0.5pi 
noise2=4;           %%% noise2=4 is 0.7pi

load('data_te/mt_data_stat_test_bird_1_3.mat','true_data','surr_data')

%%%%%%%%% Fist Histogram %%%%%%%%%%%%%%%%%%%

fig=figure('papersize',[31.4 13.9]);
ax1=axes('position',[0.24 0.32 0.25 0.4]);
bx1=axes('position',[0.555 0.32 0.25 0.4]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

true_tr=mean(true_data{noise1,coup},1);
if true_tr(tau1)>true_tr(tau2)
   diff_true_tr=true_tr(tau1)-true_tr(tau2);
   diff_sur_te=(surr_data{noise1,coup}(:,tau1)-surr_data{noise1,coup}(:,tau2));
elseif true_tr(tau1)<true_tr(tau2)
   diff_true_tr=true_tr(tau2)-true_tr(tau1);
   diff_sur_te=(surr_data{noise1,coup}(:,tau2)-surr_data{noise1,coup}(:,tau1));
end

mdi= diff_sur_te;     % surro data set %
cb=0.95;              % confidence level%
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
title('($\mathbf{a}$)','interpreter','latex')
ylabel('$p(\Delta MT_{X\to Z}^s)$','interpreter','latex')
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

if true_tr(tau1)>true_tr(tau2)
    legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau1),')',...
        '-','$MT_{X\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
else
    legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau2),')',...
        '-','$MT_{X\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
end

%%%%%%%%% Second Histogram %%%%%%%%%%%%%%%%%%%

true_tr=mean(true_data{noise2,coup},1);
if true_tr(tau1)>true_tr(tau2)
   diff_true_tr=true_tr(tau1)-true_tr(tau2);
   diff_sur_te=(surr_data{noise2,coup}(:,tau1)-surr_data{noise2,coup}(:,tau2));
elseif true_tr(tau1)<true_tr(tau2)
   diff_true_tr=true_tr(tau2)-true_tr(tau1);
   diff_sur_te=(surr_data{noise2,coup}(:,tau2)-surr_data{noise2,coup}(:,tau1));
end

mdi= diff_sur_te;     % surro data set %
cb=0.95;              % confidence level%
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
title('($\mathbf{b}$)','interpreter','latex')
ylabel('$p(\Delta MT_{X\to Z}^s)$','interpreter','latex')
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

if true_tr(tau1)>true_tr(tau2)
   legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau1),')',...
       '-','$MT_{X\rightarrow Z}$(',num2str(tau2),')'),...
            'location','northwest','interpreter','latex')
else
    legend(h,'$95\%$ Confidence cutoff',strcat('$MT_{X\rightarrow Z}$(',num2str(tau2),')',...
        '-','$MT_{X\rightarrow Z}$(',num2str(tau1),')'),...
            'location','northwest','interpreter','latex')
end

