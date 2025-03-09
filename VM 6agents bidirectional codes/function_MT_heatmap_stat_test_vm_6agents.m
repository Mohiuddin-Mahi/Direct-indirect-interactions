

function function_MT_heatmap_stat_test_vm_6agents(font)

nbird=6;
coup_array=linspace(0.1,1,10);
noise_array=linspace(pi/10,19*pi/10,10);

for ind1=1:nbird
    for ind2=1:nbird
        if ind1<ind2
            load(['data_te/data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],...
                'mon_te','mon_te_new')

            load(['data_te/mt_data_stat_test_bird_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'pass_or_fail')
            mt_pass_or_fail=pass_or_fail;

            if ind1==1 && ind2==2
                mon_mt_12=mon_te_new;
                mt_pass_or_fail_12=mt_pass_or_fail;

            elseif ind1==1 && ind2==3
                mon_mt_13=mon_te_new;
                mt_pass_or_fail_13=mt_pass_or_fail;

            elseif ind1==1 && ind2==4
                mon_mt_14=mon_te_new;
                mt_pass_or_fail_14=mt_pass_or_fail;

            elseif ind1==1 && ind2==5
                mon_mt_15=mon_te_new;
                mt_pass_or_fail_15=mt_pass_or_fail;

            elseif ind1==1 && ind2==6
                mon_mt_16=mon_te_new;
                mt_pass_or_fail_16=mt_pass_or_fail;

            elseif ind1==2 && ind2==3
                mon_mt_23=mon_te_new;
                mt_pass_or_fail_23=mt_pass_or_fail;

            elseif ind1==2 && ind2==4
                mon_mt_24=mon_te_new;
                mt_pass_or_fail_24=mt_pass_or_fail;

            elseif ind1==2 && ind2==5
                mon_mt_25=mon_te_new;
                mt_pass_or_fail_25=mt_pass_or_fail;

            elseif ind1==2 && ind2==6
                mon_mt_26=mon_te_new;
                mt_pass_or_fail_26=mt_pass_or_fail;

            elseif ind1==3 && ind2==4
                mon_mt_34=mon_te_new;
                mt_pass_or_fail_34=mt_pass_or_fail;

            elseif ind1==3 && ind2==5
                mon_mt_35=mon_te_new;
                mt_pass_or_fail_35=mt_pass_or_fail;

            elseif ind1==3 && ind2==6
                mon_mt_36=mon_te_new;
                mt_pass_or_fail_36=mt_pass_or_fail;

            elseif ind1==4 && ind2==5
                mon_mt_45=mon_te_new;
                mt_pass_or_fail_45=mt_pass_or_fail;

            elseif ind1==4 && ind2==6
                mon_mt_46=mon_te_new;
                mt_pass_or_fail_46=mt_pass_or_fail;

            elseif ind1==5 && ind2==6
                mon_mt_56=mon_te_new;
                mt_pass_or_fail_56=mt_pass_or_fail;
            end

        end

    end
end

%%%%%%%%%%%% MT heatmap %%%%%%%%%%%%%%%%%%

fig=figure('papersize',[43.0 22.5]);
ax1=axes('position',[0.135 0.605 0.2 0.29]);
bx1=axes('position',[0.405 0.605 0.2 0.29]);
cx1=axes('position',[0.675 0.605 0.2 0.29]);

dx1=axes('position',[0.135 0.165 0.2 0.29]);
ex1=axes('position',[0.405 0.165 0.2 0.29]);
fx1=axes('position',[0.675 0.165 0.2 0.29]);

set(fig,'currentaxes',ax1);
mon_mt_12(mt_pass_or_fail_12(:,:,3)==0) = NaN;
mon_mt_12(mt_pass_or_fail_12(:,:,2)==0) = NaN;
mon_mt_12(mt_pass_or_fail_12(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_12,'CellLabelColor', 'None');
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
%%% grid off


set(fig,'currentaxes',bx1);
mon_mt_14(mt_pass_or_fail_14(:,:,3)==0) = NaN;
mon_mt_14(mt_pass_or_fail_14(:,:,2)==0) = NaN;
mon_mt_14(mt_pass_or_fail_14(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_14,'CellLabelColor', 'None');
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
mon_mt_56(mt_pass_or_fail_56(:,:,3)==0) = NaN;
mon_mt_56(mt_pass_or_fail_56(:,:,2)==0) = NaN;
mon_mt_56(mt_pass_or_fail_56(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_56,'CellLabelColor', 'None');
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
mon_mt_15(mt_pass_or_fail_15(:,:,3)==0) = NaN;
mon_mt_15(mt_pass_or_fail_15(:,:,2)==0) = NaN;
mon_mt_15(mt_pass_or_fail_15(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_15,'CellLabelColor', 'None');
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
mon_mt_26(mt_pass_or_fail_26(:,:,3)==0) = NaN;
mon_mt_26(mt_pass_or_fail_26(:,:,2)==0) = NaN;
mon_mt_26(mt_pass_or_fail_26(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_26,'CellLabelColor', 'None');
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
mon_mt_35(mt_pass_or_fail_35(:,:,3)==0) = NaN;
mon_mt_35(mt_pass_or_fail_35(:,:,2)==0) = NaN;
mon_mt_35(mt_pass_or_fail_35(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_mt_35,'CellLabelColor', 'None');
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
