# The str function is a great way to analyze R objects. Similar to summary, but gives more compact data.

# Generating random numbers:

rnorm() # generate random normal variables
dnorm() # evaluate the normal probability density
pnorm() # evaluate the cumulative distibution for a normal distribution
rpois() # generate random Poisson variates

# More general:

# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

# Setting the random number seed with set.seed ensures reproducibility.
# Recommended to set the random number seed when conducting a simulation.

set.seed(1)
rnorm(5)

rnorm(5)

set.seed(1)
rnorm(5)

# Random sampling
# The sample function draws randomly from a specified set of (scalar) objects, allowing to sample
# from arbitrary distributions.

sample(1:10, 4)
sample(1:10) ## permutation
sample(1:10, replace = TRUE) ## sample w/replacement
