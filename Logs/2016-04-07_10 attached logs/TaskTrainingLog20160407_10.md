TaskTrainingLog20160410
=======================

This is a log for the task training session, the Anticipation time = {1s,2s,3s} is randomized, a light cue appears for 0.5s and since it appears there is a 1s chance for a nosepoke, this is the 4th and the 5th day of the training. 



This R markdown requires ggplot2 package and will install it if it doesn't exist.  


It read the "animals.txt", "visits.txt" and "nosepokes.txt" files, removes all non-first nosepokes    

and assigns animal name for each event as a factor(visit and nosepoke).  



This is the visit count with the appropriate plot  

```
## 
## Animal 10  Animal 4 
##       929      1279
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

Visits over time for each animal   
![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

Visit count across absoulute time  


![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)



This is the hour with the maximun number of visits  

```
## [1] "2016-04-09 19:00:00 IDT"
```


This is the nosepokes count with the appropriate plot 

```
## 
## Animal 10  Animal 4 
##       622       752
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10-1.png)


Nosepokes over time for each animal
![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11-1.png)

Check that drinking occoured only in the 19:00 23:59 time window, it shows the nosepokes where atleast one lick had happend, horizontal lines show the time window were the corner is active.
![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12-1.png)


This is a plot showing the amount of nosepokes in the time window per day per animal  
![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png)

This is the count of nosepokes per day per animal in the time windows


This is a plot showing the fraction of errors per time window per module,
the number of the module corresponds the anticipation time in seconds.
![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15-1.png)

```
##    AnimalName Day ModuleName Count TimeError
## 1   Animal 10   7   Module 1    31         6
## 2    Animal 4   7   Module 3    19        12
## 3   Animal 10   7   Module 2    18         6
## 4    Animal 4   7   Module 1    20         9
## 5   Animal 10   7   Module 3    24        21
## 6    Animal 4   7   Module 2    18        12
## 7   Animal 10   8   Module 1    16         8
## 8    Animal 4   8   Module 3    26        20
## 9   Animal 10   8   Module 2    12         9
## 10   Animal 4   8   Module 1    20        10
## 11  Animal 10   8   Module 3    30        25
## 12   Animal 4   8   Module 2    25        12
## 13  Animal 10   9   Module 1    18        14
## 14   Animal 4   9   Module 3    23        13
## 15  Animal 10   9   Module 2    26        13
## 16   Animal 4   9   Module 1    25        13
## 17  Animal 10   9   Module 3    28        19
## 18   Animal 4   9   Module 2    35        11
## 19  Animal 10  10   Module 1    12         7
## 20   Animal 4  10   Module 3    12         4
## 21  Animal 10  10   Module 2     6         3
## 22   Animal 4  10   Module 1    31         3
## 23  Animal 10  10   Module 3     9         7
## 24   Animal 4  10   Module 2    17         3
## 25  Animal 10  11   Module 1    24        18
## 26   Animal 4  11   Module 3    26         6
## 27  Animal 10  11   Module 2    26        12
## 28   Animal 4  11   Module 1    19         9
## 29  Animal 10  11   Module 3    19         8
## 30   Animal 4  11   Module 2    22         5
```

This is an histogram showing the reaction times(values under zero are nosepokes before the light cue) by Day by anticipation time, the salmon colored line is the overall median reaction time:
![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16-1.png)

```
## [1] "The median reaction time in seconds:0.680000066757202"
```
This is an histogram showing the reaction times(values under zero are nosepokes before the light cue) by animal by anticipation time, the salmon colored line is the overall median reaction time:
![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17-1.png)

## Conclusion
It seesms like the mice learned to wait and do associate the light cue with the possibility to open the door, although it is hard for them to react quickly in the 1s anticipation time.
