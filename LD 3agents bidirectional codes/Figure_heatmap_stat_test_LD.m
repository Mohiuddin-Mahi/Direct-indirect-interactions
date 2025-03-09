

function Figure_heatmap_stat_test_LD(font)

epi=5;
nparticles=3;
kT_array=linspace(0.2,3.8,10);
gamma_array=linspace(0.2,2,10);

for ind1=1:nparticles
    for ind2=1:nparticles

        if ind1<ind2
            load(['data_te/data_monotonic_test_epi_',num2str(epi),'_part_',...
                num2str(ind1),'_',num2str(ind2),'.mat'])

            load(['data_te/te_results_stat_test_part_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'pass_or_fail')
            te_pass_or_fail=pass_or_fail;

            load(['data_te/mt_results_stat_test_part_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'pass_or_fail')
            mt_pass_or_fail=pass_or_fail;

            if ind1==1 && ind2==2
                mon_te_12=mon_te;
                te_pass_or_fail_12=te_pass_or_fail;
                mon_mt_12=mon_te_new;
                mt_pass_or_fail_12=mt_pass_or_fail;

            elseif ind1==1 && ind2==3
                mon_te_13=mon_te;
                te_pass_or_fail_13=te_pass_or_fail;
                mon_mt_13=mon_te_new;
                mt_pass_or_fail_13=mt_pass_or_fail;

            elseif ind1==2 && ind2==3
                mon_te_23=mon_te;
                te_pass_or_fail_23=te_pass_or_fail;
                mon_mt_23=mon_te_new;
                mt_pass_or_fail_23=mt_pass_or_fail;
            end

        end
    end
end


%%%%%%%%%%%%%%%% heatmap %%%%%%%%%%%%%%%%%

%%%%%%%%% te heatmap %%%%%%%%%%%%%%%

fig=figure('papersize',[43.0 22.5]);
ax1=axes('position',[0.135 0.605 0.2 0.29]);
bx1=axes('position',[0.405 0.605 0.2 0.29]);
cx1=axes('position',[0.675 0.605 0.2 0.29]);

dx1=axes('position',[0.135 0.165 0.2 0.29]);
ex1=axes('position',[0.405 0.165 0.2 0.29]);
fx1=axes('position',[0.675 0.165 0.2 0.29]);

set(fig,'currentaxes',ax1);
mon_te_12(te_pass_or_fail_12(:,:,3)==0) = NaN;
mon_te_12(te_pass_or_fail_12(:,:,2)==0) = NaN;
mon_te_12(te_pass_or_fail_12(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_te_12,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{a}$)'};
% h.Title = '$T_{X\rightarrow Y}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
colormap('jet(4)')
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
%% grid off

set(fig,'currentaxes',bx1);
mon_te_23(te_pass_or_fail_23(:,:,3)==0) = NaN;
mon_te_23(te_pass_or_fail_23(:,:,2)==0) = NaN;
mon_te_23(te_pass_or_fail_23(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_te_23,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{b}$)'};
% h.Title = '$T_{Y\rightarrow Z}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
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
%%%% grid off

set(fig,'currentaxes',cx1);
mon_te_13(te_pass_or_fail_13(:,:,3)==0) = NaN;
mon_te_13(te_pass_or_fail_13(:,:,2)==0) = NaN;
mon_te_13(te_pass_or_fail_13(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_te_13,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{c}$)'};
% h.Title = '$T_{X\rightarrow Z}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
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
%%%% grid off


%%%%%%%%% mte heatmap %%%%%%%%%%%%%%%

set(fig,'currentaxes',dx1);
mon_mt_12(mt_pass_or_fail_12(:,:,3)==0) = NaN;
mon_mt_12(mt_pass_or_fail_12(:,:,2)==0) = NaN;
mon_mt_12(mt_pass_or_fail_12(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_mt_12,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{d}$)'};
% h.Title = '$MT_{X\rightarrow Y}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
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
%% grid off

set(fig,'currentaxes',ex1);
mon_mt_23(mt_pass_or_fail_23(:,:,3)==0) = NaN;
mon_mt_23(mt_pass_or_fail_23(:,:,2)==0) = NaN;
mon_mt_23(mt_pass_or_fail_23(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_mt_23,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{e}$)'};
% h.Title = '$MT_{Y\rightarrow Z}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
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
%%%% grid off

set(fig,'currentaxes',fx1);
mon_mt_13(mt_pass_or_fail_13(:,:,3)==0) = NaN;
mon_mt_13(mt_pass_or_fail_13(:,:,2)==0) = NaN;
mon_mt_13(mt_pass_or_fail_13(:,:,1)==0) = NaN;
h=heatmap(gamma_array,kT_array,mon_mt_13,'CellLabelColor', 'None');
h.XLabel = 'Friction coefficient$(\gamma)$';
h.YLabel = ('Ther. energy$(k_BT)$');
h.Title = {'($\mathbf{f}$)'};
% h.Title = '$MT_{X\rightarrow Z}(\tau=1,2,3,4)$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8','2.0'};
h.YDisplayLabels={'0.2','0.6','1.0','1.4','1.8','2.2','2.6','3.0','3.4','3.8'};
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
