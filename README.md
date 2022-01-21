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

NEURON ACTIVATION
  The membrane potential on the cell is about -70, mV at the resting state.
  If a neuron is excited ffrom previous one by a neurotransmitter then the soudium channel opens
  The membrane potential increases up to treshold value which is -55mV, If excitation exceeds treshold then potassium channels also open.
  That causes the nureon fires to +50mV spike.
  At this point sodium channel closes and potential start to drop. When the potential reaches to rest value (-70 mV) then potassium channels closes/
  The potential goes below -70 and recovery state starts.
  It takes 2 ms to reaqch back to reasting
  The neuroin cannot trigger again 2 ms(if excitation is not strong, otherwiese 1 ms)
  
  So the entire process 
    1. Rising : 0.5 mS
    2. Droping : 0.5 
    3. Back to rest : 2 mS
    4. Recovery : 2 mS
    
  So the total duration is 5 ms which indicates that a neuron can fire max 1000/5 = 200 times.
  We will not allow a neuron to fire more than 200 times in a second. (Max frequency is : 200 Hz)
  
  Neuron action potential https://www.youtube.com/watch?v=BbUcWbtVjT4
  Possible neuro connections in 3d https://www.youtube.com/watch?v=QJ8AW5pi2T4
  Neuron action potential timing and relax time graph  
  
  
  
  
  
  The neuron table has to satisfy followings
  1. There is no connection to input layer neurons (sensors neurons)
  2. There is no connection from output layer to anywhere. (action neurons)

Having said that the following two queries has to generate null dataset

1. select * from weight w, neuron n where w.we_tox = n.nr_x and w.we_toy = n.nr_y and w.we_toz = n.nr_z and n.nr_type='input' order by nr_x, nr_y, nr_z
2. select * from weight w, neuron n where w.we_fromx = n.nr_x and w.we_fromy = n.nr_y and w.we_fromz = n.nr_z and n.nr_type='output' order by nr_x, nr_y, nr_z
  

  
