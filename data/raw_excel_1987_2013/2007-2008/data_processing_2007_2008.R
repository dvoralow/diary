



swap.plus<-function(cell){
  return(gsub("\\+", "_", cell))
}

differnt_sizes<-function(cell){
  return(strsplit(cell,"_"))
}

split_let_from_num<-function(term){
  return(strsplit(term," "))
}

processing<-function(cell,species_template){
  cell<-as.character(cell)
  cell<-swap.plus(cell)
  cell<-differnt_sizes(cell)
   
  for(i in 1:length(cell[[1]])){
    term<-cell[[1]][i]
    term<-split_let_from_num(term)
    num<-as.numeric(term[[1]][1])
    
    if(length(term[[1]])==1){
      species_template$box_no_size<-num
    }
    
    if(length(term[[1]])==2){
      sizeA<-term[[1]][2]
      if(sizeA=="Ind"){
        species_template$ind_no_size<-num
      }else{
        if(sizeA=="Kg"){
          species_template$kg_no_size<-num
        }else{
          if(sizeA=="B"){
            species_template$box_b<-num 
          }
          if(sizeA=="S"){
            species_template$box_s<-num 
          }
          if(sizeA=="M"){
            species_template$box_m<-num 
          }
          if(sizeA=="L"){
            species_template$box_l<-num 
          }
        }
      }
    }
    
    
    if(length(term[[1]])==3){
      sizeA<-term[[1]][2]
      sizeB<-term[[1]][3]
      if(sizeA=="Ind"){
        if(sizeB=="B"){
          species_template$ind_b<-num 
        }
        if(sizeB=="S"){
          species_template$ind_s<-num 
        }
        if(sizeB=="M"){
          species_template$ind_m<-num 
        }
        if(sizeB=="L"){
          species_template$ind_l<-num 
        }
      }else{
        if(sizeA=="Kg"){
          if(sizeB=="B"){
            species_template$kg_b<-num 
          }
          if(sizeB=="S"){
            species_template$kg_s<-num 
          }
          if(sizeB=="M"){
            species_template$kg_m<-num 
          }
          if(sizeB=="L"){
            species_template$kg_l<-num 
          }
        }
      }
    }
     
  }
  
  return(species_template)
}


#importing data
##########################################
raw_data  <- read.csv("Z:/Fisherman diary/Full excel/2007-2008/2007-8_itaig.csv")
raw_data[raw_data==""]<-NA
###########################################################

# adding factors to raw data
###########################################

adding_factors<-function(raw_data){
  
  #adding season column to raw_data
  
  season<-rep(0,length(raw_data$Net))
  season[as.numeric(raw_data$Month.XX.)==12 | as.numeric(raw_data$Month.XX.)<=2]<-"winter"
  season[as.numeric(raw_data$Month.XX.)>=3 & as.numeric(raw_data$Month.XX.)<=5]<-"spring"
  season[as.numeric(raw_data$Month.XX.)>=6 & as.numeric(raw_data$Month.XX.)<=9]<-"summer"
  season[as.numeric(raw_data$Month.XX.)>=10 & as.numeric(raw_data$Month.XX.)<=11]<-"Autum"
  
  #adding draging time to raw data
  
  draging.time<-rep(NA,length(raw_data$Net))
  for(i in 1:length(raw_data$Net)){
    end<-as.numeric(raw_data$End_Time_hh[i])+as.numeric(raw_data$End_Time_mm[i])/60
    start<-as.numeric(raw_data$Start_Time_hh[i])+as.numeric(raw_data$Start_Time_mm[i])/60
    if(is.na(start)| is.na(end)){
      
    }else{
      if(start>end){
        draging.time[i]<-24-start+end
      }else{
        draging.time[i]<-end-start
      }
    }
    
  }
  
  dayOrNight<-rep(NA,length(raw_data$Net))
  dayOrNight[raw_data$Start_Time_hh>=5 & raw_data$Start_Time_hh<=20]<-"d"
  dayOrNight[raw_data$Start_Time_hh<5 & raw_data$Start_Time_hh>20]<-"n"
  dayOrNight
  
  new_raw_data<-cbind(raw_data,season,draging.time,dayOrNight)
  
  return(new_raw_data)
}

raw_data<-adding_factors(raw_data)

###########################################

#adding columns to data

#######################################
species<-c(NA)
box_no_size<-c(NA)
box_b<-c(NA)
box_s<-c(NA)
box_m<-c(NA)
box_l<-c(NA)
ind_no_size<-c(NA)
ind_b<-c(NA)
ind_s<-c(NA)
ind_m<-c(NA)
ind_l<-c(NA)
kg_no_size<-c(NA)
kg_b<-c(NA)
kg_s<-c(NA)
kg_m<-c(NA)
kg_l<-c(NA)

#############################################


data<-c()

Net.1.place<-which(colnames(raw_data)=="Net.1")
Missing.place<-which(colnames(raw_data)=="Missing")
Very_weak.place<-which(colnames(raw_data)=="Very_weak")

if("Very_weak" %in% colnames(raw_data)){
  species_vector<-c((Net.1.place+1):(Missing.place-1),(Missing.place+2):(Very_weak.place-1),(Very_weak.place+1):(length(raw_data)-3))
}else{
  species_vector<-c((Net.1.place+1):(Missing.place-1),(Missing.place+2):(length(raw_data)-3))
}

nets<-c(1:length(raw_data[,1]))
#nets<-c(1:300)

for(i in nets){
  
  
  net_template<-cbind(raw_data[1:Net.1.place][i,],raw_data$season[i],raw_data$Very_weak[i],raw_data$Missing[i],raw_data$Comments[i],raw_data$draging.time[i],raw_data$dayOrNight[i],species,box_no_size,box_b,box_s,box_m,box_l,ind_no_size,ind_b,ind_s,ind_m,ind_l,kg_no_size,kg_b,kg_s,kg_m,kg_l) # net data might have more than 1 rows 
  colnames(net_template)[Net.1.place+1]<-"season"
  colnames(net_template)[Net.1.place+2]<-"very_weak"
  colnames(net_template)[Net.1.place+3]<-"missing"
  colnames(net_template)[Net.1.place+4]<-"comments"
  colnames(net_template)[Net.1.place+5]<-"draging.time"
  colnames(net_template)[Net.1.place+6]<-"dayornight"
  colnames(net_template)<-tolower(colnames(net_template))
  
  net<-c()
  
  
  for (j in species_vector){
    if(is.na(raw_data[i,j])==F){ #species cell NA or not
      species_template<-net_template
      species_template$species<-colnames(raw_data[j])# species data might have more than 1 rows
      species_data<-processing(raw_data[i,j],species_template)
      
      
      net<-rbind(net,species_data)
    }
  }# end of j
  temp<-rbind(data,net)
  data<-temp
}


#histogram of draging time
hist(as.numeric(data$draging.time))
#net numbers of draging time
data$net[as.numeric(data$draging.time)>9]

#total amount of boxes per net
#data$boxes[is.na(data$boxes)]<-0
total_boxes_per_net<-rep(NA,max(data$net))
draging_time<-rep(NA,max(data$net))
for(i in 1:(max(data$net))){
  total_boxes_per_net[i]<-sum(data$box_no_size[data$net==i],na.rm=TRUE)+sum(data$box_b[data$net==i],na.rm=TRUE)+sum(data$box_s[data$net==i],na.rm=TRUE)+sum(data$box_m[data$net==i],na.rm=TRUE)+sum(data$box_l[data$net==i],na.rm=TRUE)
  draging_time[i]<-raw_data$draging.time[i]
}

total_boxes_per_net

#effrot per hour per net

effort_per_hour_per_net<-total_boxes_per_net/draging_time

effort_per_hour_per_net

# depth groups column

depth<-rep(NA,length(raw_data$Net))
depth[as.numeric(raw_data$Depth)>=0 & as.numeric(raw_data$Depth)<=35]<-"shallow"
depth[as.numeric(raw_data$Depth)>=36 & as.numeric(raw_data$Depth)<=75]<-"medium"
depth[as.numeric(raw_data$Depth)>=76]<-"deep"
depth


#season effort per hour per net

effort<-data.frame(raw_data$Net,effort_per_hour_per_net,raw_data$season,raw_data$dayOrNight,raw_data$Fishermen,depth,total_boxes_per_net,raw_data$draging.time,raw_data$Year.XXXX.,raw_data$Fishing_field,raw_data$Distance_to_Shore)
colnames(effort)<-c("net","effort","season","dayOrNight","fisherMan","depth","total_boxes_per_net","dragingTime","year","fishing_field","distance_from_shore")


# clening effort
temp<-effort$net %in% data$net
effort<-cbind(effort,temp)
effort<-subset(effort,temp)

#analysis

plot(effort$dragingTime[effort$dayOrNight=="d"],effort$total_boxes_per_net[effort$dayOrNight=="d"])

lm1<-lm(effort$total_boxes_per_net[effort$dayOrNight=="d"]~effort$dragingTime[effort$dayOrNight=="d"])
plot(lm1)


plot(effort$season,effort$total_boxes_per_net)
plot(effort$season,effort$effort)

