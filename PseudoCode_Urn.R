# Define a function Urn(m,n) that simulates an Urn that produces n non-black balls,                           # assuming the black/mutation ball has weight m, and returns the number of non-black 
# colors among the final n balls.  Make sure it returns the number of (non-black) colors in the final urn. Then....

NoReps<-10000   # how many samples to generate
HowManyColorsNeeded<-1   # the "target" we have to hit (what we saw in an observed dataset)
MaxWeight<-20    # the maximum weight we will consider for the black/mutation ball 
NoOfBalls<-10    # the number of non-black balls we want in the urn at the end
AcceptedWeights<-rep(-9,NoReps)

# write a function to simulate the Urn
Urn<-function(MutationBallWeight,TotalNumberOfBallsNeeded){
  # ADD CODE HERE - you should be able to use the code you wrote earlier in the course
}

# write a function to count how many colors there are in the urn
NumberColors<-function(ThisUrn){
  # ADD CODE HERE  - you should already have code for this somewhere as well
}

# here's the loop for the rejection method
for (i in 1:NoReps){
    HowManyColorsObserved<- -9   # just to initialize it so that we enter the following loop
    while (HowManyColorsObserved != HowManyColorsNeeded) {
        # Sample a weight, ThisWeight, for the mutation ball, from Unif(0,MaxWeight)...
        # ADD CODE HERE
      
        # Then...
        MyUrn<-Urn(ThisWeight,NoOfBalls)  # simulate the urn using this weight
           
        HowManyColorsObserved<-NumberColors(MyUrn)  # count how many colors there were at the end of this urn simulation
    }
    
    # you will leave the loop when you simulate an Urn that ends up with the target number of colors. 
    # So save that value of the weight...
    AcceptedWeights[i]<-ThisWeight  
   
}

# you will now have NoReps accepted weights, so plot a histogram to see what the 
# posterior distribution f(weight|HowManyColorsNeeded) looks like
# ADD CODE HERE
