1 # Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:

library(datasets)
data(iris)

# A description of the dataset can be found by running

?iris


# There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for 
#the species virginica? Please round your answer to the nearest whole number.

tapply(iris$Sepal.Length, iris$Species, mean)

2 # Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of 
# the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

# apply(iris, 2, mean)
apply(iris[, 1:4], 2, mean)
# colMeans(iris)
# rowMeans(iris[, 1:4])
# apply(iris[, 1:4], 1, mean)
# apply(iris, 1, mean)

3 # Load the 'mtcars' dataset in R with the following code:
library(datasets)
data(mtcars)

# There will be an object names 'mtcars' in your workspace. 
# You can find some information about the dataset by running:

?mtcars
head(mtcars)

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the 
# car (cyl)? Select all that apply.

#sapply(mtcars, cyl, mean)
#split(mtcars, mtcars$cyl)
#mean(mtcars$mpg, mtcars$cyl)
#tapply(mtcars$cyl, mtcars$mpg, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
#lapply(mtcars, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
#apply(mtcars, 2, mean)

4 # Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between 
# the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

tapply(mtcars$hp, mtcars$cyl, mean)

+209-83

4 # If you run

debug(ls)

# What happens when you next call the 'ls' function?
    
# 1 The 'ls' function will return an error.
# 2 Execution of the 'ls' function will suspend at the 4th line of the function and you will be in the browser.
# 3 Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
# 4 You will be prompted to specify at which line of the function you would like to suspend execution and enter 
# the browser.

# I think the answer is # 2.
