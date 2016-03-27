function  MultiPlot( input_args )
	
	%%(1) choose the m file in GUI
	[filename, pathname] = ...
     uigetfile({'*.m';},'File Selector','MultiSelect', 'on');
	
	%%(2) get the m file name and number of file
	NFile = size(filename,2);
	
	%%(3) keeping run all the m file and plot itself
	
	for I_file = 1: NFile
		
		run(cell2mat(filename(1,I_file))); % plot the picture
	end
	
end


