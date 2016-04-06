findReactTimes <- function(visits, windowNosepokes){
        rTimes <- lapply(windowNosepokes$VisitID, 
                        function(x){
                        vStart <- visits$Start[visits$VisitID == x] 
                        nStart <- windowNosepokes$Start[windowNosepokes$VisitID == x] 
                        reactTime <- nStart - (vStart + .5)
                        })
        rTimes
}
