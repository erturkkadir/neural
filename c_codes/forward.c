#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>    
#include <mysql/mysql.h>



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
  char *qry = "call forward(@result);"; 

  int err, result, i;


  printf("Forward is running \n");

  conn = mysql_init(NULL);
  if (conn == NULL) {
      printf("Error init  %u: %s\n", mysql_errno(conn), mysql_error(conn)); 
      exit(1);
  }
  
  if (mysql_real_connect(conn, server, user, password, database, 0, NULL, 0) == NULL) {
      printf("Error connect %u: %s\n", mysql_errno(conn), mysql_error(conn));
      exit(1);  
  }
 


  printf("connection Success\n");


  stmt = mysql_stmt_init(conn);
  mysql_stmt_prepare(stmt, qry, 40); // 40 is the string length

  time_t now = time(0);
  printf("System started @ %s", ctime(&now));	
  char enter = 0;
  while(enter != '\r' && enter!= '\n') {
    time_t now = time(0);
    printf("in the while loop @ %s", ctime(&now));    
    err = mysql_stmt_execute(stmt);
    if(err) { 
      printf("Error execute :%s \n", mysql_error(conn)); 
      exit(1); 
      }
    printf("Command Executed  @ %s", ctime(&now));
    // enter = getchar();
    }
 
  now = time(0);
  printf("System stopped @ %s \n", ctime(&now));
  mysql_close(conn);
}
