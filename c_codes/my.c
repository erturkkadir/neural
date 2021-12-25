/* http://www.cyberciti.biz/tips/linux-unix-connect-mysql-c-api-program.html */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>
#include <time.h>    
#include <mysql/mysql.h>


int  main(int argv, char *argc[] )
{
MYSQL *conn;
MYSQL_RES *res;
MYSQL_ROW row;
char *server = "localhost";
char *user = "kadir";
char *password = "kadir_erturk";
char *database = "ab68133_neural";
char *sql;

conn = mysql_init(NULL);

if (!mysql_real_connect(conn, server, user, password, 
    database, 0, NULL, 0)) 
  {
  fprintf(stderr, "%s\n", mysql_error(conn));
  exit(1);
  }


sql = "SELECT select n_layer, n_layerx, n_layery, n_curr, n_curi, n_prer, n_prei from neuron where  n_status = 1";
sql = "update neuron set n_status = 0";


if (mysql_query(conn, sql)) {
  fprintf(stderr, "%s\n", mysql_error(conn));
  exit(1);
}
res = mysql_use_result(conn);


mysql_free_result(res);
mysql_close(conn);
return 0;
}


void hilbert(float *x, int n, float *y)        
  {
  complex *z;
  int i, k;
  float temp;
  z=(complex *) malloc(sizeof(complex)*n);
  for(i=0;i<n;i++)
    {
    z[i].real=x[i];
    z[i].imag=0;
    }
  fft(z,n);
  k=n/2;
  z[0].real=0;
  z[0].imag=0;
  z[k].real=0;
  z[k].imag=0;
  for(i=1;i<k;i++)                       
    {
    temp=z[i].real;
    z[i].real=-z[i].imag;
    z[i].imag=temp;
    } 
  for(i=k+1;i<n;i++)                     
    {
    temp=-z[i].real;
    z[i].real=z[i].imag;
    z[i].imag=temp;
    }
  ifft(z,n);
  for(i=0;i<n;i++)  x[i]=z[i].real;
     free(z);
     }
      
void fft()
  {
  int i=0,j=0,k=0,l=0;
  complex up,down,product;
  /* change(); */
  for(i=0;i< log(size_x)/log(2) ;i++)
    {   
    l=1<<i;
    for(j=0;j<size_x;j+= 2*l )
      {             
      for(k=0;k<l;k++)
        {        
        mul(x[j+k+l],W[size_x*k/2/l],&product);
        add(x[j+k],product,&up);
        sub(x[j+k],product,&down);
        x[j+k]=up;
        x[j+k+l]=down;
        }
      }  
    }
  }


void ifft()
  {
  int i=0,j=0,k=0,l=size_x;
  complex up,down;
  for(i=0;i< (int)( log(size_x)/log(2) );i++)
    {   
    l/=2;
    for(j=0;j<size_x;j+= 2*l )
      {             
      for(k=0;k<l;k++)
        {        
        add(x[j+k],x[j+k+l],&up);
        up.real/=2;up.img/=2;
        sub(x[j+k],x[j+k+l],&down);
        down.real/=2;down.img/=2;
        divi(down,W[size_x*k/2/l],&down);
        x[j+k]=up;
        x[j+k+l]=down;
        }
     }
  }
}  
