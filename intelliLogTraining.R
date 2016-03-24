#setting the file to work in the current dir
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#check if ggplot exists and install it if not
list.of.packages <- c("ggplot2","gtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(ggplot2)
library(gtools)

#Read the intellicage data, nosepokes, visits, and animals
sessionPath <- "Sessions/2015-02-15 09.43.52/"
visits <- read.csv(paste0(sessionPath,"IntelliCage/Visits.txt"), sep = "\t")
nosepokes <- read.csv(paste0(sessionPath,"IntelliCage/Nosepokes.txt"), sep = "\t")
animals <- read.csv(paste0(sessionPath,"/Animals.txt"), sep = "\t")

#Replace AnimalTag with its AnimalName
visits$AnimalName <- lapply(visits$AnimalTag,
                                function(x){
                                            animals$AnimalName[animals$AnimalTag == x ]})
visits <- transform(visits, AnimalName = unlist(AnimalName))

#Assigning an animal name to each visit id in the nosepokes data set
nosepokes$AnimalName <- lapply(nosepokes$VisitID,
                               function(x){
                                           visits$AnimalName[visits$VisitID == x ]})
nosepokes <- transform(nosepokes, AnimalName = unlist(AnimalName))

#plot visits over time using the ggplot2 package
visitPoints <- geom_point(aes(x = as.POSIXct(visits$Start),
                              y = visits$AnimalName,
                              colour = visits$AnimalName))
visitPointsPlot <- ggplot() +
                   visitPoints +
                   xlab("") +
                   ylab("") +
                   ggtitle("Visits") +
                   theme(legend.title=element_blank())
plot(visitPointsPlot)
visitsCountPlot <- ggplot(visits, aes(AnimalName)) +
        geom_bar() +
        xlab("") +
        ggtitle("visits Count")
print(table(visits$AnimalName))
plot(visitsCountPlot)

#Plot Nosepokes over time and nosepoke count using the ggplot2 package
nosepokePoints <- geom_point(aes(x = as.POSIXct(nosepokes$Start),
                                 y = nosepokes$AnimalName,
                                 colour = nosepokes$AnimalName))
nosepokesPointsPlot <- ggplot() +
                       nosepokePoints +
                       xlab("") +
                       ylab("") +
                       ggtitle("Nosepokes") +
                       theme(legend.title=element_blank())
plot(nosepokesPointsPlot)
nosepokesCountPlot <- ggplot(nosepokes, aes(AnimalName)) +
                      geom_bar() +
                      xlab("") +
                      ggtitle("Nosepokes Count")
print(table(nosepokes$AnimalName))
plot(nosepokesCountPlot)

#Creating a data.frame object containing
#The ModuleName matched with its AnticipationTime
ModuleName <- as.factor(mixedsort(
                        levels(visits$ModuleName)))
AnticipationTime <- as.factor(c(2,2,2.3,2.3,2.7,2.7,3,3,3.3,3.3,3.7,3.7,4,4))
modules <- data.frame(ModuleName, AnticipationTime)

#Adding an AnticipationTime column to the visits data set
visits$AnticipationTime <- lapply(visits$ModuleName,
                                  function(x){modules$AnticipationTime[modules$ModuleName == x]
                                  })

#Creating a ReactionTime column in the visits data set
#This column contains a the value corresponding to the
#(first nosepoke in a visit start time) minus (the cue appearance start time)
#for the successful trails











