

function function_logistic_timeseries_figure(font)

%%%%%%% non synchronized figure %%%%%%%%%%
load('symbols_strength_upto_1/symbols_chaos_21_coup_8.mat','symbols_real');
figure
plot(symbols_real{1,4}(1,1:60),'-ob','LineWidth',2)
hold on
plot(symbols_real{1,4}(2,1:60),'-*k','LineWidth',2)
xlabel('Time (t)','Interpreter','latex')
ylabel('Time series','Interpreter','latex')
legend('X','Y','location','northeast','Interpreter','latex')
xlim([0 60])
%  ylim([0 2.5])
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%% synchronized figure %%%%%%%%%%
load('symbols_strength_upto_1/symbols_chaos_21_coup_16.mat','symbols_real')   
figure
plot(symbols_real{1,4}(1,1:60),'-ob','LineWidth',2)
hold on
plot(symbols_real{1,4}(2,1:60),'-*k','LineWidth',2)
xlabel('Time (t)','Interpreter','latex')
ylabel('Time series','Interpreter','latex')
legend('X','Y','location','northeast','Interpreter','latex')
xlim([0 60])
%  ylim([0 2.5])
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

end
