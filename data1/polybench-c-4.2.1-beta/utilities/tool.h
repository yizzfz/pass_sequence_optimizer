#include <stdio.h>
#include <omp.h>
#include <stdbool.h>
#include <stdlib.h>

#define TASK_START for(int TEMPVAR = 0; TEMPVAR<1; TEMPVAR++) {
#define TASK_END }

#ifdef use3state
	#define WAIT 0
	#define QUEUED 1
	#define DONE 2
	extern int* dtb_tb;	
#else
	#define WAIT 0
	#define QUEUED 0
	#define DONE 1
	extern bool* dtb_tb;	
#endif


extern int dtb_w, dtb_h;
extern int repeat;
void dtb_init(int height, int width);
bool dtb_put(int i, int j, int state);
int dtb_check(int i, int j);

