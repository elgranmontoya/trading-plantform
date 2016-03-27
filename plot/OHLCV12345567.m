function [ assetTable ] = OHLCV(assetTable,Time,Input,ValumeOpen,period)
	
	Date = 1;
	Open = 2;
	High = 3;
	Low = 4;
	Close = 5;
	Volume =6;
	
	
	if Time >=	period % new storage 
		Date = Input(1,1)
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
		
		
		assetTable = [assetTable; ValueSet];	
	else % old storage
		if assetTable(end,High) < Input(1,2)
			
			assetTable(end,High) = Input(1,2);
			assetTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				assetTable(end,Volume) = assetTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen
		
		
		elseif assetTable(end,Low) > Input(1,2)
			
			assetTable(end,Low) = Input(1,2);
			assetTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				assetTable(end,Volume) = assetTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen
		
		else
			
			assetTable(end,Close) = Input(1,2);
			
			if ValumeOpen == true
				assetTable(end,Volume) = assetTable(end,Volume)...
				+ Input(1,3);
			end%end_if_ValumeOpen		
		
		end%end_if_assetTable
	end%end_if_Time


end

