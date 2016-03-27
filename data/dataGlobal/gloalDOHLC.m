function  gloalDOHLC(DataSet)
    global date;
    global open;
    global high;
    global low;
    global close;
    global price;
    date = DataSet(end,1);
    open = DataSet(end,2);
    high = DataSet(end,3);
    low =  DataSet(end,4);
    close = DataSet(end,5);
    price = DataSet(end,5);

end

