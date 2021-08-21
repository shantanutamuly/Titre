#'Calculates the titre value of ELISA
#'@export
#'@param cutoff (numeric variable) this indicates the cutoff value of ELISA
#'@param dilutions (numeric variable)  different dilutions of serum or antigen
#'@param OD (numeric variable) this indicates the optical density
#'@param n (numeric variable) this refers to the number of times the dilutions are made. Generally, for ELISA it is 2 fold dilution (so n=2)
#'@import broom
#'@import stats
#'@author Shantanu Tamuly (drsan100@gmail.com)
titre <- function(cutoff,dilutions,OD,n){
  df=data.frame(dilutions,OD)
  is.data.frame(df)
  reg=lm(dilutions~OD,df)
  logreg=lm(log(dilutions,base = n)~OD,df)
  recreg=lm(1/(dilutions)~OD,df)
  s=summary(reg)
  sl=summary(logreg)
  sr=summary(recreg)
  regs=broom::tidy(reg)
  logregs=broom::tidy(logreg)
  recregs=broom::tidy(recreg)
  p=predict(reg,data.frame(OD=cutoff))
  pl=n^(predict(logreg,data.frame(OD=cutoff)))
  pr=1/predict(recreg,data.frame(OD=cutoff))
  preds=data.frame("Predicted_titre",p,pl,pr)
  names(preds)=c("Statistic","Untransformed","Log","Reciprocal")
  Rsq=s$r.squared
  Lsq=sl$r.squared
  Recsq=sr$r.squared
  R_square=data.frame("R_Square",Rsq,Lsq,Recsq)
  names(R_square)=c("Statistic","Untransformed","Log","Reciprocal")
  pv=s$coefficients[2,4]
  pvl=sl$coefficients[2,4]
  pvr=sr$coefficients[2,4]
  p.value=data.frame("p.value",pv,pvl,pvr)
  names(p.value)=c("Statistic","Untransformed","Log","Reciprocal")
  result=rbind(R_square,p.value,preds)
  result
}

