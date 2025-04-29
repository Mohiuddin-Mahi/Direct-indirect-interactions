

clc
close all
clear;

font=23;

%%%%%%%%%%%%%% Heatmap %%%%%%%%%%%%%%%%%%
fig=figure('papersize',[31.5 13.7]);
ax1=axes('position',[0.240 0.320 0.25 0.4]);
bx1=axes('position',[0.550 0.320 0.25 0.4]);

delay=1;
c1_array=linspace(0.1,1,19);
coup_array=linspace(0.1,1,19);
load('data_te/data_birds_1_2.mat','tran_ent','tran_ent_new')

for c1_ind=1:length(c1_array)
    for coup_ind=1:length(coup_array)

        if find(mean(tran_ent{c1_ind,coup_ind},1)==max(mean(tran_ent{c1_ind,coup_ind},1)))==delay
            test_data_te(c1_ind,coup_ind)=1;
        else
            test_data_te(c1_ind,coup_ind)=0;
        end

        if find(mean(tran_ent_new{c1_ind,coup_ind},1)==max(mean(tran_ent_new{c1_ind,coup_ind},1)))==delay
            test_data_te_new(c1_ind,coup_ind)=1;
        else
            test_data_te_new(c1_ind,coup_ind)=0;
        end
    end
end


set(fig,'currentaxes',ax1);
h=heatmap(coup_array,c1_array,test_data_te,'CellLabelColor', 'None');
h.XLabel = 'Parameter $(p)$';
h.YLabel = ('Parameter  $(p_1)$');
h.Title = {'(a)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
h.YDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);

set(fig,'currentaxes',bx1);
h=heatmap(coup_array,c1_array,test_data_te_new,'CellLabelColor', 'None');
h.XLabel =('Parameter $(p)$');
h.YLabel =('Parameter  $(p_1)$');
h.Title = {'(b)'};
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
h.YDisplayLabels={'0.1','','0.2','','0.3','','0.4','','0.5','','0.6','','0.7','','0.8','','0.9','','1.0'};
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);


