function [ output] = priceReader( stringType )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
	switch(stringType)
		case 'date'
			output = 1;
		case 'price'
			output = 2;
		case 'volume'
			output = 3;	
	end

end

