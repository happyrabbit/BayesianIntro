# Bayesian Update
# define grid
p_grid <- seq( from=0 , to=1 , length.out=100 )
# define prior
prior1 <- rep( 1 , 100 )
# compute likelihood at each value in grid
likelihood1 <- dbinom( 1 , size=1 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior1 <- likelihood1 * prior1
# standardize the posterior, so it sums to 1
posterior1 <- unstd.posterior1 / sum(unstd.posterior1)

plot(p_grid, posterior1, type="l", ylab = "plausibility", xlab="", labels=F, tick =F)
lines(p_grid, prior1-0.99,lty=2)
axis(side = 1, labels = T)

## update
# compute likelihood at each value in grid
likelihood2 <- dbinom( 0 , size=1 , prob=p_grid )
# compute product of likelihood and prior
unstd.posterior2 <- likelihood2 * posterior1
# standardize the posterior, so it sums to 1
posterior2 <- unstd.posterior2 / sum(unstd.posterior2)

plot(p_grid, posterior2, type="l", ylab = "plausibility", xlab="", labels=F, tick =F, ylim=c(0,0.03))
lines(p_grid, posterior1,lty=2)
axis(side = 1, labels = T)


plot( p_grid , posterior , type="b" ,
      xlab="probability of water" , ylab="posterior probability" )
mtext( "20 points" )