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

% Graphs %
GSup = plot(Sup)
hold on
GMich = plot(Mich,'--')
hold on
GHuron = plot(Huron,'LineWidth',1.25)
hold on
GErie = plot(Erie,':','LineWidth',1)
hold on
GOnt = plot(Ont,'-.')
hold on
GStClr = plot(StClr,':','LineWidth',1.5)
hold off
ylabel('Temperature (C)')
xlabel('Days')
legend('Sup','Mich','Huron','Erie','Ont','StClr')
title('Temperature of all Lakes')
