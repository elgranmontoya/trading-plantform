addpath('../data/dataReader')
	%Number of vector
	switch PlotType
		case 1
		%%(1) Line Chart: Plot only Close Price	& Date
			if size(DataSet,2) == 2
                
				plot(DataSet(:,priceReader('date')),DataSet(:,priceReader('price')),'k','linewidth',2);
                
				%hold on
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%									 %
				% plot other Singal                  %
				%                                    %
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %hold off
				ylabel('Price');
				xlabel('Date');
				title('XXX Stock');
				datetick('x',21);
				grid on;
				
			else				
				disp('The Matrix of Data is Wrong');
			end
		case 2
		%%(2) Line Chart: Plot Close price & Volume & Date
			
			if size(DataSet,2) == 3
				
				f=subplot(8,1,1:6);
				%% plot Price 		
				%DataSet=dataMerge(DataSet)		
				plot(DataSet(:,priceReader('price')),'k','linewidth',2);
				ylabel('Price');
				title('XXX Stock');
				
				set(gca,'xtick',[]);
				
				%hold on              
                
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%									 %
				% plot other Singal                  %
				%                                    %
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                n =4; %number of sector
                [ Yvalue ] = plotYalue(f,n); % find the picture of Y YAxis  value
				set(gca,'ytick',Yvalue);
                %hold off
				%% Plot Volume here
				subplot(8,1,8);
                subplot('Position',[0.13 0.12 0.775 0.2]);
				
				bar(DataSet(:,priceReader('volume')));				
				start = DataSet(1,priceReader('date'));
				last = DataSet(end,priceReader('date'));
				
				time = linspace(start,last,11);				
				time = {datestr(time,0)};			
				set(gca,'XTickLabel',time);
				fix_xticklabels(gca,0.1,{'FontSize',10});
				set(gca,'YGrid','on');		
				xlabel('Date');
				ylabel('Volume');
				
				
            else
				disp('The Matrix of Data is Wrong');
			end
	
		case 3
			
			%% (3) Plot CandleStick with  Open, High, Low , Close , Date
			if size(DataSet,2) == 5
				
				colorLine = 'k';
				colorUp = 'r';
				colorDown = 'g';
				%% plot Price here			
                cla reset
				
				CandleStick( DataSet,colorLine, colorUp,colorDown);
                	
                %hold on                
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%									 %
				% plot other Singal                  %
				%                                    %
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %hold off

				xlabel('Date');
                ylabel('Price');
                title('xxx Stock');
				datetick('x',21);
				
			else
				disp('The Matrix of Data is Wrong');
			end	
		case 4	
			%% (4) Plot CandleStick with Date, Open, High, Low , Close ,volume 
			if size(DataSet,2) == 6			
				
				colorLine = 'k';
				colorUp = 'r';
				colorDown = 'g';
				subplot(8,1,1:6); 				
				% plot Price here
				cla reset				
				axis auto
				f=subplot(8,1,1:6);				
				CandleStick(DataSet,colorLine, colorUp,colorDown)
				
				ylabel('Price');
				title('XXX Stock');
				set(gca,'xtick',[]);				
				
                %hold on
                
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%									 %
				% plot other Singal                  %
				%                                    %
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %hold off
                n = 5;% number of sector
                [ Yvalue ] = plotYalue(f,n);% find the picture of Y YAxis  value
				set(gca,'ytick',Yvalue);
				% Plot Volume here
				subplot(8,1,8)
				subplot('Position',[0.13 0.12 0.775 0.2])

				bar(DataSet(:,1),DataSet(:,end));
				xlabel('Date');
				ylabel('Volume');
				datetick('x',21);
			else
			
				disp('The Matrix of Data is Wrong');
			end
		
		
			
        case 5
            NPlot = 6;
			MainPlot = NPlot/3;
			chooseType = 2;
            
            
			%% Plot Other Picture
            %% read the file and calculate how many plot and call plot function
			%for I_Plot = MainPlot : NPlot
			
				%subplot(NPlot,1,I_Plot);
				%free plot
			%end

			subplot(NPlot,1,1:MainPlot);
			switch chooseType
				case 1
					plot(date,Price,'linewidth',2);
				case 2
				
				colorLine = 'k';
				colorUp = 'r';
				colorDown = 'g';				 				
				% plot Price here										
				CandleStick( DataSet,colorLine, colorUp,colorDown)
			
			end%end_switch chooseType
			%hold on 
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			%									 %
			% plot other Singal                  %
			%                                    %
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			%hold off
			title('XXX Stock');
			ylabel('Price');
            datetick('x',21);
	end%end_switch type
