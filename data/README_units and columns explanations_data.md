
Columns and Units explanatios:
Explain what any column in the data contains:

#---- all_data_2013_2018 ------#

The diaries raw data between 2013-2018, as extracted from acssess software, with some little
	corrections made on the excel file.
The data is in wide data format - 1 row to any net of catch, with the net properties and the catch data.

Net - net number
Start_Time_hh/End_Time_hh -time of start and finish trawling, in hours.
Start_Time_mm/End_Time_mm - time of start and finish trawling, in minutes, rounded to the closer 15 minutes.
Year/Month/Day - date of the trawling
Fishermen - fishermen name. 
Fishing_field -The fishing fieled started the traeling. As reported by the fishermen -sometimes the place paralel 
	to the trawl in the shore and sometims a place in the sea. N S reported the trawling direction
Depth - depth in Fatom
Distance_to_Shore - in feets.
Storm - TRUE if storm reported - very rare
Speed - in Kesher units - very rare
High_Sea - True if high sea reporeted - very rare
Net_Type - "Gambari" if Gambari [Shrimps] net reported
Box_only - TRUE if the data reported just in general boxes resolution, with no specific species
night_drag - TRUE if the draging time was in the night, but Gambari net didn't reported
	[When the catch was typical to Gambari net, most of the time we wrote Gambari net instead]
Ansubi:Aras - common names of the species, with the catch data in it, in boxes [10 KG for box].
	For transfer the common names to sceintific names or to codenames go to "species_sceintific_name_new_data"
	If size reporetd: B = Bizry, "Zair", very small in Arabic, juenovils. S= small. M=medium. L=large.
	2B+0.5S+ = 2 boxes of baby and 0.5 box of small fishes.
	Ind meaning individuals, and Kg - the number is in Kg instead of boxes.
	1 Ind 15 Kg = 1 fish weighing 15 Kg.
Missing - TRUE if there are missing data - very rare
Many Nasralas - TRUE if reported
Very_weak - TRUE if reported - very rare



#--- locations_lat_on_shore ----#

 Contains geogrphic data of fishing sites: their estimated coordinations on shore, and the 
	perpendicular from the shore line, in degrees.

Site - the name of the fishing site as the fisheries named it.
Lat/Lon - estimated latitude and lontitude coordination on the shore
Perpendicular - the degree of perpendicular to the shore, required because Israel shore is not vertical.



#---- species_sientific_name----#

Contains the common names, sceintific names and code names of the species. Some rows contain two or more scientific names, 
	since fisherman don't distinguish among them. These species has the same code name and common name.

Sp_code - code name
Common_name - common names
Scintific_name - scientific_name
Dori_price:Store - prices estimated by Itay Vjn Rijn in 2013
Origin - origin of the species - has a lot of problems, need another check
Vulnerability/Trophic_level - as estimated by Itay Vjn Rin in 2013



#--- species_sientific_name_new_data ----#

As"species_sientific_name" without the prices, vulnerability and trophic level columns
	And with new species doesn't exist in the 1987-2013 data