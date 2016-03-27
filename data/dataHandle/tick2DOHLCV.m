function [ dataTable ] = tick2DOHLCV(rowData,period ,type )
% Modified by Wei Ni 2016/2/28 %%%%%%%%%%%%%%%%%%%% 
%   type : Year: 1 , Month: 2 , Day: 3, Hours: 4  %
%		   Minutes: 5, Seconds: 6				  %
%   period: time period ex: 5 minutes period = 5  %
%   dataTable = Record Date,Open,High,Low, Close  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
	
	
	%% Check the data with volume or not
	n = size(rowData,2);
	ValumeOpen = false;
	if n ==3
		ValumeOpen =true;
	end

	%% initial the data	    
    Date = 1;
	Open = 2;
	High = 3;
	Low = 4;
	Close = 5;
	Volume =6;

	dataTable(Date) = rowData(1,1);
	dataTable(Open) = rowData(1,2);
	dataTable(High) = rowData(1,2);
	dataTable(Low) = rowData(1,2);
	dataTable(Close) = rowData(1,2);
	
	if ValumeOpen == true
		dataTable(Volume) = rowData(1,3);		
	end
	
	t = size(rowData,1);
	%% Fill in the dataTable
	for I_date = 1:t
		
        if (dataTable(end,1) <= rowData(I_date,1))
            %% calculate the time interval
 			[Year,Month,Day,Hours,Minutes,Seconds] = ...
 			datevec(rowData(I_date,1)- dataTable(end,1));
			% calculate tow vectors time interval
		else
			% If the order of time series is wrong, this
			% function will run case 7 for breaking
			type = 6;
        end
        
        switch type
			
			
			case 1 %Year
				
				[ dataTable ] = OHLCV(dataTable,Year,rowData(I_date,:),ValumeOpen,period);
                
			case 2 %Month
				
				[ dataTable ] = OHLCV(dataTable,Month,rowData(I_date,:),ValumeOpen,period);
              
			case 3 %Day
				
				[ dataTable ] = OHLCV(dataTable,Day,rowData(I_date,:),ValumeOpen,period);
              
			case 4 %Hours
				
				[ dataTable ] = OHLCV(dataTable,Hours,rowData(I_date,:),ValumeOpen,period);
                
			case 5 %Minutes
				
				[ dataTable ] = OHLCV(dataTable,Minutes,rowData(I_date,:),ValumeOpen,period);
               
			case 6 %Seconds

				[ dataTable ] = OHLCV(dataTable,Seconds,rowData(I_date,:),ValumeOpen,period);
            
			case 7% wrong time series
				break;
		end%end_switch
	
	end%end_for_I_date





end

