function [ OutPut ] = dataMerge( Input )
	addpath('../dataReader')
	%%  If the time is same, we merge the data
		OutPut = [];
		NTime = size(Input,1);
		valueSet = [Input(1,priceReader('date')) Input(1,priceReader('price')) Input(1,priceReader('volume'))];
		OutPut = [OutPut valueSet];
		for I_Time = 2 : NTime
			
			%% if the time & price is the same , merge the data and by plus the volume
			%if Input(I_Time,priceReader('date')) == Input(I_Time-1,priceReader('date'))...
			%&	Input(I_Time,priceReader('price')) == Input(I_Time-1,priceReader('date'))
				
				%% accumulate the volume 
				%OutPut(end,priceReader('volume')) = OutPut(end,priceReader('volume')) + Input(I_Time,priceReader('volume'));
			%% if the timt is same with different price , update the price and plus the volume
			if Input(I_Time,priceReader('date')) == Input(I_Time-1,priceReader('date'))
				
				%% Update the price 
				OutPut(end,priceReader('price')) = Input(I_Time,priceReader('price'));
				%% accumulate the volume 
				OutPut(end,priceReader('volume')) = OutPut(end,priceReader('volume')) + Input(I_Time,priceReader('volume'));
			
			%% Move to the next row			
			else
				valueSet = [Input(I_Time,priceReader('date')) Input(I_Time,priceReader('price')) Input(I_Time,priceReader('volume'))];
				OutPut = [OutPut ;valueSet];
			end
		end

end

