#define __CL_ENABLE_EXCEPTIONS

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <algorithm>
#include <signal.h>
#include <math.h>
#include <assert.h>

#define Height 223
#define Width 280

using namespace std;

void Stereo_Vision(unsigned char *L, unsigned char *R, unsigned char *Disparity_Map, int Search_Range, int Radius)
{

	int i, j, k;
	int ii, jj;
	int sr = Search_Range;


	for (i = 0; i < Height - Radius; i++)
	{
		for (j = 0; j < Width - Radius; j++)
		{

			int Distance = 0;
			float lmax = 0;

			for (k = 0; k <= min(sr, j - Radius); k++)
			{
				float sum1 = 0;
				float sum2 = 0;
				float sum3 = 0;
				float result = 0;

				for (ii = 0; ii < Radius; ii++)
				{
					for (jj = 0; jj < Radius; jj++)
					{
						sum1 += L[(i + ii)*Width + (j + jj)] * R[(i + ii)*Width + (j - k + jj)];
						sum2 += L[(i + ii)*Width + (j + jj)] * L[(i + ii)*Width + (j + jj)];
						sum3 += R[(i + ii)*Width + (j - k + jj)] * R[(i + ii)*Width + (j - k + jj)];
					}
				}
				result = sum1*sum1 / (sum2*sum3);

				Distance = (result > lmax) ? k : Distance;
				lmax = max(lmax, result);

			}
			Disparity_Map[i*Width + j] = Distance;
		}
	}
}

void Stereo_Vision_fix(unsigned char *L, unsigned char *R, unsigned char *Disparity_Map, int Search_Range)
{

	int i, j, k;
	int ii, jj;
	int sr = Search_Range;
	int Radius = 4;


	for (i = 0; i < Height - Radius; i++)
	{
		for (j = 0; j < Width - Radius; j++)
		{

			int Distance = 0;
			float lmax = 0;

			for (k = 0; k <= min(sr, j - Radius); k++)
			{
				float sum1 = 0;
				float sum2 = 0;
				float sum3 = 0;
				float result = 0;

				for (ii = 0; ii < Radius; ii++)
				{
					for (jj = 0; jj < Radius; jj++)
					{
						sum1 += L[(i + ii)*Width + (j + jj)] * R[(i + ii)*Width + (j - k + jj)];
						sum2 += L[(i + ii)*Width + (j + jj)] * L[(i + ii)*Width + (j + jj)];
						sum3 += R[(i + ii)*Width + (j - k + jj)] * R[(i + ii)*Width + (j - k + jj)];
					}
				}
				result = sum1*sum1 / (sum2*sum3);

				Distance = (result > lmax) ? k : Distance;
				lmax = max(lmax, result);

			}
			Disparity_Map[i*Width + j] = Distance;
		}
	}
}


void blur(unsigned char *in, unsigned char *out, int Radius)
{
    float coef = 1.0f/(float)(Radius*Radius);
    for (int i = 0; i < Height - Radius; i++)
	{
		for (int j = 0; j < Width - Radius; j++)
		{

			float sum=0;
			
			for (int ii = 0; ii < Radius; ii++)
			{
				for (int jj = 0; jj < Radius; jj++)
				{
					sum += (float)in[(i + ii)*Width + (j + jj)] * coef;
				}
			}
				
			out[i*Width + j] = (unsigned char)(sum);
		}
	}
}

void blur_fix(unsigned char *in, unsigned char *out)
{
    int Radius = 3;
    float coef = 1.0f/(float)(Radius*Radius);
    for (int i = 0; i < Height - Radius; i++)
	{
		for (int j = 0; j < Width - Radius; j++)
		{

			float sum=0;
			
			for (int ii = 0; ii < Radius; ii++)
			{
				for (int jj = 0; jj < Radius; jj++)
				{
					sum += (float)in[(i + ii)*Width + (j + jj)] * coef;
				}
			}
				
			out[i*Width + j] = (unsigned char)(sum);
		}
	}
}


void test(unsigned char *in, unsigned char *out)
{
  int Radius = 3;
  float coef = 1.0f/(float)(Radius*Radius);
  for (int i = 0; i < Height - Radius; i++)
  {
    for (int j = 0; j < Width - Radius; j++)
    {
	    out[i*Width + j] = in[i*Width + j-1];
    }
  }
  
  for(int k=0;k<0;k++)
  for (int i = 0; i < 100; i++)
  {
    for (int j = 0; j < 200; j++)
    {
	    out[i*Width + j] = (unsigned char)(i-j);
    }
  }
  test(in, out);
}




int main()
{
    int sr = 60;
	unsigned char* L = (unsigned char*)calloc((Height*Width), 1);
	unsigned char* R = (unsigned char*)calloc((Height*Width), 1);
	unsigned char* out1 = (unsigned char*)calloc((Height*Width), 1);
	unsigned char* out2 = (unsigned char*)calloc((Height*Width), 1);


	char s[100];
	int width, height, pix;

	FILE * fp0, *fp1, *fp2;
	fp0 = fopen("L.pgm", "rb");
	fp1 = fopen("R.pgm", "rb");

	fscanf(fp0, "%s %i %i %i", s, &width, &height, &pix);
	fscanf(fp1, "%s %i %i %i", s, &width, &height, &pix);

	for (int y = 0; y < Height; y++) {
		for (int x = 0; x < Width; x++) {
			fscanf(fp0, "%d", &L[y*Width + x]);
			fscanf(fp1, "%d", &R[y*Width + x]);
		}
	}
	fclose(fp0);
	fclose(fp1);


	cout << "finishing reading\n";

	Stereo_Vision(L, R, out1, 60, 4);
	
	Stereo_Vision_fix(L, R, out2, 60);
    //blur_fix(L,out1);
    //blur(L,out2,3);

	cout << "finishing calc\n";

		
	fp0 = fopen("disparity1.pgm", "wb");
	fp1 = fopen("disparity2.pgm", "wb");


	fprintf(fp0, "P2\n%i %i %i\n", Width, Height, 255);
	fprintf(fp1, "P2\n%i %i %i\n", Width, Height, 255);


	for (int y = 0; y < Height; y++) {
		for (int x = 0; x < Width; x++) {
			fprintf(fp0, "%d ", out1[y*Width + x]);
			fprintf(fp1, "%d ", out2[y*Width + x]);

		}
	}
	fclose(fp0);
	fclose(fp1);


	return 0;
}

