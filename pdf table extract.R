
###loadpackage
pacman::p_load(
  "tidyverse"
  , "tabulizer"
  , "data.table"
  , "shiny"
)

### choose table and extract tables


pdf_list <- file.choose(new = TRUE)
pdf_list <- extract_tables(pdf_list)

###merge tables, transpose table , convert to data frame

df <- data.frame(matrix(unlist(pdf_list), nrow=16, byrow=T),stringsAsFactors=FALSE)
df<-t(df)

df <-data.frame(df)

### rename columns 

dat<-df
names(dat) <- as.matrix(dat[1, ])
dat <- dat[-1, ]
dat[] <- lapply(dat, function(x) type.convert(as.character(x)))
dat






