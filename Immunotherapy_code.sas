
data Immunotheraphy;
input sex age time number_of_warts type area induration_diameter result_of_treatment;

datalines;

0 22 2.25 14 3 51 50 1
0 15 3 2 3 900 70 1
0 16 10.5 2	1 100 25 1
0 27 4.5 9 3 80 30 1
0 20 8 6 1 45 8 1
0 15 5 3 3 84 7	1
0 35 9.75 2	2 8	6 1
1 28 7.5 4 1 9 2 1
1 19 6 2 1 225 8 1
1 32 12 6 3	35 5 0
1 33 6.25 2	1 30 3 1
1 17 5.75 12 3 25 7 1
1 15 1.75 1	2 49 7 0
1 15 5.5 12	1 48 7 1
1 16 10 7 1	143	6 1
1 33 9.25 2	2 150 8	1
1 26 7.75 6	2 6	5 1
1 23 7.5 10	2 43 3 1
1 15 6.5 19	1 56 7 1
1 26 6.75 2	1 6	6 1
0 22 1.25 3	3 47 3 1
1 19 2.25 2	1 60 7 1
1 26 10.5 6	1 50 9 0
0 25 5.75 2	1 300 7	1
1 17 11.25 4 3 70 7 1
0 27 5 2 1 20 5 1
1 24 4.75 10 3 30 45 1
0 15 11	6 1	30 25 0
1 34 11.5 12 1 25 50 0
1 20 7.75 18 3 45 2 1
1 38 2.5 1 3 43	50 1
0 23 3 2 3 87 70 1
1 48 10.25 7 1 50 25 1
1 24 4.25 1	1 174 30 1
1 33 8 3 1 502 8 1
0 34 5 7 3 64 7 0
1 41 11 11 2 21	6 0
0 29 8.75 3	1 504 2	1
1 22 8.5 5 1 99	8 1
0 45 11.25 4 1 72 5	0
1 22 8.25 9	1 352 3 1
0 35 8.75 10 2 69 7	1
1 34 8.5 1 2 163 7 0
0 49 4.5 2 1 33	7 0
1 19 11	5 2 51 6 1
0 21 8 3 1 17 8	1
0 26 7.75 13 2 13 5 1
0 51 8.75 2	2 57 3 1
0 19 7.75 6	1 32 7 1
0 38 12	14 1 87	6 0
1 36 1.75 10 3 45 3 1
1 52 2.25 5	1 63 7 1
1 49 9 4 2 14 9	1
0 23 5.75 2	1 43 7 1
0 45 10	8 1	58 7 1
0 54 7.5 13	3 43 5 1
1 47 5.25 3	3 23 45	1
1 53 10	1 2	30 25 1
1 56 11.75 7 1 31 50 0
0 27 11.25 3 2 37 2	1
1 47 3.75 14 2 67 50 1
1 19 2.25 8	2 42 70	1
1 33 8 5 1 63 25 1
1 15 4 12 1	72 30 1
0 17 8.5 2 1 44	8 1
0 29 5 12 3	75 7 1
0 27 11.75 8 1 208 6 0
1 51 6 6 1 80 2	1
0 35 6.75 4	3 41 8 1
1 47 10.75 8 1 57 5	0
0 43 8 1 1 59 3	1
0 15 4 4 3 25 7	1
0 33 1.75 7	2 379 7	0
1 51 4 1 1 65 7	1
0 45 6.5 9 2 49	6 1
1 47 9.25 13 2 367 8 1
0 18 11.75 5 2 13 5	1
1 46 7.75 8	1 40 3 1
0 43 11	7 1 507	7 1
1 28 11	3 3	91 6 0
0 30 1 2 1 88 3	1
1 16 2 11 1	47	7 1
1 42 8.75 8	2 73 9 0
1 15 8 1 1 55 7	1
1 53 7.25 6	1 81 7 1
0 40 5.5 8 3 69	5 1
0 38 7.5 8 2 56	45 1
0 46 11.5 4	1 91 25	0
0 32 12	9 1	43 50 0
1 23 6.75 6	1 19 2 1
;
run;
/* Gives the mean, std dev, and variance*/
proc means data=Immunotheraphy n mean var std;
run;

/* This step provides details of mean std dev and min* max values of mean*/
proc means data=Immunotheraphy;
var sex age time number_of_warts type area induration_diameter result_of_treatment;
run;

proc reg data=Immunotheraphy;
model  result_of_treatment=  sex age time number_of_warts type area induration_diameter;
run;

proc reg data=Immunotheraphy;
model  result_of_treatment=  sex ;
run;
proc reg data=Immunotheraphy;
model  result_of_treatment=   age ;
run;
proc reg data=Immunotheraphy;
model  result_of_treatment=   time ;
run;
proc reg data=Immunotheraphy;
model  result_of_treatment=   number_of_warts ;
run;
proc reg data=Immunotheraphy;
model  result_of_treatment=   type;
run;
proc reg data=Immunotheraphy;
model  result_of_treatment=  area;
run;
proc means data=Immunotheraphy alpha=0.05 n mean var std lclm uclm;
var sex age time number_of_warts type area induration_diameter result_of_treatment;
run;

proc reg data=Immunotheraphy;
model result_of_treatment = sex age time number_of_warts type area induration_diameter / clb cli clm;
run;

proc reg data=Immunotheraphy alpha=0.05;
model result_of_treatment = sex age time number_of_warts type area induration_diameter/  cli clm;
run;
/* Gives the correlation among all variables*/
proc corr data= Immunotheraphy;
var sex age time number_of_warts type area induration_diameter result_of_treatment;
run;
/* Gives the details of Variance inflation factors*/
proc reg data=Immunotheraphy;
model  result_of_treatment=  sex age time number_of_warts type area induration_diameter  /VIF;
run;
/* Using RSQUARE to select the two best submodels of each size*/
proc reg data = Immunotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area /selection = rsquare Best=2 adjrsq CP RMSE;
run;

/* Using ADJRSQ to select the seven best submodels*/
proc reg data = Immunotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area induration_diameter  /selection = adjrsq Best=7 CP RMSE;
run;

/* Performing stepwise procedure to select a model*/
proc reg data = Immunotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area induration_diameter  /selection = stepwise SLentry = .10 SLstay = .10;
run;

/* Performing Backward procedure to select a model*/
proc reg data = Immunotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area induration_diameter  /selection = backward SLstay = .10;
run;

/* Performing Residual analysis*/
proc reg data = Immunotheraphy;
model  result_of_treatment =  sex age time number_of_warts type area induration_diameter  ;
output out = results predicted = yhat
			  residual = resid;
proc plot data= results;
plot resid*(yhat sex age time number_of_warts type area induration_diameter );
proc univariate data= results normal plot;
var resid;
run;
ods select histogram;
proc univariate data= Immunotheraphy;
histogram result_of_treatment / normal(color=blue);
run;
ods select all;
proc sgplot data= Immunotheraphy;
histogram result_of_treatment;
density result_of_treatment;
density result_of_treatment/type=kernel;
keylegend/location=inside position=topright;
run;
