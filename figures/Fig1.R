# Set to folder
# NOT figures folder
setwd(choose.dir())

library(ggplot2)
library(gtable)
source('functions//multiplot.r')

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


x <- dat$Year
y1 <- dat$meta.analysis.prop
y2 <- dat$meta.analysis
mainlab <- "Meta-analyses"

par(mar = c(4, 10, 2, 1) + 0.1)

plot(x, y1,
     axes = F, ylim = c(0, max(y1)),
     xlab = "", ylab = "",
     type = "l", col = "black",
     main = mainlab, 
     xlim = c(1950, 2014))
points(x,y1,
       pch = 20, col = "black")
axis(2, ylim = c(0, max(y1)),
     col = "black", lwd = 2, las = 1)
mtext(2, text = "Proportion", line = 4)

par(new = T)
plot(x, y2,
     axes = F, ylim = c(0, max(y2)),
     xlab = "", ylab = "", 
     type = "l", lty = 2,
     main = "", xlim = c(1950, 2014), lwd = 1)
axis(2, ylim = c(0, max(y2)), lwd = 2, line = 5.5, las = 1)
points(x, y2, pch = 20)
mtext(2, text =" Absolute", line = 8.5)

#We can now draw the X-axis, which is of course shared by all the three time-series.
axis(1,pretty(range(x),10))
mtext("Year",side=1,col="black",line=2.5)

#And then plot the legend.
legend(x=1950,y=1500,legend=c("Proportion", "Absolute"),lty=c(1,2), bty = 'n', lwd = c(2, 2))
