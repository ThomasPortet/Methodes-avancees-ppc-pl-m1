/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 21 avr. 2020 at 15:23:01
 *********************************************/

int nMonths = ...;
range months = 1..nMonths;
range months0 = 0..nMonths;
int demand[months] = ...;
int nWorkers = ...;
int defaultProduced = ...;

dvar int+ workers[months];
dvar int+ storage[months0];
dvar int+ extraproduced[months];
dvar int+ employment[months];
dvar int+ dismissals[months];

dexpr int  employmentanddismissalCosts = sum(m in months) (employment[m]*500 + dismissals[m]*700);
dexpr int  storageCosts = sum(m in months0) (storage[m]*10);
dexpr int extraProducedCosts = sum(m in months) (extraproduced[m]*5);

minimize employmentanddismissalCosts + storageCosts + extraProducedCosts;
subject to {
  
workers[1] == 40;
storage[nMonths] == 0;
storage[0] == 0;

forall (m in months )
  storage[m] == storage[m-1] + workers[m]*defaultProduced + extraproduced[m]-demand[m];
  
forall (m in months )
  extraproduced[m] <= 6*workers[m];

forall (m in months : m>1 )
  workers[m] == workers[m-1]+employment[m]-dismissals[m];

forall (m in months)
 abs (dismissals[m]- employment[m])<=5;

forall (m in months)
  demand[m]<=extraproduced[m]+storage[m-1]+ workers[m]*defaultProduced;
  
}  
