function [ dataTable ] = OHLCV(dataTable,Time,Input,ValumeOpen,period)
		
 
	%% indicator
	Date = 1;
	Open = 2;
	High = 3;
	Low = 4;
	Close = 5;
	Volume =6;
	
	
	if Time >=	period % new coloum for  storage new information
		
		Date = Input(1,1);
		O = Input(1,2);
		H = Input(1,2);
		L = Input(1,2);
		C = Input(1,2);
		
		if ValumeOpen == true
			
			V = Input(1,3);		
			ValueSet = [Date,O,H,L,C,V];
		else
			ValueSet = [Date,O,H,L,C];
		end%end_if_ValumeOpen
		
		
		dataTable = [dataTable; ValueSet];	
	
	else % old storage
		if  dataTable(end,High) < Input(1,2)
			
			dataTable(end,High) = Input(1,2);
			dataTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				dataTable(end,Volume) = dataTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen
		
		
		elseif dataTable(end,Low) > Input(1,2)
			
			dataTable(end,Low) = Input(1,2);
			dataTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				dataTable(end,Volume) = dataTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen
		
		else
			
			dataTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				dataTable(end,Volume) = dataTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen		
		
		end%end_if_dataTable
	end%end_if_Time
    
	

end

