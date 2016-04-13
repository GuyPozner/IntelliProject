bindVisits <-function(visits1, visits2){
        visits2$VisitID <- nrow(visits1) + visits2$VisitID
        visits <- rbind(visits1, visits2)
}