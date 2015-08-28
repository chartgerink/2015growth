setwd(choose.dir())

if(!require(XML)){install.packages('XML')}

files <- list.files('searches/abstracts/xml')
files <- files[grep('.*.xml', files)]

for(file in files){
  x <- xmlParse(paste0('searches/abstracts/xml/', file))
  x <- xmlToDataFrame(x)  

  index <- sort(sample(x = 1 : dim(x)[1], size = 25, replace = FALSE))
  write.csv2(x$BIBTEX_Abstract[index], paste0('searches/abstracts/',
                                              substr(file, start = 1, stop = nchar(file) - 4),
                                              '_extracted.csv'))  }