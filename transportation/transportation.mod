/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 14 avr. 2020 at 14:08:11
 *********************************************/
{string} Stores = ...;
{string} Ports = ...;

 int storeContainers [Stores]=...;
 int containerDemand [Ports]=...;
 int distance [Stores][Ports]=...;

 dvar int+ conteneurs [Stores][Ports];
 dvar int+ camions [Stores][Ports];
 
 minimize
  sum (s in Stores) 
  sum (p in Ports)
	camions[s][p]*distance[s][p]*30;
	    
 subject to {
   forall( p in Ports ) 
   	sum( s in Stores ) 
        conteneurs[s][p] == containerDemand[p];
    forall (s in Stores) sum(p in Ports) (conteneurs[s][p]) <= storeContainers[s];
    forall (s in Stores) forall(p in Ports) (2 * camions[s][p] >= conteneurs[s][p]);
 }