

function Figure_conditional_entropy_LD(font)

g_ind=2;       %%% g_ind=2 is friction coefficient gamma=0.4
kT_ind1=3;     %%% kT_ind1=3 is Thermal energy kBT=1.0
kT_ind2=4;     %%% kT_ind2=4 is Thermal energy kBT=1.4
kT_ind3=5;     %%% kT_ind1=5 is Thermal energy kBT=1.8


max_tau=9;
tau_array=1:max_tau;
load('data_te/cond_ent_part_1_2.mat')

fig=figure('papersize',[15.5 12.9]);
ax1=axes('position',[0.395 0.33 0.25 0.4]); 

set(fig,'currentaxes',ax1);
%% Plot upper bound of MT %%%%
h1 = plot(tau_array, mean(cond_entropy1_new{kT_ind1,g_ind}(:,1:max_tau),1), '-+', 'LineWidth', 2.5, 'Color', [0 0.4470 0.7410]);
hold on
h2 = plot(tau_array, mean(cond_entropy1_new{kT_ind2,g_ind}(:,1:max_tau),1), '-o', 'LineWidth', 2.5, 'Color', [0.8500 0.3250 0.0980]);
h3 = plot(tau_array, mean(cond_entropy1_new{kT_ind3,g_ind}(:,1:max_tau),1), '-*', 'LineWidth', 2.5, 'Color', [0.9290 0.6940 0.1250]);

%% Plot upper bound of TE %%%%%
h4 = plot(tau_array, mean(cond_entropy1{kT_ind1,g_ind}(:,1:max_tau),1), ':+', 'LineWidth', 1.5, 'Color', [0 0.4470 0.7410]);
h5 = plot(tau_array, mean(cond_entropy1{kT_ind2,g_ind}(:,1:max_tau),1), ':o', 'LineWidth', 1.5, 'Color', [0.8500 0.3250 0.0980]);
h6 = plot(tau_array, mean(cond_entropy1{kT_ind3,g_ind}(:,1:max_tau),1), ':*', 'LineWidth', 1.5, 'Color', [0.9290 0.6940 0.1250]);

xlim([1 max_tau])
xticks(1:9)
xticklabels({'1','2','3','4','5','6', '7','8','9'})
ylim([3.85 4.0])
yticks([3.85 3.88 3.91 3.94 3.97 4.0])
yticklabels({'3.85','3.88','3.91','3.94','3.97','4.0'})
set(gca, 'FontSize', font);
set(gca, 'TickLabelInterpreter', 'latex');

% Title and Labels
xlabel('Time delay$(\tau)$ ','interpreter','latex','FontSize', 19)
ylabel('$H(Y_{t+\tau}|Y_t)~\&~H(Y_{t+\tau}|Y_{t+\tau-1})$', 'interpreter', 'latex', 'FontSize', 17)

%%5 First legend for upper bound of MT %%%
leg1 = legend([h1, h2, h3], {'$H(Y_{t+\tau}|Y_{t+\tau-1})$: $k_BT=1.0$', '$H(Y_{t+\tau}|Y_{t+\tau-1})$: $k_BT=1.4$', '$H(Y_{t+\tau}|Y_{t+\tau-1})$: $k_BT=1.8$'}, ...
              'Location', 'southeast', 'Interpreter', 'latex', 'FontSize', 14);
set(leg1, 'Box', 'off'); % Remove box to make it look cleaner

%% Create a second axes (invisible) for second legend %%
ax2 = axes('Position', get(gca, 'Position'), 'Color', 'none', 'XTick', [], 'YTick', [], 'XColor', 'none', 'YColor', 'none');

%%% Second legend for upper bound of TE %%%
leg2 = legend(ax2, [h4, h5, h6], {'$H(Y_{t+\tau}|Y_t)~\&$', '$H(Y_{t+\tau}|Y_t)~\&$', '$H(Y_{t+\tau}|Y_t)~\&$'}, ...
              'Location', 'southwest', 'Interpreter', 'latex', 'FontSize', 14);
set(leg2, 'Box', 'off'); % Remove box for a clean look
