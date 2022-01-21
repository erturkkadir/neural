
update neuron set 
nr_status = 0, 
nr_inpr = 0,
nr_outr = 0,
nr_outr = 0, 
nr_outi = 0,
nr_train = 0;

/* xor example  
	1 1 ===> 1
	1 0 ===> 0
    0 1 ===> 0
    0 0 ===> 1
    
    input cells (100 and 110)
    output cell 555
*/

/* input ( [1, 1]---> output [1] */
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 1, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;


/* WAIT SOME TIME TO ERROR PROPAGATE TO */
call forward(@res); call forward(@res); call forward(@res); call forward(@res); call forward(@res); 
call forward(@res); call forward(@res); call forward(@res); call forward(@res); call forward(@res);
call forward(@res); call forward(@res); call forward(@res); call forward(@res); call forward(@res);
call forward(@res); call forward(@res); call forward(@res); call forward(@res); call forward(@res);


/* input ( [1, 0]---> output [0] */
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 1, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;
/* WAIT SOME TIME TO ERROR PROPAGATE TO */


/* input ( [0, 1]---> output [0] */
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 1, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;
/* WAIT SOME TIME TO ERROR PROPAGATE TO */


/* input ( [0, 0]---> output [1] */
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 1, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;
/* WAIT SOME TIME TO ERROR PROPAGATE TO */


commit;
/* 1.  
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res); 
call forward(@res); 
call forward(@res); 
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res);
call forward(@res); 
call forward(@res); 
*/
/* expected result in that step is only the output layer has nr_status = 1 */
/*
call backprop(@res); 
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res);
call backprop(@res); 
*/



