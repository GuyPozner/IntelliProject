findReactTimes2 <- function(visits, windowNosepokes){
        rTimes <- lapply(windowNosepokes$VisitID, 
                        function(x){
                        vStart <- visits$Start[visits$VisitID == x] 
                        nStart <- windowNosepokes$Start[windowNosepokes$VisitID == x]
                        if(visits$ModuleName[visits$VisitID == x] == "Module 1"){
                                delay <- 1
                        }
                        if(visits$ModuleName[visits$VisitID == x] == "Module 2"){
                                delay <- 2
                        }
                        if(visits$ModuleName[visits$VisitID == x] == "Module 3"){
                                delay <- 3
                        }
                        reactTime <- nStart - (vStart + delay)
                        })
        rTimes <- unlist(rTimes)
        rTimes
}
