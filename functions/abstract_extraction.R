setwd(choose.dir())

if(!require(XML)){install.packages('XML')}

files <- list.files('searches/abstracts')
files <- files[grep('.*.xml', files)]

for(file in files)
  x <- xmlParse(paste0('searches/abstracts/', file))
  x <- xmlToDataFrame(x)  

  index <- sort(sample(x = 1 : length(x), size = 25, replace = FALSE))
  write.csv2(x$BIBTEX_Abstract[index], paste0(file, '_extracted.csv'))
  
  