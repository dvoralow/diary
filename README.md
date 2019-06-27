# diary
Contain trawl diaries - the raw data, and the code cleaning and ordereing them

"data_prep_5" is the script clean and ordere the raw data. The origin of thes script wrote by Itay Vjn Rain, and Dvora Low Ramati join and edit it's to one script, with some changes.

"map_med" is a raster of the Mediterranian Sea, whith coordinations and depthes, require in the script.

"data" folder contain excel files that are input in the script:
  "all_data_2013_2018" - the raw data, diaries exported from "access" and joined togother. 
  some cleaning such as - make al the site names uniform made on the excel file, not in the script.
  
  "locations_lat_on_sore" contain the sites in the data, with their estimated coordinations on shore, and the Perpendicular - the degree of vertical line to the sohre in the site.
  
  "species_scientific_name" contain the common names, sceintific names and code fo the species. Spcies fishery doesn't distinguish between them are in the same line, with the same code and common name.
  
  "species_scientific_name_new_data" contain also species doesn't exist in the 1987-2013 diaries, and exist in the new data - 2013-2018 diaries.

	The folder: "raw_excel_1987_2013" conation all the raw excels file exported from the access by Itay Vjn Rain
  
  The folder "prosseced data" contain all the data exported throuout the script for easy return to any step in the script. 
  The final data called: "final_data_2013_2018"
	Final Itay data, the data from 1987-2013 called "final_data_1987_2013", thies data create by Itay Vjn Rain, and all the "data prep" script is to get the new data to identical form.
	I didn't run the 1987-2013 data again on the new script.
	The file "kg_data_sizes" contain the data in the long format, withe the knowledge about sizes if reported. The size are vanish in the wide format of the data
	The file "final_data_1987_2018" contain the 2 data,bind togother after cleaning and reordering the columns to identical format
  
  
The folder "acess" contain an acess template "untouch_template", for use for new diary in the future.
and the file "הוראות להזנת יומנים" contain some comments form Itay Vjn Rain abuot the way to write the diaries in to the acees, in order to create uniform data.