# Set to folder
# NOT figures folder
setwd(choose.dir())

library(ggplot2)
library(gtable)
source('functions//multiplot.r')

dat <- read.table('data/data.csv', sep = ",", dec = ".", header = TRUE)

y1 <- list(NULL)
y2 <- list(NULL)
mainlab <- NULL

y1[[1]] <- dat$journals
# Creating the proportion variables
y1[[2]] <- dat$meta.analysis / dat$articles
y1[[3]] <- dat$corrigenda / dat$articles 
y1[[4]] <- dat$retractions / dat$articles
y1[[5]] <- dat$reanalyses / dat$articles 
y1[[6]] <- dat$replications / dat$articles 
y1[[7]] <- dat$disconfirms / dat$articles 
y1[[8]] <- dat$critique / dat$articles 
y1[[9]] <- dat$bayes / dat$articles 

y2[[1]] <- dat$articles
y2[[2]] <- dat$meta.analysis
y2[[3]] <- dat$corrigenda
y2[[4]] <- dat$retractions
y2[[5]] <- dat$reanalyses
y2[[6]] <- dat$replications
y2[[7]] <- dat$disconfirms
y2[[8]] <- dat$critique
y2[[9]] <- dat$bayes

mainlab[1] <- "(A) Listed in PsycINFO"
mainlab[2] <- "(B) Meta-analyses"
mainlab[3] <- "(C) Corrigenda"
mainlab[4] <- "(D) Retractions"
mainlab[5] <- "(E) Reanalyses"
mainlab[6] <- "(F) Replications"
mainlab[7] <- "(G) Disconfirms"
mainlab[8] <- "(H) Critiques"
mainlab[9] <- "(I) Bayes"

x <- dat$Year

pdf('figures/Fig1.pdf', width = 7, height = 8)
par(mar = c(4, 11, 2, 1) + 0.1, mfrow = c(5, 2))
for(i in 1:9){
  if(i == 1){
    yt = 2500
  } else if(i == 2){
    yt = .012
  }else if(i == 4){
    yt = .0006
  } else if(i == 5){
    yt = .002
  } else if(i == 6){
    yt = .007
  } else if(i == 7){
    yt = .003
  } else if(i == 8){
    yt = .014
  }else {yt = .005}
  
  plot(x, y1[[i]],
       axes = F, ylim = c(0, yt),
       xlab = "", ylab = "",
       type = "l", col = "grey",
       main = mainlab[i], 
       xlim = c(1950, 2014))
  points(x,y1[[i]],
         pch = 20, col = "grey", cex = .5)
  axis(2, ylim = c(0, max(y1[[i]])),
       col = "black", lwd = 1, las = 1, cex.axis = .7)
  mtext(2, text = ifelse(i == 1, "Journals", "Proportion"), line = 3, cex = .7)
  
  par(new = T)
  plot(x, y2[[i]],
       axes = F, ylim = c(0, max(y2[[i]])),
       xlab = "", ylab = "", 
       type = "l", lty = 1,
       main = "", xlim = c(1950, 2014), lwd = 1, col = "black")
  axis(2, ylim = c(0, max(y2[[i]])), lwd = 1, line = 5.5, las = 1, cex.axis = .7)
  points(x, y2[[i]], pch = 20, cex = .5, col = "black")
  mtext(2, text = ifelse(i == 1, "Articles", "Absolute"),
        line = ifelse(i == 1, 9.5, 8.5), cex = .7)
  
  axis(1, pretty(range(x), 10), cex.axis = .7)
  mtext("Year", side = 1, col = "black", line = 2.5, cex = .7)
}
par(mar = c(0, 0, 0, 0))
plot(0:10, 0:10, type = 'n', bty = 'n', xlab = "", ylab = "", axes = F)
legend(x = 3, y = 10,
       legend = c("Articles (Panel A)", "Journals (Panel A)"),
       lty = c(1, 1), bty = 'n', lwd = c(1, 1), cex = 1.2,
       pch = c(20, 20), col = c("black", "grey"))
legend(x = 3, y = 5,
       legend = c("Absolute (Panel B-I)", "Proportion (Panel B-I)"),
       lty = c(1, 1), bty = 'n', lwd = c(1, 1), cex = 1.2,
       pch = c(20, 20), col = c("black", "grey"))
dev.off()