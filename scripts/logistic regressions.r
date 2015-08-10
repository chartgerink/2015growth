# Set to folder
setwd(choose.dir())

dat <- read.table('data/data.csv', sep = ";", dec = ".", header = TRUE)

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

# Creating the predictor variables
dat$Year2 <- dat$Year * dat$Year
dat$dichYear <- as.factor(ifelse(dat$Year <= 1982, 0, 1))

summary(glm(meta.analysis.prop ~ Year +
              Year2 +
              dichYear,
    family = binomial(link = "logit"),
    data = dat))
summary(glm(dat$corrigenda.prop ~ dat$Year + dat$Year2 + dat$dichYear, family = binomial(link = "logit")))
