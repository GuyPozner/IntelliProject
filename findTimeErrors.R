findTimeErrors <- function(visits, windowNosepokes){
        inds <- sapply(windowNosepokes$VisitID, function(x){
                visitStart <- visits$Start[visits$VisitID == x]
                noseStart <- windowNosepokes$Start[windowNosepokes$VisitID == x]
                reactTime <- noseStart - visitStart
                if(reactTime>0.5 & reactTime<2.5)
                        {TRUE} 
                else 
                        {FALSE}
        })
}