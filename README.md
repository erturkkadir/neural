# neural
In this repo we will investigate if there is a way to replicate a small model of brain into computer

Idea: 
  To create highly specialized brain like programs that outperform human.
  Examples like;
    song composes 
    poet
    market player
    doctor
    lawyer
    ...
    ...

The tools that we will use;
  1. MySQL db to hold neurons and weights
  2. C programs to run over db asyncronously 
  3. Python programs to feed data to db


Here is a typical human brain structure
https://www.brainfacts.org/3d-brain#intro=true&focus=Brain-cerebral_hemisphere-temporal_lobe-cingulate_cortex&zoom=false


TABLE STRUCTURES
  1. Neuron:
  There is a neuron table that hold neurons, this table ideally should have 100B records, unfortunately this is not easy with available resources
On the other hand, most of the areas are reserved for life support, such as body, hormones, body sensors etc. 
Hence, we may not need that much resources and we will use only 1.000.000 records for now.
We can expand system as the hardwre available

  2. weight
  Holds connections and weights from one neuron to another. From one neuron to another in 3D space. The weights are designed as complex number, but we will use real part for simplicty. The size of this table and values in every line will be adjusted by a C program to adopt data
  
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
Cerebellum contains 70B neurons. It is known as talent center and located in deep brain (pls refer to top link)
Basically brain is the plastic structure, that means if you can feed a sensor data, the structure eventually start understand.

If you feed brain with visual sensor then it arrange itself to understyand and take proper action.

INPUT SENSORS
  1. Youtube reader that convery videos into sensory infoirmation
  2. Web page reader (reads any web page that is given by action layer)
  3. 
OUTPUT SENSOR
  1. We have to have a error matrix to inderstand desired and actual
  2. action layer may be part of output

STEP 1:
  Create two Stored Procedure 
    createnn(n_x, n_y, n_z, d_i, d_c)
      n_x : x dim of the structure, ex: 100
      n_y : y dim of the structure, ex: 100
      n_z : z dim of the structure, ex: 100
      d_i : input layer thickness,  ex: 5
      d_c : half of the output layers width

Example call;
    commit;
    call createnn(100, 100, 100, 5, 5);
    commit;

This may take 6 mins in a good hardware



    createwei
  
