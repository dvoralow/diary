# diary
The repository contains trawl fishing diaries - the raw data, and the code cleaning and ordereing them, with some basic analyses also.

"data_prep_5" is the cleaning and ordering script of the raw data. This script was originally written by Itay Vjn Rain, and edited by Dvora Low Ramati.

"map_med" is a raster file of a bathymetric map of the Mediterranean Sea, required in the script.


#--- FOLDERS ---#

--"DATA" FOLDER:

"data" folder contains excel files used as input in the script:

  1. "all_data_2013_2018" - the raw data, diaries exported from "access" software and joined together. 

  	Some cleaning such as - make all the site names uniform, were made in the excel file, not in the script.
  
  2. "locations_lat_on_sore" contains geogrphic data of fishing sites: their estimated coordinations on shore, and the perpendicular from the shore line, in degrees.
  
  3. "species_scientific_name" contains the common names, sceintific names and code names of the species. Some rows contain two or more scientific names, 
	since fisherman don't distinguish among them. These species has the same code name and common name.
  
  4. "species_scientific_name_new_data" contains also species that doesn't exist in the 1987-2013 diaries, and exist in the new data - 2013-2018 diaries.


	5. "raw_data_1976_2013" the raw data, diaries exported from "access" software by Itay Vjn Rain  and joined together. 


-- "PROSSECED DATA" FOLDER---
  
  The folder "prosseced data" contains all the data exported from the script. The important ones are: 
  
	1. "final_data_2013_2018" - the final output of the script. 

	2."final_data_1987_2013" - Final Itay data, from 1987-2013. This data were created by Itay Vjn Rain, and all the "data prep" script purpose was to 
	get the new data to an identical format as Itay's data.

	I didn't run the 1987-2013 data again on the new script.

	3. "kg_data_sizes" contains the data in the long format, with sizes if reported (size per box/ind., in Kg). The sizes are vanished in the wide format of the data.

	4. "final_data_1987_2018" contains the 2 data - 1987-2013 data and 2013-2018, bind together after cleaning and reordering the columns to an identical format.
  

--"ACESS" FOLDER"--
 
   The folder "acess" contains files for entry of diaries in the future.
  
	1.  "untouch_template", an access template, for data entry of diaries in the future.

	2. "Instructions for entering logs" contains instructions and comments abuot how to enter the diaries in to the access,  
	in order to create uniform data [in Hebrew].