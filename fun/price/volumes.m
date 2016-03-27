function [ volume ] = volumes( Number )
	
	global DataSet;    
	[t,n] = size(DataSet);
	
	if n < 4
	
		disp('Error: The data type is not correct');
	
	elseif t < Number

		disp('Error: The Volume Vectors are not long enough');
	
	elseif t < Number & n < 4
		
		disp('Error: The data type is not correct');
		disp('Error: The Volume Vectors are not long enough');
	else
	
		volume = DataSet(end - Number,6);
	end


end

