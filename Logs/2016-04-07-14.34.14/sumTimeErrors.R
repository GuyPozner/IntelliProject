sumTimeErrors <- function(windowNosepokes, AnimalName, Day, ModuleName){
        a <- sum(windowNosepokes$AnimalName == AnimalName &
                         windowNosepokes$Day == Day &
                         windowNosepokes$ModuleName == ModuleName &
                         windowNosepokes$TimeError == 1)
        a
}