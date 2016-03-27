function [ close ] = closes( Number )
	
	global DataSet;    
	[t,n] = size(DataSet);
	
	if n < 3
	
		disp('Error: The data type is not correct');
	
	elseif t < Number

		disp('Error: The Close Vectors are not long enough');
	
	elseif t < Number & n < 3
		
		disp('Error: The data type is not correct');
		disp('Error: The Close Vectors are not long enough');
	else
	
		close = DataSet(end - Number,5);
	end


end

