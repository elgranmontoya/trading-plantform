function CandleStick( assetTable,colorLine, colorUp,colorDown)
            date = assetTable(:,1);
			O = assetTable(:,2);
			H = assetTable(:,3);
			L = assetTable(:,4);
			C = assetTable(:,5);
			% w = Width of body, change multiplier to draw body thicker or thinner
			% the 'min' ensures no errors on weekends ('time gap Fri. Mon.' > wanted
			% spacing)
            n = length(date);
            
			if n < 3
                w=0.0001;
            else
                w=.3*min([(date(2)-date(1)) (date(3)-date(2))]);
            end
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
	datetick('x',21);
 
end

