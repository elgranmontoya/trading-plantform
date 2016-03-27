function [ open ] = opens( Number )
	global DataSet;    
	[t,n] = size(DataSet);
	
	if n < 3
	
		disp('Error: The data type is not correct');
	
	elseif t < Number

		disp('Error: The Open Vector is not long enough');
	
	elseif t < Number & n < 3
		
		disp('Error: The data type is not correct');
		disp('Error: The Open Vector is not long enough');
	else
	
		open = DataSet(end - Number,2);
	end

end

