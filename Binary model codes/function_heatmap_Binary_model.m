
function function_heatmap_Binary_model(font)

ind1=1;
ind2=2;

delay=1;
num_c1=19;
num_coup=19;
c1_array=linspace(0.1,1,num_c1);
coup_array=linspace(0.1,1,num_coup);


load(['data_te/data_birds_',num2str(ind1),'_',num2str(ind2),'.mat'])

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


%%%%%%%%%%%%%%%% heatmap %%%%%%%%%%%%%%%%%
XLabels = linspace(0.1,1,19);
YLabels = linspace(0.1,1,19);
CustomXLabels=[];
CustomYLabels=[];
for i=1:19
    if(1<i && i<19 && mod(i,2)==0)
        a=' ';
        b=' ';
    else
        a=string(XLabels(i));
        b=string(YLabels(i));
    end
    CustomXLabels=cat(2,CustomXLabels,a);
    CustomYLabels=cat(2,CustomYLabels,b);
end

figure
h=heatmap(coup_array,c1_array,test_data_te,'CellLabelColor', 'None');
h.XLabel = 'Parameter $c$';
h.YLabel = ('Parameter  $c_1$');
h.Title = '$T_{X\rightarrow Y}$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels = CustomXLabels;
h.YDisplayLabels = CustomYLabels;
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);

figure
h=heatmap(coup_array,c1_array,test_data_te_new,'CellLabelColor', 'None');
h.XLabel =('Parameter $c$');
h.YLabel =('Parameter  $c_1$');
h.Title = '$MT_{X\rightarrow Y}$';
h.NodeChildren(3).XAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).XAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).YAxis.Label.Interpreter = 'latex';
h.NodeChildren(3).YAxis.TickLabelInterpreter = 'latex';
h.NodeChildren(3).Title.Interpreter = 'latex';
h.XDisplayLabels = CustomXLabels;
h.YDisplayLabels = CustomYLabels;
colormap('jet(7)')
caxis([0, 1]);
colorbar('off')
set(gca,FontSize=font);

end
