/*********************************************
 * OPL 12.10.0.0 Model
 * Author: HeiligesLicht
 * Creation Date: 5 May 2020 at 14:04:32
 *********************************************/
using CP;

// Nombre de déplacements
int k = ...;

// Range de lignes
range n = 1..8;

// Range de colonnes
range m = 1..8;
 
// La grille a ses lignes inversées pour faire simple
 int proba[n][m] = ...;
 
// Range des déplacements
 range numMoves = 1..k;
 
// k variables => Les déplacements en question.
 dvar int+ moves[numMoves];
 
// On maximise la somme des probabilités pour chaque déplacement.
// Une cellule à la ligne i et colonne j peut être encoder comme (move = i * 10 + j)
// Donc, pour obtenir la colonne du déplacement on fait (n % 10) et pour la ligne c'est (n div 10).
 dexpr int total =sum(i in numMoves) proba[moves[i] div 10][moves[i] % 10];
 maximize total;
 
 subject to {
   // Pour chaque déplacement, on s'assure qu'on dépasse pas les limites de la grille.
   // i dans n et j dans m, pour chaque move = i * 10 + j.
   forall(i in numMoves) (moves[i] div 10) in n && (moves[i] % 10) in m;
   
   // Entre deux déplacements d1 et d2:
   // Si le déplacement est vertical: abs(d1-d2) = 10
   // Si le déplacement est horizontal: abs(d1-d2) = 1
   forall(i in numMoves: i > 1) abs(moves[i]-moves[i-1]) == 1 || abs(moves[i]-moves[i-1]) == 10;
   
   // Les déplacements sont uniques. On ne revient pas sur une cellule déjà visitée.
   allDifferent(moves);
 }