#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define nlinks 33
#define nbitdata 16

int main(void)
{
  FILE *f1;
  int i,j;
  int count;

  f1 = fopen("input.txt","w");

  if( f1 == NULL){
    printf("\n Error opening file"); 
    //exit(0);
  }

  // Write header
  for (i=0; i < 945; i++)fprintf(f1,"=");
  fprintf(f1,"\nInput ");
  for (i=0; i < 67; i++) fprintf(f1,"       LINK_%02d",i);
  fprintf(f1,"\n");
  for (i=0; i < 945; i++) fprintf(f1,"=");
  
  
  for(count=0; count < 1024; count ++)
  {
    fprintf(f1,"\n0x%05X", count);
    if(count < 6)
    {
      for(i=0; i< 67; i++)
      {
        if(i<nlinks)
          fprintf(f1,"    0x%04X%04X", rand()%0xFFFF,rand()%0xFFFF);
        else
          fprintf(f1,"    0x00000000");
      }
    }
    else
    {
      for(i=0; i< 67; i++)
      {
        fprintf(f1,"    0x00000000");
      }
    }  
   
  } 
   
  return(0);
}

