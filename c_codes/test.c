#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>    
#include <mysql/mysql.h>
#include <unistd.h>

int main(int argc, char **argv)
{
  MYSQL     *con0;
  MYSQL_RES  *res;
  MYSQL_ROW   row;
  MYSQL     *con1;

  char *server   = "174.142.57.210";
  char *user     = "ekoja";
  char *password = "nila2003";
  char *database = "brain";
  char str1[200];
  char str2[200];
  char str3[400];

  int   n_layer , n_layerx, n_layery;
  float no_real, no_imag;
  int ret=0, slp =0;




  /*Connection 1********************************************************** */
  con0 = mysql_init(NULL);
  if (con0 == NULL) {
      printf("Error %u: %s\n", mysql_errno(con0), mysql_error(con0)); 
      exit(1);
  }
  if (mysql_real_connect(con0, server, user, password, database, 0, NULL, 0) == NULL) {
      printf("Error %u: %s\n", mysql_errno(con0), mysql_error(con0));
      exit(1);
  }
  /*Connection 1 Established ********************************************* */
  /*Connection 2********************************************************** */
  con1 = mysql_init(NULL);
  if (con1 == NULL) {
      printf("Error %u: %s\n", mysql_errno(con1), mysql_error(con1));
      exit(1);
  }
  if (mysql_real_connect(con1, server, user, password, database, 0, NULL, 0) == NULL) {
      printf("Error %u: %s\n", mysql_errno(con1), mysql_error(con1));
      exit(1);  
  }
  /*Connection 2 established********************************************************** */
  sprintf(str1, "update neuron set ni_real = 0, ni_imag =0  where n_status = 0");
  mysql_query(con0, str1);



  printf("Before while loop");
//  while( 1 )
    {
    /* How many neuron in active status. */
    sprintf(str1, "select n_layer, n_layerx, n_layery, no_real, no_imag from neuron where  n_status = 1 and n_output = 0");
    mysql_query(con0, str1 );
    res =  mysql_store_result(con0);

    /*Calculate the output of each neuron since we have the input for them*/
    sprintf(str1, "update neuron set no_real = 1.0/(1.0+exp(-ni_real)), no_imag = 1.0/(1.0+exp(-ni_imag)) where n_status = 1");
    mysql_query(con0, str1);

    /* Set the status 0 in order to avoid recalculation and empty inputs */
    sprintf(str1, "update neuron set n_status = 0, ni_real = 0.0,  no_imag = 0.0  where n_status = 1");
    mysql_query(con0, str1);


    sleep(slp++);
    /* Loop through the receptors  */
    while ((row=mysql_fetch_row(res)) != NULL)
      {
      n_layer  = atoi((char *)row[0]);  // in which layer
      n_layerx = atoi((char *)row[1]);  // in x coordinate
      n_layery = atoi((char *)row[2]);  // in y coordinate
      no_real  = atof((char *)row[3]);  // current output real value
      no_imag  = atof((char *)row[4]);  // current output imag value

      sprintf(str1, "update neuron, weight w set  n_status = 1, ni_real = ni_real + (w_curr * %f - w_curi * %f), ni_imag = ni_imag + (w_curr * %f + w_curi * %f) \n", no_real, no_imag, no_imag, no_real );
      sprintf(str2, "where n_layer  = w_tlayer and  n_layerx = w_tlayerx and  n_layery = w_tlayery and w_flayer = %d and w_flayerx = %d and w_flayery = %d; \n", n_layer, n_layerx, n_layery);
      sprintf(" %s %s ", str1, str2);
      //printf("/n/r SQL : %s/n/r", str3);
      mysql_query(con1, str3);          // update next layer neuron
      printf("Layer :%d Layer X :%d Layer Y : %d \n\r", n_layer, n_layerx, n_layery);
      }
     //printf("Layer :%d Layer X :%d Layer Y : %d \n\r", n_layer, n_layerx, n_layery);
     mysql_query(con1, "commit;" );   // commit to database
     mysql_free_result(res);
     sleep(slp--);
     }

  mysql_close(con0);
  mysql_close(con1);
  // printf("MySQL client version: %s\n", mysql_get_client_info());
}


