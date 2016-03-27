function  gloalDP( DataSet )
    global price;
    global date;
    price = DataSet(end,2);
    date = DataSet(end,1);

end

