
function function_cond_ent_figure_logistic(font,chaos_ind,coup_min,coup_max,num_coup)

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

figure
plot(coup_array,mean(cond_ent_y_given_x{chaos_ind},2), 'LineWidth',2)
hold on
plot(coup_array,mean(cond_ent_z_given_y{chaos_ind},2), 'LineWidth',2)
plot(coup_array,mean(cond_ent_z_given_x{chaos_ind},2), 'LineWidth',2)
xlabel('Coupling strength ${(\epsilon)}$ ','interpreter','latex')
ylabel('$H(\cdot|\cdot)$','interpreter','latex')
legend('$H(Y|X)$','$H(Z|Y)$','$H(Z|X)$','location','northeast','interpreter','latex')
xlim([0 1])
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1])
xticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
ylim([0 4])
yticks([0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0])
yticklabels({'0','0.5','1.0','1.5','2.0', '2.5','3.0','3.5','4.0'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

end
