#setting the file to work in the current dir
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#check if ggplot exists and install it if not
list.of.packages <- c("ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(ggplot2)

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
        visitPoints +
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











