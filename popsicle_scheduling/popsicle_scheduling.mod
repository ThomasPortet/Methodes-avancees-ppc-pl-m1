/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 4 mai 2020 at 14:22:16
 *********************************************/

range daysOfTheWeek = 0..6;

int requiredStaff[daysOfTheWeek] = ...;

{string} Employees = {"full time", "part time"};

int daysWorked [Employees] = ...;
{int} rangeWork[e in Employees]={d | d in daysOfTheWeek : d<daysWorked[e]};

int salaryPerDay [Employees] = ...;

dvar int+ start [daysOfTheWeek][Employees];


dexpr int working[d in daysOfTheWeek] [e in Employees] = sum (i in  rangeWork[e]) (start[(d - i + 7) % 7][e]);
dexpr int workingTotal[d in daysOfTheWeek]= sum( e in Employees) working [d][e];


dexpr int staffingCost = sum (d in daysOfTheWeek) (sum (e in Employees) working[d][e]  * salaryPerDay[e]);

minimize staffingCost;


subject to {
  forall (d in daysOfTheWeek)
    workingTotal[d] >= requiredStaff[d];
}