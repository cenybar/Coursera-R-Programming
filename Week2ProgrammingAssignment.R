# Part 1

# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
# specified list of monitors.The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
# and 'id'. 

pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_full <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        for (i in id) {
            dat <- rbind(dat, read.csv(files_full[i]))
        }
        
        mean(dat[, pollutant], na.rm = TRUE )
}