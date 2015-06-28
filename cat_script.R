library(methods)
library(rjson)
library(CATPack)
args <- commandArgs(TRUE)
cat <- new("CATsurv")
json_cat <- fromJSON('#{data.to_json}')
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
response <- nextItemEPVcpp(cat)
next_item = response$next.item
epvs = response$all.esimates$EPV
output$next_item <- list()
output$next_item$item_id = next_item$next.item
output$next_item$epv = next_item$all.esimates$EPV