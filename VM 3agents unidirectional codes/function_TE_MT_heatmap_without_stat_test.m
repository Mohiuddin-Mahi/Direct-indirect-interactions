

function function_TE_MT_heatmap_without_stat_test(font)

nbird=3;
coup_array=linspace(0.1,1,10);
noise_array=linspace(pi/10,19*pi/10,10);

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2
            load(['data_te/data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'mon_te','mon_te_new')

            if ind1==1 && ind2==2
                mon_te_12=mon_te;
                mon_mt_12=mon_te_new;

            elseif ind1==1 && ind2==3
                mon_te_13=mon_te;
                mon_mt_13=mon_te_new;

            elseif ind1==2 && ind2==3
                mon_te_23=mon_te;
                mon_mt_23=mon_te_new;
                
            end

        end

    end
end

%%%%%%%%%%% TE heatmap %%%%%%%%%%%%%%%

fig=figure('papersize',[43.0 22.5]);
ax1=axes('position',[0.135 0.605 0.2 0.29]);
bx1=axes('position',[0.405 0.605 0.2 0.29]);
cx1=axes('position',[0.675 0.605 0.2 0.29]);

dx1=axes('position',[0.135 0.165 0.2 0.29]);
ex1=axes('position',[0.405 0.165 0.2 0.29]);
fx1=axes('position',[0.675 0.165 0.2 0.29]);

set(fig,'currentaxes',ax1);
h=heatmap(coup_array,noise_array,mon_te_12,'CellLabelColor', 'None');
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



set(fig,'currentaxes',bx1);
h=heatmap(coup_array,noise_array,mon_te_23,'CellLabelColor', 'None');
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


set(fig,'currentaxes',cx1);
h=heatmap(coup_array,noise_array,mon_te_13,'CellLabelColor', 'None');
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

%%%%%%%%%%%% MT heatmap %%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',dx1);
h=heatmap(coup_array,noise_array,mon_mt_12,'CellLabelColor', 'None');
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


set(fig,'currentaxes',ex1);
h=heatmap(coup_array,noise_array,mon_mt_23,'CellLabelColor', 'None');
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


set(fig,'currentaxes',fx1);
h=heatmap(coup_array,noise_array,mon_mt_13,'CellLabelColor', 'None');
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
