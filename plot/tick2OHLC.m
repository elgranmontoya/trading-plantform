function [ OHLC ] = tick2OHLC(assetTable,Input,period ,type)
% Modified by Wei Ni 2016/2/28 %%%%%%%%%%%%%%%%%%%% 
%   type : Year: 1 , Month: 2 , Day: 3, Hours: 4  %
%		   Minutes: 5, Seconds: 6				  %
%   period: time period ex: 5 minutes period = 5  %
%   assetTable = Record Date,Open,High,Low, Close %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    
    %%
    n = size(Input,2);
	%% Check the data with volume or not
	ValumeOpen = false;
	if n ==3
		ValumeOpen =true;
	end

	%%check the assetTable is empty or not
	if isempty(assetTable)==1
		Date = 1;
		Open = 2;
		High = 3;
		Low = 4;
		Close = 5;
		Volume =6;
		assetTable(Date) = Input(1,1);
		assetTable(Open) = Input(1,2);
		assetTable(High) = Input(1,2);
		assetTable(Low) = Input(1,2);
		assetTable(Close) = Input(1,2);
        if ValumeOpen ==true
            assetTable(Volume) = Input(1,3);
        end
	end
	
	t = size(Input,1);
	for I_date = 1:t
		if assetTable(end,1) <= Input(I_date,1)
			[Year,Month,Day,Hours,Minutes,Seconds] = ...
			datevec(Input(I_date,1)- assetTable(end,1));
		else
			break;
		end
		switch type
			
			
			case 1 %Year
				
				[ OHLC ] = OHLCV(assetTable,Year,Input(I_date,:),ValumeOpen,period);

			case 2 %Month
				
				[ OHLC ] = OHLCV(assetTable,Month,Input(I_date,:),ValumeOpen,period);

			case 3 %Day
				
				[ OHLC ] = OHLCV(assetTable,Day,Input(I_date,:),ValumeOpen,period);

			case 4 %Hours
				
				[ OHLC ] = OHLCV(assetTable,Hours,Input(I_date,:),ValumeOpen,period);
			
			case 5 %Minutes
				
				[ OHLC ] = OHLCV(assetTable,Minutes,Input(I_date,:),ValumeOpen,period);
			
			case 6 %Seconds

				[ OHLC ] = OHLCV(assetTable,Seconds,Input(I_date,:),ValumeOpen,period);

		end%end_switch
	
	end%end_for_I_date

end
