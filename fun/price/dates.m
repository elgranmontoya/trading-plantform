function [ result ] = dates( Number )
    global DataSet;
    [t] = size(DataSet,1);
	
    %% Create a date vector
	date = [];
	formatOut = 'dd/mm/yyyy';		
	date = [date datenum(datestr(DataSet(1,1),formatOut))];
	%% Store the different date in vector
	temp = datenum(datestr(DataSet(1,1),formatOut));
	%Stroe different date
	
	for I_Day = 1: t
		
		if (temp - datenum(datestr(DataSet(I_Day,1),formatOut)))> 0
				temp = datenum(datestr(DataSet(I_Day,1),formatOut));
				date = [date ;temp];
        end%end_if_I_Day
	
	end%end_for_I_Day
	
	NDate = size(date);
	if NDate < Number
        disp('Error: The Price Vector is not long enough');
        % This will run error 
        
    else		
		result = datestr(date(Number));
    end%end_if
	 
	
end