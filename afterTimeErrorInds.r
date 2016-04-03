#Returns indices of the places where the nosepoked occoured after the time window
afterTimeErrorInds <- function(visits, windowNosepokes){
        windowNosepokes$VisitID
        inds <- 
        sapply(windowNosepokes$VisitID, function(x){
                moduleName <- visits$ModuleName[visits$VisitID == x]
                visitStart <- visits$Start[visits$VisitID == x]
                noseStart <- windowNosepokes$Start[windowNosepokes$VisitID == x]
                reactTime <- noseStart - visitStart
                if(moduleName == "Module 1" & reactTime >= 2 & reactTime <= 3)
                {TRUE} else {FALSE}
                if(moduleName == "Module 2" & reactTime >= 3 & reactTime <= 4)
                {TRUE} else {FALSE}
                if(moduleName == "Module 3" & reactTime >= 4 & reactTime <= 5)
                {TRUE} else {FALSE}
        })
        inds
}