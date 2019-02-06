*****************************STATA***SYNTAX*****************************************************************************************************************
************************************************************************************************************************************************************
******************Saar**Alon-Barkat**&**Sharon**Gilad*******************************************************************************************************
************************************************************************************************************************************************************
*********************************June**2015******************************************************************************************************************
************************************************************************************************************************************************************
************************************************************************************************************************************************************


*Defining Time series and panel sections*
xtset  orgnmbr  month, monthly

*definitions*

gen pubFnd0_5 = pubFnd-0.5
gen pubFnd0_5byPrtst = pubFnd0_5*protest
gen pubFnd1 = pubFnd-1
gen pubFnd1byPrtst = pubFnd1*protest


*regression models*

**1a
xtreg DV2  semiatnm mnsrty   pubFnd protest ZscrLag1m   ZscrLag12m  incmLg  TargtOrg, re cluster ( orgnmbr)

**1b (only Funding)
xtreg DV2   pubFnd protest   pubFndbyPrtst ZscrLag1m  ZscrLag12m  incmLg   TargtOrg, re cluster ( orgnmbr)

**1c (only Autonomy)
xtreg DV2  semiatnm mnsrty   protest  semiatnmbyPrtst mnsrtybyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg, re cluster ( orgnmbr)

**1d (autonomy+funding)
xtreg DV2  semiatnm mnsrty  pubFnd protest  semiatnmbyPrtst mnsrtybyPrtst pubFndbyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg, re cluster ( orgnmbr)

**Breusch and Pagan Lagrange Multiplier Test
xtreg DV2  semiatnm mnsrty  pubFnd protest  semiatnmbyPrtst mnsrtybyPrtst pubFndbyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg, re cluster ( orgnmbr)
xttest0
**Hausman test
xtreg DV2  semiatnm mnsrty  pubFnd protest  semiatnmbyPrtst mnsrtybyPrtst pubFndbyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg, fe
estimates store fixed
xtreg DV2  semiatnm mnsrty  pubFnd protest  semiatnmbyPrtst mnsrtybyPrtst pubFndbyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg, re
estimates store random
hausman fixed random

*collinearity test model 1d
collin DV2  semiatnm indpn pubFnd1 protest pubFnd1byPrtst semiatnmbyPrtst indpnbyPrtst ZscrLag1m  ZscrLag12m  incmLg  TargtOrg

