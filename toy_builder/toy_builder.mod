/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 4 mai 2020 at 13:34:59
 *********************************************/
{string} Toys = ...;
{string} Colors = ...;
int componentsNeed[Toys][Colors] = ...;

int profit [Toys] =...;
int Available [Colors]=...;

dvar int+ product[Toys];

maximize  
	sum( t in Toys )  
	(product[t]*profit[t]);
	
subject to {
  forall(c in Colors)
  	(sum (t in Toys)
  	  (componentsNeed[t][c]* product[t])) <= Available[c];
}