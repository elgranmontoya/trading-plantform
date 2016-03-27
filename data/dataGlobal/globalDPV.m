function  globalDPV(DataSet)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    global date;
    global price;
    global volume;
    date= DataSet(end,1);
    price = DataSet(end,2);
    volume = DataSet(end,3);
   

end

