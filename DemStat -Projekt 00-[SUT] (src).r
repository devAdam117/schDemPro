install.packages("data.table")                   
library("data.table")
n <- 100000
ages <- floor(rnorm(n,70.5, 40))
ages <- ages[ages>=0 & ages <120]
sum(ages==1)
sum(ages==120)
ages <- append(ages,rep(0,(n-length(ages))))

gender <- rbinom(n,1,.505)

smokers <- rbinom(n,1,0.14)
smokers[ages<16] <- 0

totalTimeSmokers <-  floor(rnorm(n,10, 3))
totalTimeSmokers[totalTimeSmokers>= (ages + 16) | totalTimeSmokers<0 | smokers==0 ] <- 0

riskWorkRate <- rbinom(n,3 ,.5)
riskWorkRate[ages < 18 ] <- 0

lastAgeChange <- floor(rnorm(n,5, 6))
lastAgeChange[ (ages-lastAgeChange) < 18 | lastAgeChange<0] <- 0
lastAgeChange <- ages - lastAgeChange


carAccidents <- floor(rexp(n,1))
carAccidents[ages<18] <- 0


dataTable <- data.table(ages,gender,smokers,totalTimeSmokers,riskWorkRate,lastAgeChange,carAccidents)
write.csv(dataTable,'data.csv')
