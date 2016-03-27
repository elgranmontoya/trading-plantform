
function [ Table ] = SeperateData(rowData,dataType,type,period)

    switch dataType
	
		case 1 % date & price
			data = dp(rowData);
            Table = dataTable(data);
		case 2 % date , price , volume
			data = dpv(rowData);
			Table = dataTable(data);
		case 3 % date , open, high , low , close
			data = dohlc(rowData,type,period);
			Table = dataTable(data);
		case 4 % date , open , high, low , close , volume
			data = dohlcv(rowData,type,period);
			Table = dataTable(data);
	end

end

