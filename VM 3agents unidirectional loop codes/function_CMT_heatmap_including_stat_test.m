
function function_CMT_heatmap_including_stat_test(font)

nbird=3;
coup_array=linspace(0.1,1,10);
noise_array=linspace(pi/10,19*pi/10,10);

for ind1=1:nbird
    for ind2=1:nbird

        if ind1~=ind2
            load(['data_te/cmt_data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'mon_ce_new')

            load(['data_te/cmt_data_stat_test_bird_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'pass_or_fail')

            if ind1==1 && ind2==2
                mon_ce_new_12=mon_ce_new;
                pass_or_fail_12=pass_or_fail;
            elseif ind1==1 && ind2==3
                mon_ce_new_13=mon_ce_new;
                pass_or_fail_13=pass_or_fail;
            elseif ind1==2 && ind2==3
                mon_ce_new_23=mon_ce_new;
                pass_or_fail_23=pass_or_fail;
            elseif ind1==2 && ind2==1
                mon_ce_new_21=mon_ce_new;
                pass_or_fail_21=pass_or_fail;
            elseif ind1==3 && ind2==2
                mon_ce_new_32=mon_ce_new;
                pass_or_fail_32=pass_or_fail;
            elseif ind1==3 && ind2==1
                mon_ce_new_31=mon_ce_new;
                pass_or_fail_31=pass_or_fail;
            end

        end

    end
end

%%%%%%%%% cmt heatmap %%%%%%%%%%%%%%%

fig=figure('papersize',[43.0 22.5]);
ax1=axes('position',[0.135 0.605 0.2 0.29]);
bx1=axes('position',[0.405 0.605 0.2 0.29]);
cx1=axes('position',[0.675 0.605 0.2 0.29]);

dx1=axes('position',[0.135 0.165 0.2 0.29]);
ex1=axes('position',[0.405 0.165 0.2 0.29]);
fx1=axes('position',[0.675 0.165 0.2 0.29]);

set(fig,'currentaxes',ax1);
mon_ce_new_12(pass_or_fail_12(:,:,3)==0) = NaN;
mon_ce_new_12(pass_or_fail_12(:,:,2)==0) = NaN;
mon_ce_new_12(pass_or_fail_12(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_12,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{a}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
colorbar('off')
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%% grid off



set(fig,'currentaxes',bx1);
mon_ce_new_23(pass_or_fail_23(:,:,3)==0) = NaN;
mon_ce_new_23(pass_or_fail_23(:,:,2)==0) = NaN;
mon_ce_new_23(pass_or_fail_23(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_23,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{b}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
colorbar('off')
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%% grid off


set(fig,'currentaxes',cx1);
mon_ce_new_31(pass_or_fail_31(:,:,3)==0) = NaN;
mon_ce_new_31(pass_or_fail_31(:,:,2)==0) = NaN;
mon_ce_new_31(pass_or_fail_31(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_31,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{c}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
colorbar('off')
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%% grid off


set(fig,'currentaxes',dx1);
mon_ce_new_21(pass_or_fail_21(:,:,3)==0) = NaN;
mon_ce_new_21(pass_or_fail_21(:,:,2)==0) = NaN;
mon_ce_new_21(pass_or_fail_21(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_21,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{d}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
colorbar('off')
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%% grid off


set(fig,'currentaxes',ex1);
mon_ce_new_32(pass_or_fail_32(:,:,3)==0) = NaN;
mon_ce_new_32(pass_or_fail_32(:,:,2)==0) = NaN;
mon_ce_new_32(pass_or_fail_32(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_32,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{e}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
colorbar('off')
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%% grid off


set(fig,'currentaxes',fx1);
mon_ce_new_13(pass_or_fail_13(:,:,3)==0) = NaN;
mon_ce_new_13(pass_or_fail_13(:,:,2)==0) = NaN;
mon_ce_new_13(pass_or_fail_13(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_ce_new_13,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength$(w)$';
h.YLabel = ('Noise${(\eta)}$');
h.Title = {'($\mathbf{f}$)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'};
h.YDisplayLabels={'0.1$\pi$','0.3$\pi$','0.5$\pi$','0.7$\pi$','0.9$\pi$','1.1$\pi$','1.3$\pi$',...
    '1.5$\pi$','1.7$\pi$','1.9$\pi$'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
    ];
colormap(gca, custom_cmap);
hs = struct(h);
hs.Colorbar.Ticks = [0.125, 0.375, 0.625, 0.875];
hs.Colorbar.TickLabels = {'0', '0.25', '0.5', '1'};
set(hs.Colorbar,'TickLabelInterpreter','latex')
hs.Colorbar.TickLength = 0;
hs.Colorbar.Title.String = '$d_m$';
hs.Colorbar.Title.Interpreter = 'latex';
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
%%%% grid off