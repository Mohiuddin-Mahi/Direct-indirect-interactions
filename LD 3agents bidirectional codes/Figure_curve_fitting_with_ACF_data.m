

function Figure_curve_fitting_with_ACF_data(font)

g_ind=3;     %%% g_ind=3 is friction coefficient gamma=0.6
kT_ind1=1;   %%% kT_ind1=1 is Thermal energy kBT=0.2
kT_ind2=5;   %%% kT_ind2=5 is Thermal energy kBT=1.8

initial_guess = [0.5, 1, 0.6283, 0];  %% Initial assumption for curve fitting with ACF data

%%% Input data %%%
t = linspace(0, 50, 51); 
load(['corr_data/corr_l_10_epi_5_g_',num2str(g_ind),'_dt_0.1_kT_',num2str(kT_ind1),'.mat'],...
    'corr_vx','corr_vy')

x1 = corr_vx{1}(1,:); 
x2 = corr_vx{1}(2,:); 
x3 = corr_vx{1}(3,:); 
y1 = corr_vy{1}(1,:); 
y2 = corr_vy{1}(2,:); 
y3 = corr_vy{1}(3,:); 

%%%% Fitted damed sinusoidal function %%%
fit_function = @(b, t)  (exp(-b(1)*t).*(b(2) + cos(b(3)*t))+b(4))/(1+b(2)+b(4));
%%%% Perform the curve fitting using non-linear least squares %%%%
params_x1 = lsqcurvefit(fit_function, initial_guess, t, x1);
params_x2 = lsqcurvefit(fit_function, initial_guess, t, x2);
params_x3 = lsqcurvefit(fit_function, initial_guess, t, x3);

%%% Generate fitted curve using the optimized parameters %%%%

x1_fitted = fit_function(params_x1, t);
x2_fitted = fit_function(params_x2, t);
x3_fitted = fit_function(params_x3, t);

%%%%% Figures %%%%%%

fig=figure('papersize',[48.4 13.72]); %orient tall %[11.69 6.27];
ax1=axes('position',[0.08 0.32 0.25 0.4]); % [x corr y corr width hight]
bx1=axes('position',[0.39 0.32 0.25 0.4]);
cx1=axes('position',[0.70 0.32 0.25 0.4]); % [x corr y corr width hight]

set(fig,'currentaxes',ax1);
plot(t, x1, 'k-','LineWidth', 1);
hold on;
plot(t, y1, 'k*', 'LineWidth', 1);
plot(t, x2, 'b-', 'LineWidth', 1);
plot(t, y2, 'b*', 'LineWidth', 1);
plot(t, x3, 'r-', 'LineWidth', 1);
plot(t, y3, 'ro', 'LineWidth', 1);
xlabel('Time lag($\Delta t$)','interpreter','latex');
ylabel('ACF($\Delta t$)','interpreter','latex');
title('($\mathbf{a}$)','interpreter','latex')
legend('$v_{x,X}$','$v_{y,X}$','$v_{x,Y}$','$v_{y,Y}$','$v_{x,Z}$','$v_{y,Z}$',...
    'location','northeast','interpreter','latex')
xlim([0 50])
xticks([0 10 20 30 40 50])
xticklabels({'0','10','20','30','40','50'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',bx1);
plot(t, x1, 'k-','LineWidth', 1.5);
hold on;
plot(t, x1_fitted, 'k--', 'LineWidth', 1.5);
plot(t, x2, 'b-', 'LineWidth', 1.5);
plot(t, x2_fitted, 'b--', 'LineWidth', 1.5);
plot(t, x3, 'r-', 'LineWidth', 1.5);
plot(t, x3_fitted, 'r--', 'LineWidth', 1.5);
xlabel('Time lag($\Delta t$)','interpreter','latex');
ylabel('ACF($\Delta t$)','interpreter','latex');
title('($\mathbf{b}$)','interpreter','latex')
legend('$v_{x,X}$','$v_{x,X}$ fitted','$v_{x,Y}$','$v_{x,Y}$ fitted','$v_{x,Z}$','$v_{x,Z}$ fitted',...
    'location','northeast','interpreter','latex')
xlim([0 50])
xticks([0 10 20 30 40 50])
xticklabels({'0','10','20','30','40','50'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Input data %%%
t = linspace(0, 50, 51); 
load(['corr_data/corr_l_10_epi_5_g_',num2str(g_ind),'_dt_0.1_kT_',num2str(kT_ind2),'.mat'],...
    'corr_vx')

x12 = corr_vx{1}(1,:); 
x22 = corr_vx{1}(2,:); 
x32 = corr_vx{1}(3,:); 

%%%% Fitted damed sinusoidal function %%%
fit_function = @(b, t)  (exp(-b(1)*t).*(b(2) + cos(b(3)*t))+b(4))/(1+b(2)+b(4));
%%%% Perform the curve fitting using non-linear least squares %%%%
params_x12 = lsqcurvefit(fit_function, initial_guess, t, x12);
params_x22 = lsqcurvefit(fit_function, initial_guess, t, x22);
params_x32 = lsqcurvefit(fit_function, initial_guess, t, x32);

%%% Generate fitted curve using the optimized parameters %%%%
x12_fitted = fit_function(params_x12, t);
x22_fitted = fit_function(params_x22, t);
x32_fitted = fit_function(params_x32, t);

set(fig,'currentaxes',cx1);
plot(t, x12, 'k-','LineWidth', 1.5);
hold on;
plot(t, x12_fitted, 'k--', 'LineWidth', 1.5);
plot(t, x22, 'b-', 'LineWidth', 1.5);
plot(t, x22_fitted, 'b--', 'LineWidth', 1.5);
plot(t, x32, 'r-', 'LineWidth', 1.5);
plot(t, x32_fitted, 'r--', 'LineWidth', 1.5);
xlabel('Time lag($\Delta t$)','interpreter','latex');
ylabel('ACF($\Delta t$)','interpreter','latex');
title('($\mathbf{c}$)','interpreter','latex')
legend('$v_{x,X}$','$v_{x,X}$ fitted','$v_{x,Y}$','$v_{x,Y}$ fitted','$v_{x,Z}$','$v_{x,Z}$ fitted',...
    'location','northeast','interpreter','latex')
xlim([0 50])
xticks([0 10 20 30 40 50])
xticklabels({'0','10','20','30','40','50'})
set(gca,FontSize=font);
set(gca,'TickLabelInterpreter','latex');
