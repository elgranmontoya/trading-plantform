function [ high ] = highs( Number )
	global DataSet;    
	[t,n] = size(DataSet);
	
	if n < 3
	
		disp('Error: The data type is not correct');
	
	elseif t < Number

		disp('Error: The High Vectors are not long enough');
	
	elseif t < Number & n < 3
		
		disp('Error: The data type is not correct');
		disp('Error: The High Vectors are not long enough');
	else
	
		high = DataSet(end - Number,3);
	end


end

