

function function_heatmap_mte_with_stat_test_vm_by_cycle_sort(font,coup_min,coup_max,num_coup,noise_min)
nbird=3;
noise_array=linspace(noise_min,2*pi,num_coup);
coup_array=linspace(coup_min,coup_max,num_coup);

for ind1=1:nbird
    for ind2=1:nbird

        if ind1<ind2
            load(['data_te/data_monot_test_cycle_sort_birds_',num2str(ind1),'_',num2str(ind2),'.mat'],'mon_te_new')

            load(['data_te/udoy_data_stat_test_bird_',num2str(ind1),'_',num2str(ind2),...
                '.mat'],'pass_or_fail')

            if ind1==1 && ind2==2
                mon_te_new_xy=mon_te_new;
                pass_or_fail_xy=pass_or_fail;
            elseif ind1==1 && ind2==3
                mon_te_new_xz=mon_te_new;
                pass_or_fail_xz=pass_or_fail;
            elseif ind1==2 && ind2==3
                mon_te_new_yz=mon_te_new;
                pass_or_fail_yz=pass_or_fail;
            end

        end

    end
end

%%%%%%%%%%%%%%%% heatmap mte including stat test %%%%%%%%%%%%%%%%%

%%%%%%%%% with title %%%%%%%%%%%%%%%
% % fig=figure('papersize',[50.6 15.2]);
% % ax1=axes('position',[0.06 0.31 0.25 0.4]);
% % bx1=axes('position',[0.38 0.31 0.25 0.4]);
% % cx1=axes('position',[0.70 0.31 0.25 0.4]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%% without title %%%%%%%%%%%%%%%
fig=figure('papersize',[50.6 14.3]);
ax1=axes('position',[0.06 0.33 0.25 0.4]);
bx1=axes('position',[0.38 0.33 0.25 0.4]);
cx1=axes('position',[0.70 0.33 0.25 0.4]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(fig,'currentaxes',ax1);
mon_te_new_xy(pass_or_fail_xy(:,:,3)==0) = NaN;
mon_te_new_xy(pass_or_fail_xy(:,:,2)==0) = NaN;
mon_te_new_xy(pass_or_fail_xy(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_xy,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '(a)';
% h.Title = {'(a)','$MT_{X\rightarrow Y}$'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0','','0.4','','0.8','','1.2','','1.6','','2'};
h.YDisplayLabels={'0.39','','1.57','','2.75','','3.93',...
    '','5.11','','6.28'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
];
colormap(gca, custom_cmap);
colorbar('off')
hs = struct(h);
hs.Colorbar.Ticks = [0.125, 0.375, 0.625, 0.875];
hs.Colorbar.TickLabels = {'0', '0.25', '0.5', '1'};
set(hs.Colorbar,'TickLabelInterpreter','latex')
hs.Colorbar.Title.String = 'D';
hs.Colorbar.Title.Interpreter = 'latex';
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
% % grid off


set(fig,'currentaxes',bx1);
mon_te_new_yz(pass_or_fail_yz(:,:,3)==0) = NaN;
mon_te_new_yz(pass_or_fail_yz(:,:,2)==0) = NaN;
mon_te_new_yz(pass_or_fail_yz(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_yz,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '(b)';
% h.Title = {'(b)','$MT_{Y\rightarrow Z}$'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0','','0.4','','0.8','','1.2','','1.6','','2'};
h.YDisplayLabels={'0.39','','1.57','','2.75','','3.93',...
    '','5.11','','6.28'};
% colormap('jet(4)')
custom_cmap = [
    0.0, 1.0, 0.0   % Green
    1.0, 1.0, 0.0;  % Yellow
    1.0, 0.5, 0.0;  % Orange
    1.0, 0.0, 0.0;  % Red
];
colormap(gca, custom_cmap);
colorbar('off')
hs = struct(h);
hs.Colorbar.Ticks = [0.125, 0.375, 0.625, 0.875];
hs.Colorbar.TickLabels = {'0', '0.25', '0.5', '1'};
set(hs.Colorbar,'TickLabelInterpreter','latex')
hs.Colorbar.Title.String = 'D';
hs.Colorbar.Title.Interpreter = 'latex';
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
% % grid off


set(fig,'currentaxes',cx1);
mon_te_new_xz(pass_or_fail_xz(:,:,3)==0) = NaN;
mon_te_new_xz(pass_or_fail_xz(:,:,2)==0) = NaN;
mon_te_new_xz(pass_or_fail_xz(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_xz,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '(c)';
% h.Title = {'(c)','$MT_{X\rightarrow Z}$'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0','','0.4','','0.8','','1.2','','1.6','','2'};
h.YDisplayLabels={'0.39','','1.57','','2.75','','3.93',...
    '','5.11','','6.28'};
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
hs.Colorbar.Title.String = 'D';
hs.Colorbar.Title.Interpreter = 'latex';
caxis([0, 1]);
set(gca,FontSize=font);
set(h,'MissingDataLabel','')
% % grid off


end
