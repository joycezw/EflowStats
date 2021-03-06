#' Function to return the ML19 hydrologic indicator statistic for a given data frame
#' 
#' This function accepts a data frame that contains columns named "discharge" and "year_val" and 
#' calculates the base flow index ML19. Compute the ratios of the minimum annual flow to mean annual flow for 
#' each year. ML19 is the mean (or median-Use Preference option) of these ratios times 100 (dimensionless-temporal).
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @param pref string containing a "mean" or "median" preference
#' @return ml19 numeric value of ML19 for the given data frame
#' @export
#' @examples
#' qfiletempf<-sampleData
#' ml19(qfiletempf)
ml19 <- function(qfiletempf, pref = "mean") {
  minbyyr <- aggregate(qfiletempf$discharge,list(qfiletempf$wy_val),FUN=min,na.rm=TRUE)
  colnames(minbyyr) <- c("Year","yrmin")
  meanbyyr <- aggregate(qfiletempf$discharge,list(qfiletempf$wy_val),FUN=mean,na.rm=TRUE)
  colnames(meanbyyr) <- c("Year","yrmean")
  ratiominmean <- (minbyyr$yrmin/meanbyyr$yrmean)
  if (pref == "median") {
    ml19 <- round(median(ratiominmean)*100,digits=2)
  }
  else {
    ml19 <- round(mean(ratiominmean)*100,digits=2)
  }
  return(ml19)
}