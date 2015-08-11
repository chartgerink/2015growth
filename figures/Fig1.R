# Set to folder
# NOT figures folder
setwd(choose.dir())

library(ggplot2)
library(gtable)
source('functions//multiplot.r')

dat <- read.table('data/data.csv', sep = ";", dec = ".", header = TRUE)

y1 <- list(NULL)
y2 <- list(NULL)
mainlab <- NULL

y1[[1]] <- dat$journals
# Creating the proportion variables
y1[[2]] <- dat$meta.analysis / dat$articles
y1[[3]] <- dat$corrigenda / dat$articles 
y1[[4]] <- dat$critique / dat$articles 
y1[[5]] <- dat$reanalyses / dat$articles 
y1[[6]] <- dat$replications / dat$articles 
y1[[7]] <- dat$disconfirms / dat$articles 
y1[[8]] <- dat$retractions / dat$articles 
y1[[9]] <- dat$falsenegatives / dat$articles 
y1[[10]] <- dat$falsepositives / dat$articles 
y1[[11]] <- dat$bayes / dat$articles 

y2[[1]] <- dat$articles
y2[[2]] <- dat$meta.analysis
y2[[3]] <- dat$corrigenda
y2[[4]] <- dat$critique
y2[[5]] <- dat$reanalyses
y2[[6]] <- dat$replications
y2[[7]] <- dat$disconfirms
y2[[8]] <- dat$retractions
y2[[9]] <- dat$falsenegatives
y2[[10]] <- dat$falsepositives
y2[[11]] <- dat$bayes

mainlab[1] <- "(A) Articles and journals listed in PsycINFO"
mainlab[2] <- "(B) Meta-analyses 1950-2014"
mainlab[3] <- "(C) Corrigenda 1950-2014"
mainlab[4] <- "(D) Critiques 1950-2014"
mainlab[5] <- "(E) Reanalyses 1950-2014"
mainlab[6] <- "(F) Replications 1950-2014"
mainlab[7] <- "(G) Disconfirms 1950-2014"
mainlab[8] <- "(H) Retractions 1950-2014"
mainlab[9] <- "(I) False negatives 1950-2014"
mainlab[10] <- "(J) False positives 1950-2014"
mainlab[11] <- "(K) Bayes 1950-2014"

x <- dat$Year

pdf('figures/Fig1.pdf', width = 7, height = 8)
par(mar = c(4, 11, 2, 1) + 0.1, mfrow = c(6, 2))
for(i in 1:11){
  plot(x, y1[[i]],
       axes = F, ylim = c(0, ifelse(i == 1, max(y1[[i]]), .015)),
       xlab = "", ylab = "",
       type = "l", col = "black",
       main = mainlab[i], 
       xlim = c(1950, 2014))
  points(x,y1[[i]],
         pch = 20, col = "black", cex = .5)
  axis(2, ylim = c(0, max(y1[[i]])),
       col = "black", lwd = 1, las = 1, cex.axis = .7)
  mtext(2, text = "Proportion", line = 3, cex = .7)
  
  par(new = T)
  plot(x, y2[[i]],
       axes = F, ylim = c(0, max(y2[[i]])),
       xlab = "", ylab = "", 
       type = "l", lty = 1,
       main = "", xlim = c(1950, 2014), lwd = .5)
  axis(2, ylim = c(0, max(y2[[i]])), lwd = 1, line = 5.5, las = 1, cex.axis = .7)
  points(x, y2[[i]], pch = 4, cex = .5)
  mtext(2, text =" Absolute", line = ifelse(i == 1, 9.5, 8.5), cex = .7)
  
  axis(1, pretty(range(x), 10), cex.axis = .7)
  mtext("Year", side = 1, col = "black", line = 2.5, cex = .7)
}
par(mar = c(0, 0, 0, 0))
plot(0:10, 0:10, type = 'n', bty = 'n', xlab = "", ylab = "", axes = F)
legend(x = 3, y = 10,
       legend = c("Proportion", "Absolute"),
       lty = c(1, 1), bty = 'n', lwd = c(1, .5), cex = 1.5,
       pch = c(20, 4))
dev.off()