/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 5 mai 2020 at 14:11:16
 *********************************************/

int chemin = ...;
int n = ...;
range lettres = 0..n+1;
range chiffres = 0..n+1;
range time = 1..chemin;

int probabilites[lettres][chiffres] = ...;


dvar boolean visite[time][lettres][chiffres];
dexpr int total =  sum (t in time)(sum(l in lettres) (sum (c in chiffres) (visite[t][l][c] * probabilites[l][c])));
maximize total;

subject to {
  
// At each time t, the rescue team visits a unique cell (i,j)
forall (t in time)
    (sum(l in lettres) (sum (c in chiffres) visite[t][l][c])) == 1;
    
// The fictive borders cannot be visited
forall (t in time, l in lettres: (l == 0 || l == n+1), c in chiffres : (c == 0 || c == n+1))
  visite[t][l][c] == 0;

// A cell is visited at most once.
forall (l in lettres, c in chiffres)
  (sum(t in time) visite[t][l][c])<=1;

// A cell can be visited at time t if and only if one of its neighbour is visited at time t-1.
forall (t in time: t > 1, l in lettres: (l >= 1 && l <= n), c in chiffres : (c >= 1 && c <= n))
	visite[t][l][c] <= 
	visite[t - 1][l + 1][c] +
    visite[t - 1][l - 1][c] +
    visite[t - 1][l][c + 1] +
    visite[t - 1][l][c - 1];
}