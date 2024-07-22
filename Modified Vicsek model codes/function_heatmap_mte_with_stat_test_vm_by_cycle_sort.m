

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

XLabels = linspace(coup_min,coup_max,num_coup);
YLabels = linspace(noise_min,2*pi,num_coup);
CustomXLabels=[];
CustomYLabels=[];

for i=1:num_coup
    if(1<i && i<num_coup && mod(i,2)==0)
        a=' ';
        b=' ';
    else
        a=string(XLabels(i));
        b=string(YLabels(i));
    end
    CustomXLabels=cat(2,CustomXLabels,a);
    CustomYLabels=cat(2,CustomYLabels,b);
end


%%%%%%%%%%%%%%%% heatmap mte including stat test %%%%%%%%%%%%%%%%%

figure
mon_te_new_xy(pass_or_fail_xy(:,:,3)==0) = NaN;
mon_te_new_xy(pass_or_fail_xy(:,:,2)==0) = NaN;
mon_te_new_xy(pass_or_fail_xy(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_xy,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '$MT_{X\rightarrow Y}$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels = CustomXLabels;
h.YDisplayLabels = CustomYLabels;

colormap('jet(4)')
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


figure
mon_te_new_yz(pass_or_fail_yz(:,:,3)==0) = NaN;
mon_te_new_yz(pass_or_fail_yz(:,:,2)==0) = NaN;
mon_te_new_yz(pass_or_fail_yz(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_yz,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '$MT_{Y\rightarrow Z}$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels = CustomXLabels;
h.YDisplayLabels = CustomYLabels;
colormap('jet(4)')
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


figure
mon_te_new_xz(pass_or_fail_xz(:,:,3)==0) = NaN;
mon_te_new_xz(pass_or_fail_xz(:,:,2)==0) = NaN;
mon_te_new_xz(pass_or_fail_xz(:,:,1)==0) = NaN;
h=heatmap(coup_array,noise_array,mon_te_new_xz,'CellLabelColor', 'None');
h.XLabel = 'Coupling strength $(w)$';
h.YLabel = ('Noise ${(\eta)}$');
h.Title = '$MT_{X\rightarrow Z}$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels = CustomXLabels;
h.YDisplayLabels = CustomYLabels;
colormap('jet(4)')
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
