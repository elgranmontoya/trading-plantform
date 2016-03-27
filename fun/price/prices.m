function [ price ] = prices(number)
    
	global DataSet;
	
    
	[t,n] = size(DataSet);
    
	if t <= number
        disp('Error: The Price Vector is not long enough');
        % This will run error 
        
    else
		switch n 
			case 2% date, price
	
				price = DataSet(end - number,end);
			case 3% date, price, volume
				price = DataSet(end - number,end - 1);
			case 4 % date, open ,high ,low ,close
				price = DataSet(end - number,end);
			case 5 % date , open, high , low, close, volume
				price = DataSet(end - number, end-1);
		end%end_switch
    end%end_if
end

