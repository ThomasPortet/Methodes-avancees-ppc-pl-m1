/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 28 avr. 2020 at 14:12:51
 *********************************************/
range equipes = 1..5;

dvar int+ resultats[equipes][equipes];

dexpr int  points[i in equipes] = sum (j in equipes : i!=j)  resultats[i][j];

subject to{
 forall (i in equipes)
   forall (j in equipes : j != i)
     resultats[i][j] + resultats [j][i] == 2 || resultats[i][j] + resultats [j][i] == 3;
     
  forall (i in equipes)
   forall (j in equipes : j != i)
     resultats[i][j] == 0 ||  resultats[i][j] == 1 || resultats[i][j] == 3;
  
 points[1]==1;
 points[2]==2;
 points[3]==5;
 points[4]==7;
}