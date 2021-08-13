data Cryotheraphy;
input sex age time number_of_warts type area result_of_treatment;

datalines;

0 35 12 5 1 100 0
0 29 7 5 1 96 1
0 50 8 1 3 132 0
0 32 11.75 7 3 750 0
0 67 9.25 1 1 42 0
0 41 8 2 2 20 1
0 36 11 2 1 8 0
0 59 3.5 3 3 20 0
0 20 4.5 12 1 6 1
1 34 11.25 3 3 150 0
1 21 10.75 5 1 35 0
1 15 6 2 1 30 1
1 15 2 3 1 4 1
1 15 3.75 2 3 70 1
1 17 11	2 1 10 0
1 17 5.25 3 1 63 1
1 23 11.75 12 3 72 0
1 27 8.75 2 1 6 0
1 15 4.25 1 1 6 1
1 18 5.75 1 1 80 1
0 22 5.5 2 1 70 1
1 16 8.5 1 2 60 1
0 28 4.75 3 1 100 1
1 40 9.75 1 2 80 0
0 30 2.5 2 1 115 1
1 34 12	3 3 95 0
0 20 0.5 2 1 75 1
1 35 12 5 3 100 0
1 24 9.5 3 3 20 0
1 19 8.75 6 1 160 1
0 35 9.25 9 1 100 1
0 29 7.25 6 1 96 1
0 50 8.75 11 3 132 0
1 32 12 4 3 750 0
1 67 12 12 3 42 0
1 41 10.5 2 2 20 1
1 36 11	6 1 8 0
0 63 2.75 3 3 20 0
0 20 5 3 1 6 1
0 34 12 1 3 150 0
1 21 10.5 5 1 35 0
1 15 8 12 1 30 1
0 15 3.5 2 1 4 1
1 15 1.5 12 3 70 1
0 17 11.5 2 1 10 0
0 17 5.25 4 1 63 1
1 23 9.5 5 3 72 0
0 27 10 5 1 6 0
0 15 4 7 1 6 1
1 18 4.5 8 1 80 1
1 22 5 9 1 70 1
0 16 10.25 3 2 60 1
1 28 4 11 1 100 1
1 40 8.75 6 2 80 0
1 30 0.5 8 3 115 1
0 34 10.75 1 3 95 0
0 20 3.75 11 1 75 1
1 35 8.5 6 3 100 0
0 24 9.5 8 1 20 1
1 19 8 9 1 160 1
0 35 7.25 2 1 100 1
0 29 11.75 5 1 96 0
1 50 9.5 4 3 132 0
1 32 12 12 3 750 0
0 67 10 7 1 42 0
1 41 7.75 5 2 20 1
1 36 10.5 4 1 8 0
0 67 3.75 11 3 20 0
0 20 4 3 1 6 1
0 34 11.25 1 3 150 0
1 21 10.75 7 1 35 0
0 15 10.5 11 1 30 1
0 15 2 11 1 4 1
1 15 2 10 3 70 1
0 17 9.25 12 1 10 0
0 17 5.75 10 1 63 1
0 23 10.25 7 3 72 0
0 27 10.5 7 1 6 0
0 15 5.5 5 1 6 1
0 18 4 1 1 80 1
1 22 4.5 2 1 70 1
0 16 11 3 2 60 1
1 28 5 9 1 100 1
0 40 11.5 9 2 80 0
0 30 0.25 10 1 115 1
1 34 12 3 3 95 0
1 20 3.5 6 1 75 1
1 35 8.25 8 3 100 0
0 24 10.75 10 1 20 1
0 19 8 8 1 160 1
;
run;

/* Gives the mean, std dev, and variance*/
proc means data=Cryotheraphy n mean var std;
run;

/* This step provides details of mean std dev and min* max values of mean*/
proc means data=Cryotheraphy;
var sex age time number_of_warts type area result_of_treatment;
run;

proc reg data=Cryotheraphy;
model  result_of_treatment=  sex age time number_of_warts type area;
run;

proc reg data=Cryotheraphy;
model  result_of_treatment=  sex ;
run;
proc reg data=Cryotheraphy;
model  result_of_treatment=   age ;
run;
proc reg data=Cryotheraphy;
model  result_of_treatment=   time ;
run;
proc reg data=Cryotheraphy;
model  result_of_treatment=   number_of_warts ;
run;
proc reg data=Cryotheraphy;
model  result_of_treatment=   type;
run;
proc reg data=Cryotheraphy;
model  result_of_treatment=  area;
run;
proc means data=Cryotheraphy alpha=0.05 n mean var std lclm uclm;
var sex age time number_of_warts type area result_of_treatment;
run;

proc reg data=Cryotheraphy;
model result_of_treatment = sex age time number_of_warts type area / clb cli clm;
run;

proc reg data=Cryotheraphy alpha=0.05;
model result_of_treatment = sex age time number_of_warts type area /  cli clm;
run;
/* Gives the correlation among all variables*/
proc corr data= Cryotheraphy;
var sex age time number_of_warts type area result_of_treatment;
run;
/* Gives the details of Variance inflation factors*/
proc reg data=Cryotheraphy;
model  result_of_treatment=  sex age time number_of_warts type area /VIF;
run;
/* Using RSQUARE to select the two best submodels of each size*/
proc reg data = Cryotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area /selection = rsquare Best=2 adjrsq CP RMSE;
run;

/* Using ADJRSQ to select the seven best submodels*/
proc reg data = Cryotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area /selection = adjrsq Best=7 CP RMSE;
run;

/* Performing stepwise procedure to select a model*/
proc reg data = Cryotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area /selection = stepwise SLentry = .10 SLstay = .10;
run;

/* Performing Backward procedure to select a model*/
proc reg data = Cryotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area /selection = backward SLstay = .10;
run;

/* Performing Residual analysis*/
proc reg data = Cryotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area ;
output out = results predicted = yhat
			  residual = resid;
proc plot data= results;
plot resid*(yhat sex age time number_of_warts type area);
proc univariate data= results normal plot;
var resid;
run;
ods select histogram;
proc univariate data= Cryotheraphy;
histogram result_of_treatment / normal(color=blue);
run;
ods select all;
proc sgplot data= Cryotheraphy;
histogram result_of_treatment;
density result_of_treatment;
density result_of_treatment/type=kernel;
keylegend/location=inside position=topright;
run;
