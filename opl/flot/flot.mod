/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 14 avr. 2020 at 14:58:38
 *********************************************/

tuple Arc {
int origin;
int destination;
int capacity;
int cost;
}

int source = ...;
int puit = ...; 

int nSommets = ...;
range sommets = 1..nSommets;
{Arc} arcList = ...;



dvar int+ flot[arcList];

dexpr int e1 = sum (a in arcList: a.origin==source) flot[a];
  
dexpr int e2 = -sum (a in arcList ) flot[a];

maximize staticLex(e1, e2);
    
subject to {
  forall(s in sommets : s != source && s!=puit)
    sum (a in arcList: a.origin==s) flot[a]==
    sum (a in arcList: a.destination==s) flot[a];
  forall (a in arcList )
    flot[a] <= a.capacity;
}