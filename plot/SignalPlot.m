function  SignalPlot( Table )
%% Table
% assetType = 1;
% symbol = 2;
% entryDate = 3;
% entryPrice = 4;
% entryVolume = 5;
% holdingPrice = 6;
% holdingDate = 7;	
% holdingVolume = 8
% closingPrice = 9;
% closingDate  = 10;
% closingVolume = 11;	
% singleMulti = 12;
% unrealizedPL = 13;
% Commission = 14;
% Slippage = 15;
% realizedPL = 16;
% accumulatePL = 17;


%%
	[NTrade,NItem]  =  size(Table);	
	
	FirstX = [];
	FirstY = [];
	SecondX = [];
	SecondY = [];
	
	for I_trade = 1 : NTrade		
		
			% Buy -> cash flow out < 0
			if NTrade(I_trade,PLReader('entryPrice')) < 0
				% record plot position
				x = Table(I_trade, PLReader('entryDate'));
				y = Table(I_trade, PLReader('entryPrice'));;
				
				% record plot PL position
				FirstX = [FirstX x];
				FirstY = [FirstY y];
				
				% BuySingal
				plot(x,y,'^','Color','g','MarkerFaceColor', 'g');
				text(x-0.3 ,y-0.3,'Buy');
			end 
			
			% offset Buy -> cash flow in  > 0
			if NTrade(I_trade,PLReader('closingPrice') > 0
				
				% record plot position
				x = Table(I_trade, PLReader('closingDate'));
				y = Table(I_trade, PLReader('closingPrice'));

				
				% record plot PL position
				SecondX = [SecondX x];
				SecondY = [SecondY y];
				
				plot(x,y,'v','Color','k','MarkerFaceColor','k'); 
				text(x+0.1 ,y+0.1,'Offset');
			end
			
			% Sell -> cash flow in > 0 
			
			if NTrade(I_trade,PLReader('entryPrice')) > 0
				
				% record plot position
				x = Table(I_trade, PLReader('entryDate'));
				y = Table(I_trade, PLReader('entryPrice'));
				
				
				
				% record plot PL position
				FirstX = [FirstX x];
				FirstY = [FirstY y];
				
				plot(x,y,'v','Color','r','MarkerFaceColor', 'r');
				text(x+0.1 ,y+0.1,'Sell');
			end
			
			% Offset Sell -> cash flow out < 0
			if NTrade(I_trade,PLReader('closingPrice')) < 0
				
				% record plot position
				x = Table(I_trade, PLReader('closingDate'));				
				y = Table(I_trade, PLReader('closingPrice'));
				
				
				% record plot PL position
				SecondX = [SecondX x];
				SecondY = [SecondY y];
				
				
				plot(x,y,'^','Color','k','MarkerFaceColor','k'); 
				text(x-0.3 ,y-0.3,'Offset');			
			end		

	
	end%end_for_I_trade
	
	%% check number of finish trade
	NFinish = length(SecondX);
	
	% The trade is not finish
	if mod(NFinish,2) ~= 0
		NFinish = NFinish - 1;
	end
	I_Finish = 1;
	
	for I_Trade = 1 : NTrade
		if I_Finish < = NFinish	
				% draw the profit line
				if NTrade(I_trade,PLReader(realizedPL)) > 0
					% profitTrade 
					x = [FirstX(I_Finish) SecondX(I_Finish + 1)];
					y = [FirstY(I_Finish) SecondY(I_Finish + 1)];
					line(x,y,'Color','g','LineStyle','--', 'LineWidth', 2)
					I_Finish = I_Finish + 1;
				end
				
				% draw the loss lint
				if NTrade(I_trade,PLReader(realizedPL)) < 0
				% lossTrade
					x = [FirstX(I_Finish) SecondX(I_Finish + 1)];
					y = [FirstY(I_Finish) SecondY(I_Finish + 1)];
					line(x,y,'Color','r','LineStyle','--', 'LineWidth', 2)
					I_Finish = I_Finish + 1;
				end	
		
		end%if_I_Finish 
	end%end_for_I_Trade
	

end

