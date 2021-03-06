Amber Harriger and Joe Pappas
29 February 2016
Programming Assignment 1
Finn

Included Files:
aStar.m: This is the File that runs the A* search
BFS.m: This is the file that runs breadth-first search
IDS.m: This is the file that runs Iterative Deepening Search
Eight.m: This is the model for the eight puzzle used in BFS and in IDS
eightHeuristic.m: This is the model for the eight puzzle used in A* which is the same as the previous but includes heuristic elements
hasBeenExplored.m: This is a helper function for the searches and the test creation file which checks if a eight puzzle layout has been explored yet
heuristic.m: This is a helper function for the eightHeuristic model which is used to calculate the taxi cab metric
createDataOutput.m: This file is used to create the histogram and calculate the mean and variance for the time array and the iterations array
CQueue.m: Queue implementation

Files for Testing:
createTests.m: This file starts with the layout of the goal state and moves in directions it hasn't moved in before and to layouts
that have not been explored and returns all of the layouts with a path cost equal to the input path cost
testCasesEightHeuristic.m: This file uses createTest.m to create the 50 test files 10 of each of the following pathcost: 10, 15, 20, 25, 30
traceGoaltoInit.m: This file is used after a goal state has been found and tells the user the steps taken to get to the goal state
runAStarTestCases.m: This file is used to run A* on the test cases and uses testCasesEightHeuristic.m in order to retrieve the test cases
runIDSonTestCases.m: This file is used to run IDS on the test cases and uses testCasesEightHeuristic.m in order to retrieve the test cases
runBFSTestCases.m: This file is used to run BFS on the test cases and uses testCasesEightHeuristic.m in order to retrieve the test cases

The test cases are made with the createTests file which started from the goal state and recursively ran to move in all directions 
possible, avoiding undoing its previous move. It also used a random number to limit the number of tests created. Because of this,
the making of the test cases fails from time to time, but it can just be run again and will likely work then. The test cases file which
calls createTests takes shuffles the obtained tests at each level and then takes the first 10 objects of the array. At each level, the
objects from the level before are fed back through as the start state to create the next levels 10 states.

After both the searches and the test case generator were ready, the two were combined into each of the run<search name>TestCases.m
Each of these files begins by calling the test cases file to generate all 50 of the test cases, and then runs the specific search on
the cases. We calculated the running time by using tic and toc, and the number of iterations were generated by each of the files themselves

These files stored the data in a .mat file and the timeArray and the Insertions array are added into the createDataOutput.m file
which returns the mean and variance for both data sets as well as giving the histograms for each of the files.

For the data which the group obtained, pathcosts only up to 20 for A* and 15 for BFS and IDS were examined because after a few lost runs that lasted 12 hours and didn't
reach far into 20 pathcost states, the group had to be quit, and decided this would be the best way to still obtain data.

the run<search name>TestCases.m files may be run to obtain everything. By adding the goalstate object and initialstate to traceGoaltoInit
the user can see how that goal was found.