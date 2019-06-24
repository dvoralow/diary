#data processing

raw_data <- read.csv("Z:/Fisherman diary/Full excel/2001-2002/2001-2a_itaiv.csv")
raw_data[raw_data==""]<-NA


#adding season column to raw_data

season<-rep(0,length(raw_data$Net))
season[raw_data$Month.XX.==12 | raw_data$Month.XX.<=2]<-"winter"
season[raw_data$Month.XX.>=3 & raw_data$Month.XX.<=5]<-"spring"
season[raw_data$Month.XX.>=6 & raw_data$Month.XX.<=9]<-"summer"
season[raw_data$Month.XX.>=10 & raw_data$Month.XX.<=11]<-"Autum"

season

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



temp<-cbind(raw_data,season,draging.time)
raw_data<-temp


dayOrNight<-rep(NA,length(raw_data$Net))
dayOrNight[raw_data$Start_Time_hh>=5 & raw_data$Start_Time_hh<=20]<-"d"
dayOrNight[raw_data$Start_Time_hh<5 & raw_data$Start_Time_hh>20]<-"n"
dayOrNight


data<-c()

size<-c(NA)
species<-c(NA)
boxes<-c(NA)
ind<-c(NA)
kg<-c(NA)
species_vector<-c(20:55,58:65,67:70)

 


nets<-c(1:length(raw_data[,1]))
#nets<-c(1:300)

for(i in nets){
  
  
  net_template<-cbind(raw_data[1:19][i,],raw_data$season[i],raw_data$Very_weak[i],raw_data$Missing[i],raw_data$Comments[i],raw_data$draging.time[i],species,size,boxes,ind,kg) # net data might have more than 1 rows 
  colnames(net_template)[20]<-"season"
  colnames(net_template)[21]<-"very_weak"
  colnames(net_template)[22]<-"missing"
  colnames(net_template)[23]<-"comments"
  colnames(net_template)[24]<-"draging.time"
  colnames(net_template)<-tolower(colnames(net_template))
  
  net<-c()
  
  
  for (j in species_vector){
    if(is.na(raw_data[i,j])==F){ #species cell NA or not
      species_template<-net_template
      species_template$species<-colnames(raw_data[j])# species data might have more than 1 rows
      location_of_first_<-gregexpr(pattern =" ",raw_data[i,j])
      
      if(location_of_first_[[1]][1]==-1){ # species cell have just one number
        species_data<-species_template
        species_data$size<-NA
        species_data$boxes<-as.numeric(as.character(raw_data[i,j]))
        }else{
          species_data<-species_template
          num<-as.numeric(as.character(substr(raw_data[i,j], 1, location_of_first_[[1]][1])))# the first number
          species_data$boxes<-num
          for(letter in c("I","B","M","S","L","K")){ # which letters are in the cell
            location_of_letter <- (gregexpr(pattern =letter,raw_data[i,j]))[[1]][1]
            if(location_of_letter!=-1){ #is the letter _ in the cell
              
              if (letter=="K"){
                  species_data$kg<-num
                  species_data$boxes<-NA
                  }else{
                    if(letter=="I"){
                      species_data$ind<-num
                      species_data$boxes<-NA
                      }else{
                        species_data$size<-letter 
                      }
                  }
              }
            }
          }
      net<-rbind(net,species_data)
    }
  }# end of j
  temp<-rbind(data,net)
  data<-temp
}


#histogram of draging time
hist(data$draging.time)
#net numbers of draging time
data$net[data$draging.time>9]

#total amount of boxes per net
#data$boxes[is.na(data$boxes)]<-0
total_boxes_per_net<-rep(NA,max(data$net))
draging_time<-rep(NA,max(data$net))
for(i in 1:(max(data$net))){
  total_boxes_per_net[i]<-sum(data$boxes[data$net==i])
  draging_time[i]<-raw_data$draging.time[i]
}

total_boxes_per_net

#effrot per hour per net

effort_per_hour_per_net<-total_boxes_per_net/draging_time

effort_per_hour_per_net

# depth groups column

depth<-rep(NA,length(raw_data$Net))
depth[raw_data$Depth>=0 & raw_data$Depth<=35]<-"shallow"
depth[raw_data$Depth>=36 & raw_data$Depth<=75]<-"medium"
depth[raw_data$Depth>=76]<-"deep"
depth


#season effort per hour per net

effort<-data.frame(raw_data$Net,effort_per_hour_per_net,raw_data$season,dayOrNight,raw_data$Fishermen,depth,total_boxes_per_net,raw_data$draging.time,raw_data$Year.XXXX.)
colnames(effort)<-c("net","effort","season","dayOrNight","fisherMan","depth","total_boxes_per_net","dragingTime","year")


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

