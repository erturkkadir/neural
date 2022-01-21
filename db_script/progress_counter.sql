/* input cells (100 and 110) [1, 1] ==> output cell 555 [1] */
call init_network(10);
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0; /* 100-> [1,0] */
commit;
select nr_type, count(*) from neuron where nr_status = 1  group by 1; /* must be input 1 */

/*
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=1, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;
commit;

update neuron set nr_outr=0, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 0 and  nr_z = 0;
update neuron set nr_outr=0, nr_outi = 0, nr_status = 1 where nr_x = 1 and nr_y = 1 and  nr_z = 0;
update neuron set nr_desr=1, nr_desi = 0, nr_status = 0, nr_train=1 where nr_x = 5 and nr_y = 5 and  nr_z = 5;
commit;
*/
