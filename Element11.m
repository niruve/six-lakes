% Extracts data file
url = 'https://coastwatch.glerl.noaa.gov/ftp/glsea/avgtemps/2018/glsea-temps2018_1024.dat';
options = weboptions('ContentType','table');
data = webread(url,options);

% Omits all words
data(1:2,:) = [];

% Changes variable title
data.Properties.VariableNames{1} = 'Year';
data.Properties.VariableNames{2} = 'Day';
data.Properties.VariableNames{3} = 'Sup';
data.Properties.VariableNames{4} = 'Mich';
data.Properties.VariableNames{5} = 'Huron';
data.Properties.VariableNames{6} = 'Erie';
data.Properties.VariableNames{7} = 'Ont';
data.Properties.VariableNames{8} = 'StClr';

% Converts string to double
data.Year = str2double(data.Year);
data.Day = str2double(data.Day);
data.Sup = str2double(data.Sup);
data.Mich = str2double(data.Mich);
data.Huron = str2double(data.Huron);
data.Erie = str2double(data.Erie);
data.Ont = str2double(data.Ont);
data.StClr = str2double(data.StClr);

% Creates lake variables
Day = data.Day;
Sup = data.Sup;
Mich = data.Mich;
Huron = data.Huron;
Erie = data.Erie;
Ont = data.Ont;
StClr = data.StClr;

%%% Swimming %%%
SupSwim = [365 length(find(Sup > 20))];
MichSwim = [365 length(find(Mich > 20))];
HuronSwim = [365 length(find(Huron > 20))];
ErieSwim = [365 length(find(Erie > 20))];
OntSwim = [365 length(find(Ont > 20))];
StClrSwim = [365 length(find(StClr > 20))];

% Pie Chart %
t = tiledlayout(2,3);
ax1 = nexttile;
pie(ax1,SupSwim);
title('Superior')

ax2 = nexttile;
pie(ax2,MichSwim)
title('Michigan')

ax3 = nexttile;
pie(ax3,HuronSwim);
title('Huron')

ax4 = nexttile;
pie(ax4,ErieSwim);
title('Erie')

ax5 = nexttile;
pie(ax5,OntSwim);
title('Ontario')

ax6 = nexttile;
pie(ax6,StClrSwim);
title('St. Clair')