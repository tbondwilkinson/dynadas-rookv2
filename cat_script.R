cat <- new("CATsurv")
args <- commandArgs(TRUE)
json_cat <- fromJSON(file=args[1])
cat@guessing <- json_cat$guessing
cat@discrimination <- unlist(json_cat$discrimination)
cat@answers <- as.numeric(json_cat$answers)
cat@priorName <- json_cat$priorName
cat@priorParams <- json_cat$priorParams
cat@lowerBound <- json_cat$lowerBound
cat@upperBound <- json_cat$upperBound
cat@quadPoints <- json_cat$quadPoints
cat@D <- json_cat$D
cat@difficulty <- lapply(json_cat$difficulty, unlist)
cat@X <- json_cat$X
cat@poly <- TRUE
next_item <- nextItemEPVcpp(cat)
output <- list()
output$next_item <- list()
output$next_item$item_id = next_item$next.item
output$next_item$epv = next_item$all.estimates$EPV
write(toJSON(output), args[2])