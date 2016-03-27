
	load assetTable
	closed = assetTable(:,5);
	date = assetTable(:,1);
	volume = assetTable(:,6);
	%Number of vector
	switch type
		case 1
			%%(1) Plot only Close Price	
			plot(date,closed,'linewidth',2);

			ylabel('Price');
			xlabel('Date');
			title('XXX Stock');
			grid on;
			dateaxis('x',1,datestr(date(1)));
		case 2
		%%(2) Plot Close price & Volume
			Max = max(closed);
			Min = min(closed);
			distant = (Max - Min)/4;
			Q1 = distant + Min;
			Q2 = distant * 2 + Min;
			Q3 = distant * 3 + Min;
			Q4 = distant * 4 + Min;
			axes('position',[.15  .25  .8  .7]);
			plot(date,closed);
			line(X,Y);
            set(gca,'ytick',[]);
            grid on;
			ylabel('Price');
			title('XXX Stock');
			set(gca,'xtick',[]);
			set(gca,'ytick',[Q1,Q2,Q3,Q4]);
			axes('position',[.15  .15  .8  .15]);
			bar(date,volume);
			set(gca,'YGrid','on');		
			xlabel('Date');
			ylabel('Volume');        
			dateaxis('x',1,datestr(date(1)));
	
		case 3
			%%(3) Plot candlestick with Open, High, Low , Close
			% parameters
			colorLine = 'k';
			colorUp = 'r';
			colorDown = 'g';
			date = assetTable(:,1);
			O = assetTable(:,2);
			H = assetTable(:,3);
			L = assetTable(:,4);
			C = assetTable(:,5);
			% w = Width of body, change multiplier to draw body thicker or thinner
			% the 'min' ensures no errors on weekends ('time gap Fri. Mon.' > wanted
			% spacing)
			w=.3*min([(date(2)-date(1)) (date(3)-date(2))]);
			%% Find up and down days
			d=C-O;
			l=length(d);
			hold on
			%% draw line from Low to High
			for i=1:l
			   line([date(i) date(i)],[L(i) H(i)],'Color',colorLine);
			end
			%% draw Down Color (or user defined) body (down day)
			
			n=find(d<0);
			
			for i=1:length(n)
				x=[date(n(i))-w date(n(i))-w date(n(i))+w date(n(i))+w date(n(i))-w];
				y=[O(n(i)) C(n(i)) C(n(i)) O(n(i)) O(n(i))];
				fill(x,y,colorDown)
			end
			
			%% draw Up Color (or user defined) body(up day)%%%%%%%%%%%%%%%%%%%
			
			n=find(d>=0);
			
			for i=1:length(n)
				x=[date(n(i))-w date(n(i))-w date(n(i))+w date(n(i))+w date(n(i))-w];
				y=[O(n(i)) C(n(i)) C(n(i)) O(n(i)) O(n(i))];
				fill(x,y,colorUp)
			end
			hold off
				
			ylabel('Price');
			xlabel('Date');
			title('XXX Stock');
			dateaxis('x',1,datestr(date(1)));

	%%(4) Plot candlestick with Open, High, Low , Close, Volume
		case 4
			axes('position',[.15  .25  .8  .7]);
				% parameters
			colorLine = 'k';
			colorUp = 'r';
			colorDown = 'g';
			Max = max(assetTable(:,3));
			Min = min(assetTable(:,4));
			distant = (Max - Min)/4;
			Q1 = distant + Min;
			Q2 = distant * 2 + Min;
			Q3 = distant * 3 + Min;
			Q4 = distant * 4 + Min;
			
			
			
			date = assetTable(:,1);
			O = assetTable(:,2);
			H = assetTable(:,3);
			L = assetTable(:,4);
			C = assetTable(:,5);
			V = assetTable(:,6);
			% w = Width of body, change multiplier to draw body thicker or thinner
			% the 'min' ensures no errors on weekends ('time gap Fri. Mon.' > wanted
			% spacing)
			w=.3*min([(date(2)-date(1)) (date(3)-date(2))]);
			%% Find up and down days
			d=C-O;
			l=length(d);
			hold on
			%% draw line from Low to High
			for i=1:l
			   line([date(i) date(i)],[L(i) H(i)],'Color',colorLine);
			end
			%% draw Down Color (or user defined) body (down day)
			n=find(d<0);
		
			for i=1:length(n)
				x=[date(n(i))-w date(n(i))-w date(n(i))+w date(n(i))+w date(n(i))-w];
				y=[O(n(i)) C(n(i)) C(n(i)) O(n(i)) O(n(i))];
				fill(x,y,colorDown)
			end
			%% draw Up Color (or user defined) body(up day)%%%%%%%%%%%%%%%%%%%
			n=find(d>=0);
		
			for i=1:length(n)
				x=[date(n(i))-w date(n(i))-w date(n(i))+w date(n(i))+w date(n(i))-w];
				y=[O(n(i)) C(n(i)) C(n(i)) O(n(i)) O(n(i))];
				fill(x,y,colorUp)
			end
			hold off
			
			ylabel('Price');
			title('XXX Stock');
			set(gca,'xtick',[]);
			set(gca,'ytick',[Q1 Q2 Q3 Q4]);
			axes('position',[.15  .15  .8  .15])
			bar(date,V);
			set(gca,'YGrid','on');		
			xlabel('Date');
			ylabel('Volume');        
			dateaxis('x',1,datestr(date(1)));
	end