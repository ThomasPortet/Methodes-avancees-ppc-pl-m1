
/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 7 avr. 2020 at 15:24:53
 *********************************************/


{string} Products = ...;

 int MaximumDemand[Products] = ...;
 int SellingPrice [Products] = ...;
 int ProductionCost [Products] = ...;
 int ProductionQuota [Products] = ...;
 /*question 2*/
 int ActivationCost [Products] = ...;
 /*question 3*/
 int MinimumBatch [Products]= ...;

 dvar int+ number[Products];
 maximize
  sum( p in Products ) 
    ( (SellingPrice[p] - ProductionCost[p]/10) * number[p] /*question 2*/- (number[p] >= 1) * ActivationCost[p]);
    
 subject to {
   forall( p in Products )
     number[p] <= MaximumDemand[p];
     
   sum(p in Products)
     (number[p]/ProductionQuota[p]) <= 22;
     
   /*question 3*/
   forall( p in Products )
       number[p] == 0 || number[p] >= MinimumBatch[p];
     
 }
