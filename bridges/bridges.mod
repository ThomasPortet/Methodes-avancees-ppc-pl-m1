/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Arnaud Malapert
 * Creation Date: 28 avr. 2020 at 22:49:15
 * Bridges : http://puzzlor.com/2009-08_Bridges.html
 *********************************************/
// Number of residents/workers 
int n = ...;
range N = 1..n;
// Number of possible bridges
int m = ...;
range M = 1..m;

// Number of bridges to build
int mb = ...;

// The coordinates of the homes. The origin is at the top-right corner.
int homeX[N] = ...;
int homeY[N] = ...;
// The coordinates of the offices. The origin is at the top-left corner.
int workX[N] = ...;
int workY[N] = ...;

// The x-coordinate of the brides is 0. So we only need their y-coordinates. The origin is at the top.
int bridgeY[M] = ...;

// Beware that these are DATA.
// We precompute the distance between the home and the left extremity of the bridge. 
int distHome[i in N][j in M] = homeX[i] + (homeY[i] > bridgeY[j] ? homeY[i] - bridgeY[j]  : bridgeY[j] - homeY[i]);
// We precompute the distance between the right extremity of the bridge and the office.
int distWork[i in N][j in M] = workX[i] + (workY[i] > bridgeY[j] ? workY[i] - bridgeY[j]  : bridgeY[j] - workY[i]);
// We compute the total distance between homes and offices passing through the different bridges.
// We do not count the length of the bridges that are all equal.
int distTotal[i in N][j in M] = distHome[i][j] + distWork[i][j];

// We precompute a bigM constant depending on the largest coordinates.
// The bigM must be larger than the longest possible distance in the grid.
int bigX = maxl(max(i in N) homeX[i], max(i in N) workX[i]);
int bigY = maxl(max(i in N) homeY[i], max(i in N) workY[i], max(j in M) bridgeY[j]);
int bigM = 2 * bigX * bigY;

// The variables indicate which bridges are used/built
dvar boolean used[M];
// The expression updates the distances between homes and offices depending on the existence of the bridges.
dexpr int dist[i in N][j in M] = distTotal[i][j] + bigM * (1 - used[j]);
// The expression gives the smallest distance for a resident using one of the existing bridge.
dexpr int minDist[i in N] = min(j in M) dist[i][j];

// Minimize the total distance travelled by the residents. 
// This is equivalent to minimizing the average distance.
minimize sum(i in N) minDist[i];

subject to {
  // The only constraint limitates the number of built bridges.
  sum(j in M) used[j] == mb;
  
}