#include <stdio.h>
#include <stdlib.h>
#include <mysql/mysql.h>
#include <time.h>   

int main(int argc, char **argv)
{
  MYSQL     *conn;
  MYSQL_RES  *res;
  MYSQL_ROW   row;
  MYSQL_STMT *stmt;
  MYSQL_BIND bind[1];

  char *server   = "localhost";
  char *user     = "kadir";
  char *password = "kadir_erturk";
  char *database = "ab68133_neural";
  char *qry = "call train(@result);"; 

  int err, result;


  printf("\nbefore connection \n");

  conn = mysql_init(NULL);
  if (conn == NULL) {
      printf("Error init  %u: %s\n", mysql_errno(conn), mysql_error(conn)); 
      exit(1);
  }
  
  if (mysql_real_connect(conn, server, user, password, database, 0, NULL, 0) == NULL) {
      printf("Error connect %u: %s\n", mysql_errno(conn), mysql_error(conn));
      exit(1);  
  }

  stmt = mysql_stmt_init(conn);
  mysql_stmt_prepare(stmt, qry, 40);
  while(1)
    {
    err = mysql_stmt_execute(stmt);
    if(err)
      { 
      printf("Error execute :%s\n",mysql_error(conn)); 
      exit(1); 
      }
    printf("MySQL client version: %s\n", mysql_get_client_info());
    //Sleep(2);
    }
 
  printf("MySQL client version: %s\n", mysql_get_client_info());
  mysql_close(conn);
}


