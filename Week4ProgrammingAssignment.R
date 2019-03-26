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
    
3 ## Ranking hospitals by outcome in a state
    
    
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    #read in the desired data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    #check if the state and outcomes are valid
    states <- data[ , 7]
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if ((state %in% states) == FALSE) {
        stop(print("invalid state"))
    }
    else if ((outcome %in% outcomes) == FALSE) {
        stop(print("invalid outcome"))
    }
    
    #get the subset of the data with the desired state
    new_data <- subset(data, State == state)
    
    #get the desired outcome column from the data file
    if (outcome == "heart attack") {
        outcome_column <- 11
    }
    else if (outcome == "heart failure") {
        outcome_column <- 17
    }
    else {
        outcome_column <- 23
    }
    
    #if num is greater that the number of hospitals in the desired state,
    # return NA
    if (is.numeric(num) == TRUE) {
        if (length(data[,2]) < num) {
            return(NA)
        }
    }
    
    #get rid of the NA's in the desired outcome column
    new_data[, outcome_column] <- as.numeric(new_data[,outcome_column])
    bad <- is.na(new_data[, outcome_column])
    desired_data <- new_data[!bad, ]
    
    #arrange the modified dataframe in ascending order of the outcome values
    outcome_column_name <- names(desired_data)[outcome_column]
    hospital_column_name <- names(desired_data)[2]
    index <- with(desired_data, order(desired_data[outcome_column_name], desired_data[hospital_column_name]))
    ordered_desired_data <- desired_data[index, ]
    
    #if nume is either "best" or "worst", then interpret it to the
    #corresponding numerical value
    if (is.character(num) == TRUE) {
        if (num == "best") {
            num = 1
        }
        else if (num == "worst") {
            num = length(ordered_desired_data[, outcome_column])
        }
    }
    #return the hospital name with the outcome ranking of num
    ordered_desired_data[num, 2]
}

4 ## Ranking hospitals in all states

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    #read in the desired data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    #create a list of states and initialize a character array to hold the
    #required hospital names
    state <- levels(factor(data[, 7]))
    hospital <- vector(mode="character") 
    
    for (i in seq(state)) {
        hospital[i] <- rankhospital(state[i], outcome, num)
    }
    data.frame(hospital, state)
}
    