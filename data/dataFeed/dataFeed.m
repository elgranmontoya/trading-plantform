function [ OutPut ] = dataFeed(SymbolName, dataType,rowData,period,type)
  %% add the path 
   addpath('../dataHandle')
  %% loading the data and call the handle function
  
% Modified by Wei Ni 2016/2/28 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%   type : Year: 1 , Month: 2 , Day: 3, Hours: 4                  %
%		   Minutes: 5, Seconds: 6                                 %
%   period: time period ex: 5 minutes period = 5                  %
%                                                                 %
%   dataType : (1) date & price (2) date & price & volume         %
%              (3) date , open ,high, low , close                 %
%              (4) date , open , high , low , close , volume      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     OutPut  = SeperateData(rowData,dataType,period ,type);
   
 

end

