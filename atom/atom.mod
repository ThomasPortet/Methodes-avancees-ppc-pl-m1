/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Thomas
 * Creation Date: 4 mai 2020 at 14:01:47
 *********************************************/
using CP;

{string} Letters = {"a", "t", "o", "m"};
 

 
dvar int+ numbers[Letters];


subject to  {
  allDifferent(all (l in Letters) numbers[l]);
  
  forall (l in Letters)
    numbers[l] <= 9 && numbers[l] >= 0;
    
  numbers["a"] * 1000 + numbers["t"] * 100 + numbers["o"] * 10 + numbers["m"] ==
   (numbers ["t"]*10 + numbers ["a"] + numbers ["o"]+ numbers ["m"])^2;
   
   
   numbers ["a"] != 6; // pour obtenir la deuxième solution
}