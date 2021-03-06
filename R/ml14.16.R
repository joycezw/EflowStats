#' Function to return the ML14-ML16 hydrologic indicator statistics for a given data frame
#' 
#' This function accepts a data frame that contains columns named "discharge" and "year_val" and calculates 
#' ML14; Mean of annual minimum annual flows.  ML14 is the mean of the ratios of minimum annual flows to the median 
#' flow for each year (dimensionless-temporal). 
#' ML15; Low flow index.  ML15 is the mean (or median-Use Preference option) of the ratios of minimum annual flows to 
#' the mean flow for each year (dimensionless-temporal). 
#' ML16; Median of annual minimum flows.  ML16 is the median of the ratios of minimum annual flows to the median 
#' flow for each year (dimensionless-temporal). 
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @return ml14.16 list of ml14-ml16 for the given data frame
#' @export
#' @examples
#' qfiletempf<-sampleData
#' ml14.16(qfiletempf)
ml14.16 <- function(qfiletempf) {
  minbyyear <- aggregate(qfiletempf$discharge, 
                         list(qfiletempf$wy_val), min, na.rm=TRUE)
  medflow <- aggregate(qfiletempf$discharge, list(qfiletempf$wy_val), 
                       median, na.rm=TRUE)
  meanflow <- aggregate(qfiletempf$discharge, list(qfiletempf$wy_val), mean, na.rm=TRUE)
  computeml14 <- merge(merge(minbyyear, medflow, by.x="Group.1", by.y="Group.1"),meanflow, by.x="Group.1", by.z="Group.1")
  colnames(computeml14) <- c("year", "minbyyr", "medbyyr", "meanbyyr")
  dfml14 <- computeml14$minbyyr/computeml14$medbyyr
  dfml15 <- computeml14$minbyyr/computeml14$meanbyyr
  ml14 <- round(mean(dfml14),digits=2)
  ml16 <- round(median(dfml14),digits=2)
  ml15 <- round(mean(dfml15),digits=2)
  ml14.16 <- list(ml14,ml15,ml16)
  return(ml14.16)
}