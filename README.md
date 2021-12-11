# neural
In this repo I will investigate if there is a way to replicate a small model of brain into computer

Idea: 
The plan is to create highly specialized brain like programs that outperform human.
Examples like;
  song composes 
  poet
  market player
  doctor
  ...
  ...

The tools I will be use;
  1. MySQL db to hold neurons and weights
  2. C programs to run over db asyncronously 


Here is the brain structure
https://www.brainfacts.org/3d-brain#intro=true&focus=Brain-cerebral_hemisphere-temporal_lobe-cingulate_cortex&zoom=false


TABLE STRUCTURES
There is a neuron table that holds neuron, this table ideally should have 100B records, however this is not easy with available resources
However even in the brain most of the areas are reserved for life support, such as body, hormones, pressure etc. 
So we may not need that much resources and we will use only 1.000.000 records for now.

Next is weights table that holds connection weight from one neuron to another.
The rest of the tables are just for helpers. Basically we will adjust these two tables while learning

We put most of the code into MySQL server as Stored procedure and functions to get best performance

C CODES
We will have multiple C codes that runs on database.
  1. formards.c this code is to calculate forward past 
  2. train.c is to push the load into backward to train network
  3. weight.c is to detriy or split weights if there is a congessin in one path
  4. youtube video listener
  5. 


the entire logic will be on the COMPLEX domain. Every numer is in the format of a+ib, so the aritmetic accordingly.





PHYSICAL STRUCTURE
Cerebellum contains 70B neurons. It is known as talent center adn located in deep brain (pls refer to top link)
Basically brain is the plastic structure, that means if you can feed a sensor data the structure eventually start understand.

If you feed brain with visual sensor then it arrange itself to understyand and take proper action.

INPUT SENSORS
  1. Youtube reader that convery videos into sensory infoirmation
  2. Web page reader (reads any web page that is given by action layer)
  3. 
OUTPUT SENSOR
  1. We have to have a error matrix to inderstand desired and actual
  2. action layer may be part of output
  3. 
  
