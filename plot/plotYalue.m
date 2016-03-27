function [ Yvalue ] = plotYalue(fplot,n)
    
    temp = get(fplot,'YLim');
    Max = max(temp);
	Min = min(temp);
	distant = (Max - Min)/n;
    Yvalue = nan(1,n);
    for i = 1:n
        Yvalue(i) = distant * i + Min;
    end
        
end

