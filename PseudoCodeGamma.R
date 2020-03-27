# based on the program spuRs/resources/scripts/gamma.sim.r

# here's a version for the exponential envelope. 
# The uniform version would replace the definition the X<- below with X<-runif(1,0,C), for some large C (try C=20, say)
gamma.sim <- function(lambda, m) {
  # simulates a gamma(lambda, m) rv using rejection with an exp envelope
  # assumes m > 1 and lambda > 0
  
  # step 1: Define a function f(x)=lambda^m*x^(m-1)*exp(-lambda*x)/gamma(m)     --- the gamma density at x
  ## [ADD CODE HERE]
  
  # step 2: Define a function h(x)=lambda/m*exp(-lambda/m*x)     ---  the exponential density at x
  ## [ADD CODE HERE]
  
  # step 3: Define the value of k:  k=m^m*exp(1-m)/gamma(m)    --- in general. for m=2, lambda=1 we have k=4/e
  ## [ADD CODE HERE]
  
  while (TRUE) {    # keep sampling x's from h(x) and testing them until you accept one
    X <- -log(runif(1))*m/lambda     # generate an x from h, the exponential density              
    
    # Now generate Y from Unif[0,Kh(x)] .....[ADD CODE HERE]
    
    # and then
    if (Y < f(X)) return(X)   # this does the rejection step
  }
}

set.seed(1999)
n <- 10000        # number of replicates
g <- rep(0, n)      # create somewhere to keep the answers

for (i in 1:n) g[i] <- gamma.sim(1, 2)    # generate your 10000 gamma r.v.s

hist(g, breaks=20, freq=F, xlab="x", ylab="pdf f(x)",
  main="theoretical and simulated gamma(1, 2) density")
x <- seq(0, max(g), .1)
lines(x, dgamma(x, 2, 1))
