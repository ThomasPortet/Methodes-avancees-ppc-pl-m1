/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 19 mai 2020 at 13:57:43
 *********************************************/
  tuple Item{
   string name; 
   int sodium;
   int fat;
   int calories;
   int cost; //in cents
 }
{Item} Items  = ...;

dvar int+ itemCount[Items];

dexpr int burgerCost = sum( i in Items) itemCount[i]*i.cost;
maximize burgerCost;

subject to{
  forall( i in Items)
    itemCount[i]>=1 && itemCount[i]<=5;
    
  sum( i in Items) 
  	(itemCount[i]*i.sodium)<=3000;
  
  sum( i in Items) 
  	(itemCount[i]*i.fat)<=150;
  	
  sum( i in Items) 
  	(itemCount[i]*i.calories)<=3000;
  
  forall(i in Items : i.name=="Ketchup",j in Items : j.name=="Lettuce")
  	itemCount[i] == itemCount[j];
  	
  forall(i in Items : i.name=="Pickles",j in Items : j.name=="Tomato")
  	itemCount[i] == itemCount[j];
}