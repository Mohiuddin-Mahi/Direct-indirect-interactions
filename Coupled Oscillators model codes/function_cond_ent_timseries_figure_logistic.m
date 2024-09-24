
function function_cond_ent_timseries_figure_logistic(font,chaos_ind,coup_min,coup_max,num_coup)

nbird=3;
coup_array=linspace(coup_min,coup_max,num_coup);

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2
            load(['data_cond_ent/cond_ent_bird_',num2str(ind1),'_',num2str(ind2),'.mat'],'cond_entropy')

            if ind1==1 && ind2==2
                cond_ent_y_given_x=cond_entropy;
            elseif ind1==1 && ind2==3
                cond_ent_z_given_x=cond_entropy;
            elseif ind1==2 && ind2==3
                cond_ent_z_given_y=cond_entropy;
            end

        end
    end
end

%%%%%%%%%%%%%%% Figure %%%%%%%%%%%%%%

fig=figure('papersize',[47.8 14.1]); %orient tall %[11.69 6.27];
ax1=axes('position',[0.08 0.328 0.25 0.4]); % [x corr y corr width hight]
bx1=axes('position',[0.39 0.328 0.25 0.4]);
cx1=axes('position',[0.71 0.328 0.25 0.4]); % [x corr y corr width hight]

% fig=figure('papersize',[6.8 2.8]); orient tall %[11.69 6.27];
% ax1=axes('position',[0.08 0.35 0.25 0.4]); % [x corr y corr width hight]
% bx1=axes('position',[0.40 0.35 0.25 0.4]);
% cx1=axes('position',[0.72 0.35 0.25 0.4]); % [x corr y corr width hight]

set(fig,'currentaxes',ax1);
plot(coup_array,mean(cond_ent_y_given_x{chaos_ind},2), 'LineWidth',2)
hold on
plot(coup_array,mean(cond_ent_z_given_y{chaos_ind},2), 'LineWidth',2)
plot(coup_array,mean(cond_ent_z_given_x{chaos_ind},2), 'LineWidth',2)
xlabel('Coupling strength ${(\epsilon)}$ ','interpreter','latex')
ylabel('$H(\cdot|\cdot)$','interpreter','latex')
title('(a)','interpreter','latex')
legend('$H(Y|X)$','$H(Z|Y)$','$H(Z|X)$','location','northeast','interpreter','latex')
xlim([0 1])
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1])
xticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
ylim([0 4])
yticks([0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0])
yticklabels({'0','0.5','1.0','1.5','2.0', '2.5','3.0','3.5','4.0'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');



%%%%%%% non synchronized figure %%%%%%%%%%
load('symbols_strength_upto_1/symbols_chaos_21_coup_8.mat','symbols_real');

set(fig,'currentaxes',bx1);
plot(symbols_real{1,4}(1,1:60),'-ob','LineWidth',2)
hold on
plot(symbols_real{1,4}(2,1:60),'-*k','LineWidth',2)
xlabel('Time (t)','Interpreter','latex')
ylabel('Time series','Interpreter','latex')
title('(b)','interpreter','latex')
legend('X','Y','location','northeast','Interpreter','latex')
xlim([0 60])
%  ylim([0 2.5])
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%% synchronized figure %%%%%%%%%%
load('symbols_strength_upto_1/symbols_chaos_21_coup_16.mat','symbols_real')   

set(fig,'currentaxes',cx1);
plot(symbols_real{1,4}(1,1:60),'-ob','LineWidth',2)
hold on
plot(symbols_real{1,4}(2,1:60),'-*k','LineWidth',2)
xlabel('Time (t)','Interpreter','latex')
ylabel('Time series','Interpreter','latex')
title('(c)','interpreter','latex')
legend('X','Y','location','northeast','Interpreter','latex')
xlim([0 60])
%  ylim([0 2.5])
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');


end
