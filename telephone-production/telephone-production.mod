/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 7 avr. 2020 at 15:24:53
 *********************************************/


{string} Products = ...;
{string} Machines = ...;

 int machineTimes[Products][Machines]=...;
 int machineAvailabilityTime [Machines]=...;
 int productPrice [Products]=...;

 dvar int+ numberProduced[Products];

 
 
 maximize
  sum( p in Products ) 
    ( productPrice[p] * numberProduced[p]);
    
 subject to {
   forall( p in Products )
     numberProduced[p]>=100;
     
    forall( m in Machines )
    machineTimeUsed: 
      sum( p in Products ) 
        numberProduced[p]*machineTimes[p][m] <= machineAvailabilityTime[m];

 }
 