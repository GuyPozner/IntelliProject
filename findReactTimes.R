findReactTimes <- function(visits, windowNosepokes, delay){
        rTimes <- lapply(windowNosepokes$VisitID, 
                        function(x){
                        vStart <- visits$Start[visits$VisitID == x] 
                        nStart <- windowNosepokes$Start[windowNosepokes$VisitID == x] 
                        reactTime <- nStart - (vStart + delay)
                        })
        rTimes
}
