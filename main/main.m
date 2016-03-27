close all
%% set up the path
% data path
addpath('../data/dataFeed');
addpath('../data/dataHandle');
addpath('../data/dataReader');
addpath('../data/dataGlobal');
% function path
addpath('../fun/tradeFun');
% plot path
addpath('../plot');

%% Data Type Set Up
    
%% initial global parameter
global DataSet;
DataSet = [];
global price;
global date;
global open;
global high;
global low;



%% loading data

% Modified by Wei Ni 2016/2/28 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%   type : Year: 1 , Month: 2 , Day: 3, Hours: 4                  %
%		   Minutes: 5, Seconds: 6                                 %
%   period: time period ex: 5 minutes period = 5                  %
%                                                                 %
%   dataType : (1) date & price (2) date & price & volume         %
%              (3) date , open ,high, low , close                 %
%              (4) date , open , high , low , close , volume      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

OutPut  = dataFeed(SymbolName, dataType,rowData,period,type);

[Ntime] =size(OutPut,1);	
BeginTime = 3;
EndTime = Ntime;
h=figure
xlabel('Date');
ylabel('Price');
title('xxx Stock');
hold on 
period = 5;
type = 5;
DataSet = [table2array(OutPut(1,:)); table2array(OutPut(2,:))];
%% loading data into dataSet 
%real time
%EndTime = size(rowData,1);
%history
EndTime = 6;
for I_time =1 : EndTime	
	
	%% global data function%  
	% price , volume, 	   % 
	% date				   %
	%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% run real time data
    %DataSet  = tick2DOHLCV(rowData(1:I_time,1:3),period ,type );
    
    %% run history time data
    DataSet = [DataSet; table2array(OutPut(I_time,:))];

    
    %% Run MainPlot.m for plotting 
    axis auto
    run('MainPicture');
        
		
	% renew the time 
	%BeginTime = EndTime;
   
end%end_for_I_time
hold off

%% Main plot Function

 