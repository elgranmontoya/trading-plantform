function  globalData( dataType,DataSet )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
	switch dataType
		
		case 2 % date price
			gloalDP(DataSet);		
		case 3 % date price volume
			globalDPV(DataSet);
		case 4 % date open high low close 
			
            gloalDOHLC(DataSet); 
		case 5 % date open high low close volume
			gloalDOHLCV(DataSet);	
	end

end

