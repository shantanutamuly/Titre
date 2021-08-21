#'Calculates the cutoff value of ELISA
#'@export
#'@param x  numeric variable
#'@import stats
#'@references Frey, A., Canzio, JD., Zurakowski. 1998. A statistically defined endpoint titer determination method for immunoassays. Journal of Immunological Methods. 221:35-41
#'@author Shantanu Tamuly (drsan100@gmail.com)

cut_off <- function(x){
  m=mean(x)
  s=sd(x)
  n=length(x)
  df=n-1
  tcrit=qt(0.05, df=df, lower.tail = FALSE)  #95% confidence level
  f=tcrit*(sqrt(1+(1/n)))
  cutoff_value=m+(f*s)
  cutoff_value
  print(list(Cutoff_value=cutoff_value,Reference="Frey, A., Canzio, JD., Zurakowski. 1998. A statistically defined endpoint titer determination method for immunoassays. Journal of Immunological Methods. 221:35-41"))
}
