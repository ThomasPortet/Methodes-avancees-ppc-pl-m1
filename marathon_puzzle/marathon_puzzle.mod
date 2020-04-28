/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 28 avr. 2020 at 13:34:28
 *********************************************/
 using CP;
{string} Runner = {"Dominique", "Ignace", "Naren", "Olivier", "Philippe", "Pascal"};


dvar int+ placement[Runner];


subject to {
  
 allDifferent(all(r in Runner) placement[r]);
 
 forall (r in Runner)
  placement[r] >= 1 && placement[r] <=6;
  
 forall (r1 in Runner :  r1 == "Dominique" || r1 == "Pascal" || r1 == "Ignace")
   forall (r2 in Runner :  r2 == "Naren" || r2 == "Olivier")
  	placement[r1]+1 <= placement[r2];
  	
placement["Olivier"] != 6;

placement["Dominique"] <= 2;
placement["Philippe"] <= 4;
placement["Ignace"] != 3;
placement["Ignace"] != 2;

placement["Pascal"] + 3 == placement["Naren"];
placement["Ignace"] != 4;
placement["Dominique"] != 4;
}