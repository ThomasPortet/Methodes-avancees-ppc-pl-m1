/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 21 avr. 2020 at 14:42:36
 *********************************************/
int nCars = ...;
range cars = 1..nCars;
float len[cars] = ...;
dvar int sideofTheRoad[cars]; // 1 ou -1
dexpr float side1 = sum(c in cars )len[c]*(sideofTheRoad[c]==-1);
dexpr float side2 = sum(c in cars )len[c]*(sideofTheRoad[c]==1);
minimize abs (side1-side2);

subject to {
  forall(c in cars )
    sideofTheRoad[c]==1 || sideofTheRoad[c]==-1;
   side1<=15;
  }