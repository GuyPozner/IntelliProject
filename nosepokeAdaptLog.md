nosepokeAdapLogYYYYMMDD
=======================

This is an example of an R Markdown document I've made to encapsulate
the analysis code and plots for the basic log files we will produce from the intellicage.
after each session a same log will be produced and save in the log folder.

This R markdown requires ggplot2 package and will install it if it doesn't exist.  


It read the "animals.txt", "visits.txt" and "nosepokes.txt" files,    

and assigns animal name for each event as a factor(visit and nosepoke).  



This is the visit count with the appropriate plot  

```r
#Plots visit count per animal
visitsCountPlot <- ggplot(visits, aes(AnimalName)) +
                   geom_bar() +
                   xlab("") +
                   ggtitle("visits Count")
print(table(visits$AnimalName))
```

```
## 
##  Animal 1 Animal 14 Animal 18  Animal 7 
##       304       243        91       307
```

```r
plot(visitsCountPlot)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

Visits over time for each animal   

```r
#plot visits over time using the ggplot2 package
visitPoints <- geom_point(aes(x = as.POSIXct(visits$Start),
                              y = visits$AnimalName,
                              colour = visits$AnimalName),
                              alpha = 0.3)
visitPointsPlot <- ggplot() +
                   visitPoints +
                   xlab("") +
                   ylab("") +
                   ggtitle("Visits") +
                   theme(legend.title=element_blank())
plot(visitPointsPlot)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

Visit count across absoulute time  

```r
#create a data frame for visit per hour
hours <- vapply(split(1:nrow(visits),
                      format(as.POSIXlt(visits$Start),
                             "%Y-%m-%d%H:00:00",tz='UTC')),
                length,
                0)
visitsPerHour <- as.numeric(hours)
hour <- as.POSIXct(names(hours))
visitCount <- data.frame(hour,visitsPerHour)
#Plot a line plot for the visitCount data frame
visitCountLine <- ggplot(visitCount, aes(hour, visitsPerHour)) +
                  geom_line() +
                  ylab("Count") +
                  xlab("") +
                  ggtitle("Visit count per hour")
plot(visitCountLine)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)

This is the hour with the maximun number of visits  

```r
print(visitCount$hour[which.max(visitCount$visitsPerHour)])
```

```
## [1] "2015-02-17 09:00:00 IST"
```


This is the nosepokes count with the appropriate plot 

```r
#Plots nosepoke count per animal
nosepokesCountPlot <- ggplot(nosepokes, aes(AnimalName)) +
                      geom_bar() +
                      xlab("") +
                      ggtitle("Nosepokes Count")
print(table(nosepokes$AnimalName))
```

```
## 
##  Animal 1 Animal 14 Animal 18  Animal 7 
##       709       482       244       550
```

```r
plot(nosepokesCountPlot)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)


Nosepokes over time for each animal

```r
#Plot Nosepokes over time using the ggplot2 package
nosepokePoints <- geom_point(aes(x = as.POSIXct(nosepokes$Start),
                                 y = nosepokes$AnimalName,
                                 colour = nosepokes$AnimalName),
                                 alpha = 0.15)
nosepokesPointsPlot <- ggplot() +
                       nosepokePoints +
                       xlab("") +
                       ylab("") +
                       ggtitle("Nosepokes") +
                       theme(legend.title=element_blank())
plot(nosepokesPointsPlot)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png)


```r
#Count visits per hour for each animal
animalDat <- split(visits, visits$AnimalName)
visitHourAnimal <- sapply(animalDat, 
                          function(x){vapply(split(1:nrow(x),
                                            format(as.POSIXlt(x$Start),
                                                   "%Y-%m-%d%H:00:00",
                                                    tz='UTC')),
                                            length,
                                            0)},
                          simplify = "array")
visitHourAnimal <- unlist(visitHourAnimal)
visitHourAnimalDF <- read.table(text = names(visitHourAnimal), sep = ".")
visitHourAnimalDF$VisitCount <- as.numeric(visitHourAnimal)
names(visitHourAnimalDF) <- c("AnimalName", "Hour", "VisitCount")
visitHourAnimalDF$Hour <- as.POSIXct(visitHourAnimalDF$Hour)
```


```r
visitLines <- ggplot(visitHourAnimalDF,
                     aes(Hour, VisitCount, colour = AnimalName))
visitCountPlot <- visitLines + geom_line()
print(visitCountPlot)
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11-1.png)

Check that drinking occoured only in the 19:00 23:59 time window, it shows the nosepokes where atleast one lick had happend, horizontal lines show the time window were the corner is active.

```r
#Plot licks over time using the ggplot2 package
lickIdx <- nosepokes$LickNumber > 0
lickPoints <- geom_point(aes(x =as.POSIXct(nosepokes$Start[lickIdx]),
                                 y = nosepokes$AnimalName[lickIdx],
                                 colour = nosepokes$AnimalName[lickIdx]),
                                 alpha = 0.3)
lickPointsPlot <- ggplot() +
                       lickPoints +
                       xlab("") +
                       ylab("") +
                       ggtitle("Nosepokes with at least one lick") +
                       theme(legend.title=element_blank()) +
                       geom_vline(xintercept = as.numeric(
                                  as.POSIXct("2015-02-15 19:00:00.00"),
                                  linetype = "i"
                       ))
plot(lickPointsPlot)
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12-1.png)