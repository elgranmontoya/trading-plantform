function [ SepData ] = dohlcv( rowData ,period,type)

    
    SepData  = tick2DOHLCV(rowData,period ,type);


end

