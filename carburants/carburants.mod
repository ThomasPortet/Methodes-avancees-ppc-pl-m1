/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 19 mai 2020 at 14:23:57
 *********************************************/

{string} Carburants = ...;
{string} Constituants =...;

float constitutions[Carburants][Constituants] = ...; 
float reserve[Constituants] = ...;
float profit[Carburants]=...; //par metre cube

dvar float+ utilise[Constituants];
dvar float+ produit[Carburants];


dexpr float beneficeTotal = sum(c in Carburants) profit[c]*produit[c];

maximize beneficeTotal;

subject to {  
  forall (co in Constituants)
    utilise[co] == sum(ca in Carburants) produit[ca]*constitutions[ca][co];
    
  forall (co in Constituants)
    reserve[co] >= utilise[co];
  
  utilise["Gasoline"] >= 6000;
  utilise["Reformat"] >= 18000;
}