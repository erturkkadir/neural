/* input cells (100 and 110) [1, 1] ==> output cell 555 [1] */

/*
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0; /* 100-> [1,0] 
commit;
select nr_type, count(*) from neuron where nr_status = 1  group by 1; 
*/
/* 100 --> r:1 i:0 
   110 --> r:1 i:0		555 --> r:1 i:0
   
   101 --> r:0 i:0
   111 --> r:0 i:0		666 --> r:1 i:0
   */
update global_vars set time_stamp = 20;
update neuron set nr_fired_at=0, nr_status = 0, nr_inpr = 0, nr_outr = 0 where 1;

update neuron set nr_outr=1, nr_outi = 0, nr_status=1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 0, nr_status=1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
commit;
