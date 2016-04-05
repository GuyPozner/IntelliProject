bindNosepokes <- function(visits1, nosepokes1, nosepokes2){
        nosepokes2$VisitID <- nrow(visits1) + nosepokes2$VisitID
        nos <- rbind(nosepokes1, nosepokes2)
}