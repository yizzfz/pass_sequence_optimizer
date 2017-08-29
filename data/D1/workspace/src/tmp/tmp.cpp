#include <iostream>
#include <cstdlib>
#include <stdio.h>
#define Width 200
#define Height 300
void test(unsigned char *in, unsigned char *out)
{
  int Radius = 0;
  for (int i = 0; i < Height - Radius; i++)
  {
    for (int j = 0; j < Width - Radius; j++)
    {
	    //out[i*Width + j] = i<50? in[i*Width + j-1] : 77;
	    //if(i<10)
	      if(i%2==0)
	        out[i*Width + j]=11;
        else out[i*Width + j] = 22;
      
      /*if(i>10)
	      if(i%2==0)
	        out[i*Width + j]=33;
        else out[i*Width + j] = 44;*/
	    printf("");
    }
  }

}

int main()
{
  
  unsigned char* L = (unsigned char*)calloc((Width*Height), 1);
  unsigned char* R = (unsigned char*)calloc((Width*Height), 1);
  test(L,R);
  int cnt = 0;
  for(int i=0;i<Width*Height;i++) cnt+=R[i];
  std::cout<<cnt<<"\n";
  return 0;
}
