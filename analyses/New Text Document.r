# Set to project folder
setwd(choose.dir())

# Dependencies
if(!require(psych)){install.packages('psych')}
library(psych)

chjh <- NULL
jmw <- NULL
abstract <- NULL
filessave <- NULL

files <- grep('*.csv', list.files('searches/abstracts/coding chjh/'), value = TRUE)

for(file in files){
  chjh <- c(chjh, read.table(paste0('searches/abstracts/coding chjh/', file),
                     header = TRUE, sep = ',')$chjh)
  jmw <- c(jmw, read.table(paste0('searches/abstracts/coding jmw/', file),
                           header = TRUE, sep = ',')$jmw)
  abstract <- c(abstract, as.character(read.table(paste0('searches/abstracts/coding jmw/', file),
                                       header = TRUE, sep = ',')$x))
  filessave <- c(filessave, file)
}

psych::cohen.kappa(cbind(chjh, jmw))
sum(ifelse(chjh == jmw, 0 , 1))
cbind(filessave, abstract, chjh, jmw)[!chjh == jmw, ]
mean(chjh[chjh == jmw])
length(chjh[chjh == jmw])

# Excluding false negatives and false positives, because CHJH added these out of interest
# Might lack specificity
chjh <- NULL
jmw <- NULL

files <- grep('*.csv', list.files('searches/abstracts/coding chjh/'), value = TRUE)
files <- files[-c(5, 6)]
for(file in files){
  chjh <- c(chjh, read.table(paste0('searches/abstracts/coding chjh/', file),
                             header = TRUE, sep = ',')$chjh)
  jmw <- c(jmw, read.table(paste0('searches/abstracts/coding jmw/', file),
                           header = TRUE, sep = ',')$jmw)
}

psych::cohen.kappa(cbind(chjh, jmw))
sum(ifelse(chjh == jmw, 0 , 1))
mean(chjh[chjh == jmw])
length(chjh[chjh == jmw])