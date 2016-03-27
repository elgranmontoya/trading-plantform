function [ output] = priceDetect(rowData,stringType)
	%Check number of Vector
	NVector = size(rowData,1);
	switch (NVector)
		case 1 % date  price 
			[output] = priceReader(stringType);
		case 2 % date ,price , volume
			[output] = priceReader(stringType);
		case 3 % date, Open, High, Low , Close  
			[output] = OHLCReader(stringType);
		case 4 % date,Open, High, Low , Close , Volume
			[output] = OHLCReader(stringType);
		otherwise
			disp('Data Format is Wrong');

	end	

end

