function [xDataTfModel, yDataTfModel] = csvToTfEst(input_data_string, nb_system_poles, time_data_column, x_data_column, y_data_column, u_data_column, row_offset, column_offset, sanity_check, x_out, y_out)
%csvToTfEst Takes in csv filename and converts it to TF model via tfest
% 
%   Also capable of performing a 'sanity-check' on the data by plotting it.
%   Example of input_data_string = 'fileName.csv'
%   if (sanity_check == 1) ==> produces data graphs of acquired data
%   if (x_out == 1) ==> tfest model for x-data will be displayed
%   if (y_out == 1) ==> tfest model for y-data will be displayed
%   All other inputs are integers and their use is detailed by their names

%% Grab data

data = csvread(input_data_string, row_offset, column_offset);

timeData = data(:,time_data_column);

yData = data(:,x_data_column);

xData = data(:,y_data_column);

uData = data(:,u_data_column);

Ts = timeData(2)-timeData(1);

%% Data sanity check
if sanity_check == 1
    disp('Running Sanity-Check Graphs on Data')
    figure(1)

    subplot(311)
    plot(timeData,uData)
    ylabel('Input, u (V)')
    xlabel('Time (sec)')
    title(strcat('Sanity Check: ',input_data_string))

    subplot(312)
    plot(timeData, xData)
    ylabel('X-displacement Output (V)')
    xlabel('Time (sec)')

    subplot(313)
    plot(timeData, yData)
    ylabel('Y-displacement Output (V)')
    xlabel('Time (sec)')
end

%% Clean data for tfest
xDataFormatted = iddata(xData, uData, Ts);
yDataFormatted = iddata(yData, uData, Ts);

%% Run tfest
if x_out == 1
    xDataTfModel = tfest(xDataFormatted, nb_system_poles);
end
if y_out == 1
    yDataTfModel = tfest(yDataFormatted, nb_system_poles);
end
end

