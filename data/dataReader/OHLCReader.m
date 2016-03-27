function [ output ] = OHLCReader( stringType )

	switch(stringType)
		case 'd'
			output = 1;
		case 'date'
			output = 1;
		
		case 'open'
			output = 2;
		case 'o'
			output =2;
			
		case 'high'
			output = 3;
		case 'h'
			output = 3;
			
		case 'low'
			output = 4;
		case 'l'
			output = 4;
			
		case 'close'
			output = 5;
		case 'c'
			output = 5;
			
		case 'volume'
			output = 6;
		case 'v'
			output = 6;
	end

end

