/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 28 avr. 2020 at 14:52:26
 *********************************************/
{string} Habitants = ...;
range ponts = 1..4;
 tuple Position{
   int d; // distance au pont
   int y;
 }
 
Position positionMaison [Habitants] = ...;
Position positionTravail [Habitants] = ...;
int hauteurPonts [ponts] = ...;

dvar int+ pontConstruit [ponts] in 0..1;
dexpr int dist[h in Habitants][p in ponts] = 
	positionMaison[h].d 
	+ ftoi(abs(positionMaison[h].y - hauteurPonts[p]))
	+ 3
 	+ ftoi(abs(positionTravail[h].y - hauteurPonts[p]))
 	+ positionTravail[h].d;
 	
dexpr int plusCourtChemin [h in Habitants] = min (p in ponts) ((pontConstruit[p] == 0) *1000000 + dist[h][p]);

minimize sum (H in Habitants) plusCourtChemin[H];
subject to{
  sum(p in ponts ) pontConstruit [p] == 2;
}