## Programming Assignment 3

1 ## Plot the 30-day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11]) # because the data was read in as "character", numeric coersion is needed.
hist(outcome[,11])

2 ## Finding the best hospital in a state

#Write a function called best that take two arguments: the 2-character abbreviated name of a state and 
#an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character 
#vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified 
#outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The 
#outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have 
#data on a #particular outcome should be excluded from the set of hospitals when deciding the rankings.
#Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names 
#should be sorted in alphabetical order and the first hospital in that set should be chosen 
# (i.e. if hospitals “b”, “c”,and “f” are tied for best, then hospital “b” should be returned).

best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    states <- unique(data[, 7])
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if ((state %in% states) == FALSE) {
        stop(print("invalid state"))
    }
    else if ((outcome %in% outcomes) == FALSE) {
        stop(print("invalid outcome"))
    }
    ## Return hospital name in that state with lowest 30-day death rate
    # Get the data subset for the desired state
    state_data <- subset(data, State == state)
    # Get the desired outcome column from data
    if (outcome == "heart attack") {
        outcome_column <- 11
    }
    else if (outcome == "heart failure") {
        outcome_column <- 17
    }
    else {
        outcome_column <- 23
    }
    # Work only with complete cases (remove NA's from sample)
    selected_column <- as.numeric(state_data[,outcome_column])
    incomplete_cases <- is.na(selected_column)
    desired_data <- state_data[!incomplete_cases, ]
    # Find the hospitals with the minimum outcome value
    columns_considered <- as.numeric(desired_data[,outcome_column])
    desired_rows <- which(columns_considered == min(columns_considered))
    desired_hospitals <- desired_data[desired_rows,2]
    # Tie solution following alphabetical order
    if (length(desired_hospitals) > 1) {
        hospitals_sorted <- sort(desired_hospitals)
        hospitals_sorted[1]
    }
    else {
        desired_hospitals
    }
}
    
    
    
    
    