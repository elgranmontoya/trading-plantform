function [ low ] = lows( Number )

	global DataSet;    
	[t,n] = size(DataSet);
	
	if n < 3
	
		disp('Error: The data type is not correct');
	
	elseif t < Number

		disp('Error: The Low Vectors are not long enough');
	
	elseif t < Number & n < 3
		
		disp('Error: The data type is not correct');
		disp('Error: The Low Vectors are not long enough');
	else
	
		low = DataSet(end - Number,4);
	end

end

