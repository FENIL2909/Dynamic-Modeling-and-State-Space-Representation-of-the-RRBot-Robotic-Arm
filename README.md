# Dynamic-Modeling-and-State-Space-Representation-of-the-RRBot-Robotic-Arm

Files:
Symbolic_rep.m - Consists of solution for the Lagrangain of the two link RRBot system. 
		 It also has implementation for Euler-Lagrangian solution of the same system.
		 This code generates the Equations of Motion (E.O.M) for the give system.
		 Implements all these files symbollically. 


state_space_model.m - Uses the EOM obtained by symbolic_rep.m file and converts it into a list of 1st order differential equations
		      corresponding to the state veriables of the system.
		      Implements all these files symbollically.  

ode_rrbot.m - Implements the Odinary Differential equation using the equations corresponding to the time derivative of the state variables
	      and initializes all the symbolic varibales used in the above two files.  

main.m - These file combines everything together and intergates all the ODEs over the given time period and provides a simulation of the 
	 RRBot system. 
	 

Running the file:
Please run the files in the given order - 
symbolic_rep.m
state_model.m
main.m *(Please toggle the visualization flag on line 3 of main.m file in the submission to “true” see the RRbot (the two-link robot)
	 in action. !!! )



   

 
 