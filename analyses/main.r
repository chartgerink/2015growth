# Set to folder
setwd(choose.dir())
library(plyr)

dat <- read.table('data/data.csv', sep = ";", dec = ".", header = TRUE)

articles <- ddply(dat, .(articles, Year), .fun = function(x) sum(x$articles))
articles1950_1982 <- sum(articles$V1[articles$Year <= 1982])
articles1983_2014 <- sum(articles$V1[articles$Year > 1982])
prop.

# Creating the proportion variables
dat$meta.analysis.prop <- dat$meta.analysis / dat$articles
dat$corrigenda.prop <- dat$corrigenda / dat$articles 
dat$critique.prop <- dat$critique / dat$articles 
dat$reanalyses.prop <- dat$reanalyses / dat$articles 
dat$replications.prop <- dat$replications / dat$articles 
dat$disconfirms.prop <- dat$disconfirms / dat$articles 
dat$retractions.prop <- dat$retractions / dat$articles 
dat$falsenegatives.prop <- dat$falsenegatives / dat$articles 
dat$falsepositives.prop <- dat$falsepositives / dat$articles 
dat$bayes.prop <- dat$bayes / dat$articles 

# Dichotomizing data
dat$dichYear <- as.factor(ifelse(dat$Year <= 1982, 0, 1))

# Mean proportion for
# 0 = 1950-1982
# 1 = 1983-2014
mean(dat$meta.analysis.prop[dat$dichYear == 0])
mean(dat$meta.analysis.prop[dat$dichYear == 1])

mean(dat$corrigenda.prop[dat$dichYear == 0])
mean(dat$corrigenda.prop[dat$dichYear == 1])

mean(dat$retractions.prop[dat$dichYear == 0])
mean(dat$retractions.prop[dat$dichYear == 1])

mean(dat$reanalyses.prop[dat$dichYear == 0])
mean(dat$reanalyses.prop[dat$dichYear == 1])

mean(dat$replications.prop[dat$dichYear == 0])
mean(dat$replications.prop[dat$dichYear == 1])

mean(dat$disconfirms.prop[dat$dichYear == 0])
mean(dat$disconfirms.prop[dat$dichYear == 1])

mean(dat$critique.prop[dat$dichYear == 0])
mean(dat$critique.prop[dat$dichYear == 1])

mean(dat$bayes.prop[dat$dichYear == 0])
mean(dat$bayes.prop[dat$dichYear == 1])
