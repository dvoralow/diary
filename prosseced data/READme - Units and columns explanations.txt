
Explain of the imprtants data in the folder. all the others data are just tomporaries files extracted from the script.


#--- final_data_2013_2018 ----#

the final output of the script
The columns unit explaind in the readme in "data" folder. Explain of the new columns:

Site - the site wich the draging start in
Direction - the direction of the site
Lat_shore/Lon_sohre - latitude of the fishing site in the shore
Perpendicular - perpendicular from the shore in degrees
Eer:Upo - species in code names, catch in KG.
Depth_m - depth as extracted from the calculations
Depth_specifyed  -TRUE if depth reported
Distance_specifyed - TRUE if distance reported
Location_specifyed - TRUE if site reported
Lon_final/Lat_final - coordinations of the net, as calculated
Depth_diff - difference between depth as calculated to depth as reported
loc_DEPTH - finald depth, as claculated.



#--- final_data_1987_2013 ----#

Final Itay data, from 1987-2013. This data were created by Itay Vjn Rain, and all the "data prep" script purpose was to 
	get the new data to an identical format as Itay's data.

As explained, buy the chatch is in boxes, as fisheries reported [10 kg for box]




#---- final_data_1987_2018 ----#

contains the 2 data - 1987-2013 data and 2013-2018, bind together after cleaning and reordering the columns to an identical format.
The units are in kg.


# ---- kg_data_sizes ---#

contains the data in the long format, with sizes if reported (size per box/ind., in Kg). The sizes are vanished in the wide format of the data.
	There is single row to any species in any net

species - name of specie in common name

the catch reported in 16 different colomns, combinations of: 
box - reported in boxes
ind - reported in individuals
kg - reported in kg
no size - no size reported
B/S/M/L - size reporeted. "Bizri" - "Zair" very small in Arabic, Small, Medium, Large


