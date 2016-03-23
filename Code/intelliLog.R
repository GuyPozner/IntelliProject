#Read the intellicage data, nosepokes, visits, and animals
sessionPath <- "~/2015-02-15 09.43.52/"
visits <- read.csv(paste0(sessionPath,"IntelliCage/Visits.txt"), sep = "\t")
nosepokes <- read.csv(paste0(sessionPath,"IntelliCage/Nosepokes.txt"), sep = "\t")
animals <- read.csv(paste0(sessionPath,"/Animals.txt"), sep = "\t")

