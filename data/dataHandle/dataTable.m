function [Table] = dataTable(data)
	
	%% Find out the data size
   
	Ntype = size(data,2);
	
	%% seperate the data
	switch Ntype
		
		case 2
            
			Table = table;
			Table.date = data(:,1);
			Table.price = data(:,2);
		
		case 3
			
			Table = table;
			Table.date = data(:,1);
			Table.price = data(:,2);
			Table.volume = data(:,3);
			
		case 5
		
			Table = table;
			Table.date = data(:,1);
			Table.open = data(:,2);
			Table.high = data(:,3);
			Table.low = data(:,4);
			Table.close = data(:,5);
			
		case 6
			
			Table = table;
			Table.date = data(:,1);
			Table.open = data(:,2);
			Table.high = data(:,3);
			Table.low = data(:,4);
			Table.close = data(:,5);
            Table.volume = data(:,6);
	end		
end

