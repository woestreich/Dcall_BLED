################################################################################
## Download2kHz.R
##
## Use this script to download 2kHz PAM data from MBARI's MARS hydrophone.
##
################################################################################

## Input year, month, and days to download
y <- '2022'
m <- '09'
d <- seq(1,3)

## Input download location
savelocation <- "/Users/woestreich/Dropbox/Documents/MBARI_postdoc/BWO_2022/PAM_data/MARS/"

## This loops through files and downloads
ds <- sprintf("%02d",d)
for(i in 1:length(d)) {
  print(paste("downloading file",i,"of",length(ds)))
  urlbase <- "https://pacific-sound-2khz.s3.amazonaws.com/"
  url <- paste(urlbase,y,"/",m,"/","MARS-",y,m,ds[i],"T000000Z-2kHz.wav",sep="")
  download.file(url = url, 
                destfile = paste(savelocation,substr(url,53,82),sep=""), 
                method = 'curl')
}
