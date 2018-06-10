function [ output_args ] = DrawGraph( resGroup)
%DRAWGRAPH Summary of this function goes here
%   Detailed explanation goes here

drawGraphData = resGroup;
% fig = figure;
xlabel('angle');
hold on;
ylabel('cell number');
hold on;
% axis([-90,90,0,10]);
barData = [];
highest = 0;
for i = 1:18
    [row col] = find([drawGraphData.Orientation]'>-90+(i-1)*10&...
        [drawGraphData.Orientation]'<-90+i*10);
%     row = intersect(row1,row2);
    plot([(-90+(i-1)*10+(-90)+i*10)/2,(-90+(i-1)*10+(-90)+i*10)/2],...
        [0,size(row,1)],'linewidth',10,'color',[0,0.6,0.8]);
    highest = max(highest, size(row,1));
    hold on;
end
% ylim ([0,30]);
set(gca,'xtick',-90:30:90);
hold on;
set(gca,'ytick',0:5:80);
hold on;

text(70,highest,['N = ' num2str(size(drawGraphData,1))]);

% saveas(fig,filename,'fig');
% saveas(fig,filename,'eps');
end



