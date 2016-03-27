function [ output ] = PLReader( stringType )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

	switch stringType
		
		case 'assetType'			
			output = 1;		
		case 'symbol'			
			output = 2;		
		case 'entryDate'			
			output = 3;
		case 'entryPrice'
			output = 4;
		case 'entryVolume'
			output = 5;
		case 'holdingPrice'
			output = 6;
		case 'holdingDate'
			output = 7;
		case 'holdingVolume'
			output = 8;
		case 'closingPrice'
			output= 9;
		case 'closingDate'
			output = 10;
		case 'closingVolume'
			output = 11;
		case 'singleMulti'
			output = 12;
		case 'unrealizedPL'
			output = 13;
		case 'Commission'
			output = 14;
		case 'Slippage'
			output = 15;
		case 'realizedPL'
			output = 16;
		case 'accumulatePL'
			output = 17;
	end

end

