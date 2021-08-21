# Titre
This R package can be used to determine the cutoff value in ELISA and the titre value
Determination of cutoff value of ELISA
For determination of cutoff value of ELISA, the ODs of the negative controls are required. So, create the vector containing OD values of negative control wells.
cut_off(x)
Arguments
x	numeric variable containing the OD values of negative controls

Author(s)
Shantanu Tamuly (drsan100@gmail.com)

References
Frey, A., Canzio, JD., Zurakowski. 1998. A statistically defined endpoint titer determination method for immunoassays. Journal of Immunological Methods. 221:35-41
Examples
>x=c(0.01,0.011,0.0125,0.0145,0.0111,0.01123)
> cut_off(x)
$Cutoff_value
[1] 0.01515448

$Reference
[1] "Frey, A., Canzio, JD., Zurakowski. 1998. A statistically defined endpoint titer determination method for immunoassays. Journal of Immunological Methods. 221:35-41"



———————————————————————————————————
 
Determination of titre value
titre(cutoff, dilutions, OD, n)
Arguments
cutoff: 		(numeric variable) this indicates the cutoff value of ELISA
dilutions: (numeric variable) different dilutions of serum or antigen
OD: (numeric variable) this indicates the optical densities
n: (numeric variable) this refers to the number of times the dilutions are made. Generally, for ELISA it is 2 fold dilution (so n=2)
Value:
Generates a dataframe containing the predicted values of ELISA without transformation, with log transformation and with reciprocal transformation; R-square values of each of the transformations and the p-values of each of the transformations.
Examples:
> dil=c(100,200,400,800,1600)	# Dilutions of ELISA (2 fold dilution, hence n=2)
> OD=c(0.4,0.25,0.11,0.056,0.021)
> titre(cutoff = 0.015, dilutions = dil, OD = OD, n=2)         
Statistic	Untransformed	Log	Reciprocal
R_Square	0.643969523	0.924203983	0.981073266
p.value	0.102200884	0.009066411	0.001111441
Predicted_titre	1096.393754	1115.410626	5001.438262

>


