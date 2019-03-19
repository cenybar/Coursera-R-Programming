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

pollutantmean("specdata", "sulfate", 23)
pollutantmean("specdata", "nitrate", 2:30)

# Part 2

# Write a function that reads a directory full of files and reports the number of completely observed cases in 
# each data file. The function should return a data frame where the first column is the name of the file and 
# the second column is the number of complete cases.

complete <- function(directory, id = 1:332) {
    files_full <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for (i in id) {
        moni_i <- rbind(dat, read.csv(files_full[i]))
        nobs <- sum(complete.cases(moni_i))
        tmp <- data.frame(i, nobs)
        dat <- rbind(dat, tmp)
    }
    
    colnames(dat) <- c("id", "nobs")
    dat
}
    
  

# Part 3

# Write a function that takes a directory of data files and a threshold for complete cases and calculates the 
# correlation between sulfate and nitrate for monitor locations where the number of completely observed cases 
# (on all variables) is greater than the threshold. The function should return a vector of correlations for the 
# monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function 
# should return a numeric vector of length 0. 

# This is, for now, out of my scope. Will get back to this in the near future.

    