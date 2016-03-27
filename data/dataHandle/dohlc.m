function [SepData] = dohlc(rowData,period ,type)

    SepData  = tick2DOHLCV( rowData(:,1:2),period ,type );


end

